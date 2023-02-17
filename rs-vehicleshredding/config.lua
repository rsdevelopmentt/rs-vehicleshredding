Config = {}

Config.DrawDistance       = 3.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = false -- Set to false to disable blips.
Config.MarkerType         = 27    -- Change to -1 to disable marker.
Config.MarkerColor        = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.dispatch = 'ps-dispatch' -- You can set Police Notification export here  sample:  ps-dispatch or qb-dispatch or erp-dispatch 
Config.MinimumCops = 6
Config.BankMoney = false -- Set to true if you want the money to go into the players bank 


Config.Places = {
        [1] = {
            pedhash = `a_m_y_golfer_01`, -- hash of the ped to create
            pdot = vector3(-557.64, -1695.82, 19.16), 
            peddot = vector4(-448.43, -2184.05, 9.32, 0.0),
            tped = vector3(-448.43, -2184.05, 9.32)
        },
    }

Config.ChopItems = {
    [1] = {
        item = 'airbag',
        price = 225
    },
    [2] = { 
        item = 'lowradio',
        price = 275
    },
    [3] = {
        item = 'stockrim',
        price = 225
    },
    [4] = {
        item = 'doors',
        price = 310
    },
    [5] = {
        item = 'speaker',
        price = 220
    },
    [6] = {
        item = 'splaka',
        price = 525
    },
    [7] = {
        item = 'battery',
        price = 210
    },
    [8] = {
        item = 'belt',
        price = 200
    },
    [9] = {
        item = 'highradio',
        price = 225
    },
    [10] = {
        item = 'highrim',
        price = 400
    },

}

