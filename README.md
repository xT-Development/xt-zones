<div align="center">
  <h1>xt-zones</h1>
  <a href="https://discord.xthrasherrr.dev"> <img align="center" src="https://user-images.githubusercontent.com/101474430/233859688-2b3b9ecc-41c8-41a6-b2e3-a9f1aad473ee.gif"/></a><br>
</div>

# Features:
- Standalone. Requires you to configure your load/unload framework events
- Minimal UI displayed when entering new zones
- Supports default GTA zones and custom zones using ox_lib poly zones
- Toggle if a sound is played when entering a new zones
- Use 12hr or 24hr time format
- Configurable command to show current zone

# Dependencies:
- [ox_lib](https://github.com/CommunityOx/ox_lib/releases)

# [Preview](https://streamable.com/qgdetw)

# Exports
```lua
-- Client:
exports['xt-zones']:getCurrentZone(source, amount)      -- returns the cached value of the current zone the player is in
exports['xt-zones']:getZonePlayerIsIn(source, amount)   -- runs checks to get the zone the player is in
```