local Translations = {
    error = {
        negative = 'Trying to sell a negative amount?',
        no_items = 'Insufficient Item',
        no_cops  = 'There are not enough police',
        no_cartheif = 'You Cant Smash Cars Now Come In 10 Minutes',
        no_cartheif2 = 'You Cant Smash Cars Now Come In 30 Minutes',
        no_dist = 'Shredding canceled because you moved away!',

    },
    success = {
        sold = 'You sold %{value} x %{value2} for $%{value3}',
        items_received = 'You got %{value} x %{value2}z',
    },

    blip = {
        vehicleshredding = 'Vehicle Shredding'
    },
    target = {
        label = 'Open seller',
        name = 'Vehicle Parts Dealer'
    },
    info = {
        title = 'Junkman',
        sell = 'Sell ​​Items',
        sell_chop = 'Sell ​​Items',
        sell_items = 'Sale Price $%{value}',
        back = '⬅ Turn back',
        max = 'Max. Amount %{value}',
    },

    drawtext = {
        frontleftdoor = 'Front Left Door',
        dismantlingdoor = 'Youre Dismantling the Door',
        boxfrontleftdoor = 'Box Front Left Door',
        frontleftdoorboxing = 'Front Left Door Boxing',
        frontrightdoor = 'Front right Door',
        boxfrontrightdoor = 'Box the Front Right Door',
        frontrightdoorboxing = 'Front Right Door Boxing',
        rearleftdoor = 'Rear left Door',
        boxtherearleftdoor = 'Box the Rear Left Door',
        boxingtherearleftdoor = 'Boxing the Rear Left Door',
        rearrightdoor = 'Rear right Door',
        boxrearrightdoor = 'Box Rear Right Door',
        boxingtherearrightdoor = 'Boxing the Rear Right Door',
        trunk = 'Trunk',
        youdismantletheluggage = 'You Dismantle the Luggage',
        boxluggage = 'Box Luggage',
        thetailgateisboxed = 'The Tailgate is Boxed',
        fronthood = 'Front hood',
        youareremovingthefronthood = 'You Are Removing The Front Hood',
        boxthefronthood = 'Box the Front Hood',
        fronthoodboxing = 'Boxing the Front Hood',
        radio = 'Radio',
        youdisassembletheradio = 'You Disassemble the Radio',
        radiobox = 'Radio Box',
        radioboxing = 'Radio Boxing',
        getboxedpieces = 'Get Boxed Pieces',
        collectingboxedpieces = 'Collecting Boxed Pieces',
        smashthecar = '~w~~g~[E]~w~ Smash Car'

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
