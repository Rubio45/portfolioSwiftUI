//
//  MarketData.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 22/8/24.
//

import Foundation

//DATA
/*
 {
   "data": {
     "active_cryptocurrencies": 14649,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1178,
     "total_market_cap": {
       "btc": 37070098.358688235,
       "eth": 846644495.9380711,
       "ltc": 35256176066.32215,
       "bch": 6452878956.238805,
       "bnb": 3867181868.297918,
       "eos": 4238828389301.534,
       "xrp": 3769964152700.6084,
       "xlm": 22605690518903.51,
       "link": 194806794583.42053,
       "dot": 476095502449.0182,
       "yfi": 430482079.65344757,
       "usd": 2262591311436.885,
       "aed": 8310192437080.645,
       "ars": 2138685702226061.8,
       "aud": 3365853460806.6245,
       "bdt": 271013289100519.06,
       "bhd": 852653010532.3674,
       "bmd": 2262591311436.885,
       "brl": 12652184354423.906,
       "cad": 3076106017464.0195,
       "chf": 1926863487463.2588,
       "clp": 2080475336779328.8,
       "cny": 16150150521905.36,
       "czk": 50996093050213.58,
       "dkk": 15172464452911.664,
       "eur": 2033368185675.214,
       "gbp": 1725818673894.2207,
       "gel": 6108996540879.597,
       "hkd": 17642442621363.55,
       "huf": 800205261522648.9,
       "idr": 35153144487963150,
       "ils": 8402675856935.624,
       "inr": 189784575389407.88,
       "jpy": 329464971223570.7,
       "krw": 3028297551294418,
       "kwd": 691628912080.0288,
       "lkr": 682988612095792,
       "mmk": 4746916571394603,
       "mxn": 44105450401928.72,
       "myr": 9906756057126.418,
       "ngn": 3567767109439254.5,
       "nok": 23931310646319.76,
       "nzd": 3676231211726.9136,
       "php": 127646340113066.84,
       "pkr": 631953948651490,
       "pln": 8707763669369.778,
       "rub": 207024312958796.6,
       "sar": 8489520899242.493,
       "sek": 23144017111000.84,
       "sgd": 2959774885186.491,
       "thb": 77628376599743.83,
       "try": 76809090023281.06,
       "twd": 72407444886012.03,
       "uah": 93697306881342.45,
       "vef": 226553268014.17538,
       "vnd": 56501226842606504,
       "zar": 40689650237921.87,
       "xdr": 1695617605069.1606,
       "xag": 77390600878.82484,
       "xau": 906846597.6239046,
       "bits": 37070098358688.234,
       "sats": 3707009835868823.5
     },
     "total_volume": {
       "btc": 1145982.4057828593,
       "eth": 26173108.226202723,
       "ltc": 1089906939.9884274,
       "bch": 199483844.8752853,
       "bnb": 119549787.49046732,
       "eos": 131038841825.29984,
       "xrp": 116544405888.10622,
       "xlm": 698830722124.7018,
       "link": 6022243506.328137,
       "dot": 14717982779.537237,
       "yfi": 13307892.644747844,
       "usd": 69945588201.44409,
       "aed": 256900702809.4973,
       "ars": 66115178938444.92,
       "aud": 104051756464.35025,
       "bdt": 8378085702320.442,
       "bhd": 26358855022.53781,
       "bmd": 69945588201.44409,
       "brl": 391128734663.6549,
       "cad": 95094524439.27339,
       "chf": 59566921932.93747,
       "clp": 64315667807109.82,
       "cny": 499264614023.08844,
       "czk": 1576489623354.7056,
       "dkk": 469040495850.95013,
       "eur": 62859400660.75579,
       "gbp": 53351836747.70989,
       "gel": 188853088143.8993,
       "hkd": 545397226721.35065,
       "huf": 24737489009248.934,
       "idr": 1086721829042754.1,
       "ils": 259759728727.23123,
       "inr": 5866986976425.389,
       "jpy": 10185056880365.086,
       "krw": 93616576888454.78,
       "kwd": 21380967401.41749,
       "lkr": 21113861777180.574,
       "mmk": 146745844046630.28,
       "mxn": 1363472782582.803,
       "myr": 306256757940.0235,
       "ngn": 110293700755447.2,
       "nok": 739810849236.0885,
       "nzd": 113646752362.64795,
       "php": 3946049954244.7324,
       "pkr": 19536179791383.723,
       "pln": 269191191840.3141,
       "rub": 6399935007576.293,
       "sar": 262444450239.16687,
       "sek": 715472512419.9248,
       "sgd": 91498272021.89613,
       "thb": 2399798158397.447,
       "try": 2374470790964.111,
       "twd": 2238398643677.0303,
       "uah": 2896551935640.8657,
       "vef": 7003651746.6106,
       "vnd": 1746674941087599,
       "zar": 1257876977258.8982,
       "xdr": 52418203036.396996,
       "xag": 2392447576.5333548,
       "xau": 28034191.75113883,
       "bits": 1145982405782.8594,
       "sats": 114598240578285.94
     },
     "market_cap_percentage": {
       "btc": 53.26068954271492,
       "eth": 14.205273220094607,
       "usdt": 5.204674610809043,
       "bnb": 3.7729505437223225,
       "sol": 3.0032688888627925,
       "usdc": 1.5310376800129633,
       "xrp": 1.490690270506727,
       "steth": 1.1577042348543705,
       "ton": 0.7337825349696779,
       "doge": 0.6908416420241258
     },
     "market_cap_change_percentage_24h_usd": 0.38391919002886826,
     "updated_at": 1724390867
   }
 }
 */

// URL: https://api.coingecko.com/api/v3/global

// MARK: - Welcome
class GlobalData: Codable {
    let data: MarketData?

    init(data: MarketData?) {
        self.data = data
    }
}

// MARK: - DataClass
class MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    init(totalMarketCap: [String: Double], totalVolume: [String: Double], marketCapPercentage: [String: Double], marketCapChangePercentage24HUsd: Double) {
        self.totalMarketCap = totalMarketCap
        self.totalVolume = totalVolume
        self.marketCapPercentage = marketCapPercentage
        self.marketCapChangePercentage24HUsd = marketCapChangePercentage24HUsd
    }
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd"}) {
            return "$" + "\(item.value)"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd"}) {
            return "$" + "\(item.value)"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc"}) {
            return String(format: "%.2f%%", item.value)
        }
        return ""
    }
}

