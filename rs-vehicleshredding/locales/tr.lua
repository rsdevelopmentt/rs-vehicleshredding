local Translations = {
    error = {
        negative = 'Negatif bir miktar satmaya mı çalışıyorsunuz?',
        no_items = 'Yetersiz Öğe',
        no_cops  = 'Yeterli sayıda polis yok',
        no_cartheif = 'Şimdi Araç Parçalayamazsın 30 Dakika Sonra Gel',
        no_dist = 'Uzaklaştığın için parçalama iptal oldu!'
    },

    success = {
        sold = '$%{value3} karşılığında %{value} x %{value2} sattınız',
        items_received = '%{value} x %{value2} aldınız'
    },

    blip = {
        vehicleshredding = 'Araç Parçalama'
    },
    target = {
        label = 'Satıcıyı aç',
        name = 'Araç Parça Satıcısı'
    },
    info = {
        title = 'Hurdacı',
        sell = 'Eşyaları Sat',
        sell_chop = 'Eşyaları Sat',
        sell_items = 'Satış Fiyatı $%{value}',
        back = '⬅ Geri dön',
        max = 'Maks. Tutar %{value}'
    },

    drawtext = {
        frontleftdoor = 'Ön Sol Kapı',
        dismantlingdoor = 'Kapıyı Söküyorsun',
        boxfrontleftdoor = 'Ön Sol Kapıyı Kutula',
        frontleftdoorboxing = 'Ön Sol Kapı Kutulanıyor',
        frontrightdoor = 'Ön sağ Kapı',
        boxfrontrightdoor = 'Ön Sağ Kapıyı Kutula',
        frontrightdoorboxing = 'Ön Sağ Kapı Kutulanıyor',
        rearleftdoor = 'Arka sol Kapı',
        boxtherearleftdoor = 'Arka Sol Kapıyı Kutula',
        boxingtherearleftdoor = 'Arka Sol Kapı Kutulanıyor',
        rearrightdoor = 'Arka sag Kapı',
        boxrearrightdoor = 'Arka Sag Kapıyı Kutula',
        boxingtherearrightdoor = 'Arka Sag Kapı Kutulanıyor',
        trunk = 'Bagaj',
        youdismantletheluggage = 'Bagajı Söküyorsun',
        boxluggage = 'Bagajı Kutula',
        thetailgateisboxed = 'Bagaj Kapısı Kutulanıyor',
        fronthood = 'Ön kaput',
        youareremovingthefronthood = 'Ön Kaputu Söküyorsun',
        boxthefronthood = 'Ön Kaputu Kutula',
        fronthoodboxing = 'Ön Kaput Kutulanıyor',
        radio = 'Radyo',
        youdisassembletheradio = 'Radyoyu Söküyorsun',
        radiobox = 'Radyo Kutula',
        radioboxing = 'Radyo Kutulanıyor',
        getboxedpieces = 'Kutulanan Parcaları Al',
        collectingboxedpieces = 'Kutulanmış Parçalar Toplanıyor',
        smashthecar = '~w~~g~[E]~w~ Arabayı Parçala'
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end

