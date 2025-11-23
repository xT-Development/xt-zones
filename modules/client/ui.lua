local config = require 'configs.client'
local defaultPosition = config.defaultPosition
local defaultTextColor = config.defaultTextColor
local defaultSecondTextColor = config.defaultSecondTextColor
local use12HourFormat = config.use12HourFormat
local playZoneSound = config.playZoneSound
local zones = LoadResourceFile(GetCurrentResourceName(), "configs/zones.json")
zones = json.decode(zones)

-- get in-game time
local function getInGameTime()
    local hours = GetClockHours()
    local minutes = GetClockMinutes()

    if use12HourFormat then
        local suffix = "AM"
        if hours >= 12 then
            suffix = "PM"
            if hours > 12 then
                hours = hours - 12
            end
        elseif hours == 0 then
            hours = 12
        end

        return ("%02d:%02d %s"):format(hours, minutes, suffix)
    end

    return ("%02d:%02d"):format(hours, minutes)
end

local ui_utils = {}

function ui_utils.showZone(zone, position, color, secondColor)
    local zoneName = config.customZones[zone] and config.customZones[zone].name or zones[zone] or "Unknown Area"

    if playZoneSound then
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", true)
    end

    SendNUIMessage({
        action = "showZone",
        zone = zoneName,
        time = getInGameTime(),
        position = position or defaultPosition,
        color = color or defaultTextColor,
        secondColor = secondColor or defaultSecondTextColor
    })
end

return ui_utils