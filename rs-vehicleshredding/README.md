# rs-vehicleshredding

- the whole script does not belong to me, I just developed and shared it on a system

# Installation:

- Drag and drop the folder in your resources
- Start the resource
- Enjoy

# Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)

- [qb-menu](https://github.com/qbcore-framework/qb-menu)

- [qb-input](https://github.com/qbcore-framework/qb-input)

- [qb-target](https://github.com/qbcore-framework/qb-target)

- [rs-fakeplate](https://github.com/rsdevelopmentt/rs-fakeplate)



# Setup

- Copy the images from images folder to [your-inventory]\html\images

- Add the following items to qb-core\shared\items.lua
```lua
 ['splaka'] 			 = {['name'] = 'splaka', 		['label'] = 'Fake Plate', 		        ['weight'] = 150, 		['type'] = 'item', 		['image'] = 'plaka.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Fake Plate'},
   ['airbag'] 			 = {['name'] = 'airbag', 		['label'] = 'AirBag', 		            ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'airbag.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'AirBag'},
   ['lowradio'] 		 = {['name'] = 'lowradio', 		['label'] = 'Low Quality Radio', 		['weight'] = 350, 		['type'] = 'item', 		['image'] = 'lowradio.png', 	['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Low Quality Radio'},
   ['stockrim'] 		 = {['name'] = 'stockrim', 		['label'] = 'Low Quality Wheel', 		['weight'] = 150, 		['type'] = 'item', 		['image'] = 'stockrim.png', 	['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Low Quality Wheel'},
   ['highradio'] 		 = {['name'] = 'highradio', 	['label'] = 'High Quality Radio', 		['weight'] = 250, 		['type'] = 'item', 		['image'] = 'highradio.png', 	['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'High Quality Radio'},
   ['highrim'] 			 = {['name'] = 'highrim', 		['label'] = 'High Quality Wheel', 		['weight'] = 350, 		['type'] = 'item', 		['image'] = 'highrim.png', 		['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'High Quality Wheel'},
   ['doors'] 			   = {['name'] = 'doors', 		['label'] = 'Doors', 		            ['weight'] = 150, 		['type'] = 'item', 		['image'] = 'doors.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Doors'},
   ['speaker'] 			 = {['name'] = 'speaker', 		['label'] = 'Speaker', 		        ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'speaker.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Speaker'},
   ['screwdriver'] 	 = {['name'] = 'screwdriver', 	['label'] = 'Screwdriver', 		        ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'screwdriver.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Screwdriver'},
   ['battery'] 	 = {['name'] = 'battery', 	['label'] = 'Battery', 		        ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'battery.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Battery'},
   ['belt'] 	 = {['name'] = 'screwdriver', 	['label'] = 'Belt', 		        ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'belt.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Belt'},
   ['lockpick'] 	 = {['name'] = 'lockpick', 	['label'] = 'Lockpick', 		        ['weight'] = 250, 		['type'] = 'item', 		['image'] = 'lockpick.png', 	    ['unique'] = false,    ['useable'] = true, 	   ['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Lockpick'},
```

# Dispatch Export

- Example ps-dispatch
- Copy and paste [yourdispatch]\client/cl_extraalerts.

```lua
local function chopcar()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "chopcar", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-50",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = "Car smashing attempt", -- message
        job = {"police"} -- jobs that will get the alerts
    })
end exports('chopcar', chopcar)
```
Copy and paste [yourdispatch]\server/sv_dispatchcodes.
```lua
["chopcar"] =  {displayCode = '10-50', description = "Car smashing attempt", radius = 0, recipientList = {'police'}, blipSprite = 326, blipColour = 84, blipScale = 1.5, blipLength = 2, sound = "Lose_1st", sound2 = "GTAO_FM_Events_Soundset"},
```

# Explanation

- Optimized 0.0 resmon

- Giving random items

- Easy configurable config.lua

- Please download rs-fakeplate for splaka item to work



# (For any help you can reach us at Discord)

- Discord: [rs-development](https://discord.gg/WhRgsxp4A6)
