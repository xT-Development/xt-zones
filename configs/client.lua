return {
    playerLoadEvent = 'QBCore:Client:OnPlayerLoaded',       -- Framework specific event for player load
    playerUnloadEvent = 'QBCore:Client:OnPlayerUnload',     -- Framework specific event for player unload

    defaultPosition = "top-right",          -- Default position of the UI (bottom-right, bottom-left, top-right, top-left, top-center, bottom-center)
    defaultTextColor = "#00ffcc",         -- Default text color of the UI
    defaultSecondTextColor = "#ffffff",   -- Default secondary text color of the UI
    playZoneSound = true,                   -- Play sound when entering a new zone

    showZoneCommand = 'zoneinfo',           -- Command to show zone information

    use12HourFormat = true,                 -- Set to true for 12-hour format, false for 24-hour format

    debug = false,                          -- Enable debug mode for custom zones

    customZones = {                         -- Custom zones using ox_lib's poly zones
        ['vagos'] = {                       -- Unique identifier for the custom zone
            name = "Vagos Territory",       -- Custom name for the zone (this is displayed)
            points = {
                vector3(241.78, -2072.16, 20),
                vector3(318.71, -2143.60, 20),
                vector3(342.89, -2158.99, 20),
                vector3(372.56, -2154.59, 20),
                vector3(460.48, -2060.08, 20),
                vector3(351.68, -1944.68, 20)
            },
            thickness = 20
        }
    }
}