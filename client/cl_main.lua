local config = require 'configs.client'
local zones_utils = require 'modules.client.zones'
local ui_utils = require 'modules.client.ui'

local loaded = false

-- main thread to monitor gta zone changes
CreateThread(function()
    while true do
        if loaded then
            local coords = GetEntityCoords(cache.ped)
            local zone = zones_utils.getZonePlayerIsIn()
            local currentZone = zones_utils.getCurrentZone()

            if zone ~= currentZone then
                zones_utils.enteredZone(zone)
            end
        end

        Wait(3000)
    end
end)

-- command to display current zone
RegisterCommand(config.showZoneCommand, function()
    local coords = GetEntityCoords(cache.ped)
    local currentZone = zones_utils.getCurrentZone()

    ui_utils.showZone(currentZone)
end)

-- load/unload handlers
AddEventHandler('onResourceStart', function(resource)
   if resource ~= GetCurrentResourceName() then return end

   zones_utils.createCustomZones()
end)

AddEventHandler('onResourceStop', function(resource)
   if resource ~= GetCurrentResourceName() then return end

   zones_utils.destroyCustomZones()
end)

RegisterNetEvent(config.playerLoadEvent, function()
    loaded = true
    zones_utils.createCustomZones()
end)

RegisterNetEvent(config.playerUnloadEvent, function()
    loaded = false
    zones_utils.destroyCustomZones()
end)