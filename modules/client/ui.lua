local use12HourFormat = require 'configs.client'.use12HourFormat
local playZoneSound = require 'configs.client'.playZoneSound

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

function ui_utils.showZone(zoneName)
    if playZoneSound then
        PlaySoundFrontend(-1, "FocusOut", "HintCamSounds", true)
    end

    SendNUIMessage({
        action = "showZone",
        zone = zoneName,
        time = getInGameTime()
    })
end

return ui_utils