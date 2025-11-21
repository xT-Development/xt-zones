local config = require 'configs.client'
local ui_utils = require 'modules.client.ui'
local zones = LoadResourceFile(GetCurrentResourceName(), "configs/zones.json")
zones = json.decode(zones)

-- data
local currentZone = "None"
local customZones = {}

-- zones utilities
local zones_utils = {}

-- get the cached current zone
function zones_utils.getCurrentZone()
    return currentZone
end exports('getCurrentZone', zones_utils.getCurrentZone)

-- get the zone player is currently in
function zones_utils.getZonePlayerIsIn()
    local coords = GetEntityCoords(cache.ped)
    local zone = GetNameOfZone(coords.x, coords.y, coords.z)

    return config.customZones[currentZone] and currentZone or zones[zone] and zone or "Unknown Area"
end exports('getZonePlayerIsIn', zones_utils.getZonePlayerIsIn)

-- player enters a zone
function zones_utils.enteredZone(zone)
    if currentZone == zone then return end

    currentZone = zone

    local zoneName = config.customZones[zone] and config.customZones[zone].name or zones[zone] or "Unknown Area"

    ui_utils.showZone(zoneName)
end

-- player exits a zone
function zones_utils.exitedZone()
    currentZone = "None" -- reset first so we can get the correct zone
    currentZone = zones_utils.getZonePlayerIsIn() -- get the new zone

    ui_utils.showZone(currentZone) -- show new zone
end

-- create custom zones
function zones_utils.createCustomZones()
    if not config.customZones or not next(config.customZones) then return end

    for zoneId, zone in pairs(config.customZones) do
        customZones[#customZones + 1] = lib.zones.poly({
            points = zone.points,
            thickness = zone.thickness or 20.0,
            debug = true,
            onEnter = function()
                if currentZone ~= zoneId then
                    zones_utils.enteredZone(zoneId)
                end
            end,
            onExit = function()
                zones_utils.exitedZone()
            end
        })
    end
end

-- destroy custom zones
function zones_utils.destroyCustomZones()
    for x = 1, #customZones do
        customZones[x]:remove()
    end
end

return zones_utils