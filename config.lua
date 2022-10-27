Config = {}

Config.DrawDistance       = 3.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = false -- Set to false to disable blips.
Config.MarkerType         = 27    -- Change to -1 to disable marker.
Config.MarkerColor        = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.dispatch = 'ps-dispatch' -- You can set Police Notification export here  sample:  ps-dispatch or qb-dispatch or erp-dispatch 
Config.MinimumCops = 2
Config.BankMoney = false -- Set to true if you want the money to go into the players bank 


Config.Places = {
        [1] = {
            pedhash = `a_m_y_golfer_01`, -- hash of the ped to create
            pdot = vector3(-557.64, -1695.82, 19.16), 
            peddot = vector4(-165.16, -948.42, 38.36, 203.46),
            tped = vector3(-165.16, -948.42, 39.36)
        },
    }

Config.ChopItems = {
    [1] = {
        item = 'airbag',
        price = math.random(50,100)
    },
    [2] = { 
        item = 'lowradio',
        price = math.random(50,100)
    },
    [3] = {
        item = 'stockrim',
        price = math.random(50,100)
    },
    [4] = {
        item = 'doors',
        price = math.random(50,100)
    },
    [5] = {
        item = 'speaker',
        price = math.random(50,100)
    },
    [6] = {
        item = 'splaka',
        price = math.random(50,100)
    },
    [7] = {
        item = 'lockpick',
        price = math.random(50,100)
    },
    [8] = {
        item = 'battery',
        price = math.random(50,100)
    },
    [9] = {
        item = 'belt',
        price = math.random(50,100)
    }
}

