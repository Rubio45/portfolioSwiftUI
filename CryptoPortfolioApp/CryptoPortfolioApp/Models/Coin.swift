//
//  Coin.swift
//  CryptoPortfolioApp
//
//  Created by Alex Diaz on 21/8/24.
//

import Foundation

//CoinGecko API
//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=false
//JSON Response
/*
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 60749.73520833126,
     "market_cap": 1200257424730,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1276656178011,
     "total_volume": 35889348755,
     "high_24h": 61830,
     "low_24h": 58986,
     "price_change_24h": 1355.16,
     "price_change_percentage_24h": 2.28163,
     "market_cap_change_24h": 27336051767,
     "market_cap_change_percentage_24h": 2.3306,
     "circulating_supply": 19743300,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 73738,
     "ath_change_percentage": -17.562,
     "ath_date": "2024-03-14T07:10:36.635Z",
     "atl": 67.81,
     "atl_change_percentage": 89546.0314,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2024-08-22T05:25:16.258Z",
     "sparkline_in_7d": {
       "price": [
         58819.599962208355,
         58872.61696669897,
         58275.85931603416,
         58445.4062844714,
         58370.951501063326,
         58313.335500366025,
         58264.40579045636,
         58088.79404612981,
         58051.71502223428,
         58432.21244049253,
         58413.67017961424,
         58485.15425804929,
         58729.1333863503,
         58870.26610323387,
         59483.03961230005,
         59345.565722265164,
         59727.942107983596,
         59401.453819783936,
         58148.51663284134,
         57182.5690515019,
         57182.19956170608,
         56765.926472158855,
         57588.13281893597,
         57590.117286304856,
         57517.288261417954,
         57388.406266252496,
         57463.08029840291,
         58110.020444975285,
         57953.45268300431,
         58206.631385308734,
         58299.972387030146,
         58481.39741510699,
         58601.31105458154,
         58349.97587789022,
         58393.5913309717,
         58394.022290466,
         58479.15548513328,
         58107.39617493354,
         58322.02070299983,
         58087.23647718457,
         58366.058274183546,
         58602.833023575986,
         59336.92183147019,
         59546.701473360816,
         59658.822844689734,
         59257.78670650454,
         59079.85864539329,
         59008.35598447069,
         58860.57334808443,
         59217.47771557815,
         59350.615234769495,
         59152.62830970626,
         59169.67657788981,
         59217.21091899589,
         59199.61103327122,
         59102.25419430356,
         59281.64422691288,
         59281.08059915197,
         59339.07971026275,
         59144.78963688992,
         59137.83368710243,
         59235.06313556112,
         59433.059003423536,
         59445.46121861815,
         59498.10996225166,
         59650.14463574034,
         59460.11857230874,
         59428.52852368441,
         59484.96679706533,
         59406.83982049235,
         59288.15508034803,
         59408.23428651597,
         59499.06901060443,
         59693.856122052326,
         59435.352600897284,
         60333.65883815674,
         59356.667849748796,
         59549.894810626094,
         59538.08213279161,
         59592.91192725329,
         59559.95299911433,
         59703.579142448965,
         59888.7321355397,
         59934.94179051665,
         60041.75801972986,
         59994.44518304509,
         59872.80523097825,
         59840.04781384492,
         59930.31521256509,
         59765.49623994477,
         59510.6150044139,
         59563.36406864585,
         59733.69239760352,
         59801.102978831506,
         59456.77239730346,
         59353.266148667375,
         58432.42381182296,
         58409.43220948516,
         58556.84615225964,
         58705.41559394807,
         58665.163561322144,
         58587.23043883205,
         58504.10094412565,
         58566.24897215608,
         58519.30764362262,
         58676.21589770095,
         57918.457121253865,
         58122.98100656521,
         58402.72409757605,
         58802.09522936941,
         58328.473741300935,
         58614.26244380955,
         58513.14185993819,
         58716.298209367014,
         58774.585780204005,
         59033.05413379757,
         59002.276809341456,
         59116.88759892861,
         59088.38383591217,
         59150.58385642979,
         59433.2002548913,
         60957.204181296795,
         60486.4734122355,
         60570.145051408974,
         60613.0179743415,
         60934.2611610823,
         61005.78733421509,
         60948.17691922144,
         60810.769041548345,
         60913.545793254416,
         60757.57796842585,
         60604.46221206046,
         60542.53727609908,
         60513.22423696902,
         60903.501101464666,
         59169.10290355411,
         58999.583067501706,
         58868.05861956446,
         59227.33377346871,
         59292.82539415719,
         59561.42502840903,
         59060.772363156204,
         59477.46876924232,
         59287.74283482554,
         59060.12610074137,
         59009.13331494045,
         59295.06644147175,
         59410.03562420505,
         59242.4062301116,
         59370.33738264078,
         59610.019205226825,
         59688.748544613954,
         59505.209064536895,
         59341.323684985815,
         59272.94103896139,
         59433.15898376004,
         59398.14200516048,
         59517.04183871499,
         59931.75994130691,
         59518.13288406425,
         59500.585638116,
         59834.744187742945,
         59944.1339303113,
         60792.81990824211,
         61524.47420600682,
         61014.719001986436,
         61350.064462403796,
         61196.416673763524
       ]
     }
 */
// MARK: - Coin

class Coin: Codable, Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Int?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String
    let priceChangePercentage24HInCurrency: Double?
    let sparklineIn7D: SparklineIn7D?
    let currentHolding: Double?
    
    
    
    init(id: String, symbol: String, name: String, image: String, currentPrice: Double, marketCap: Double?, marketCapRank: Int?, fullyDilutedValuation: Double?, totalVolume: Double?, high24H: Double?, low24H: Double?, priceChange24H: Double?, priceChangePercentage24H: Double?, marketCapChange24H: Double?, marketCapChangePercentage24H: Double?, circulatingSupply: Double?, totalSupply: Double?, maxSupply: Double?, ath: Double?, athChangePercentage: Double?, athDate: String?, atl: Double?, atlChangePercentage: Double?, atlDate: String?, lastUpdated: String, priceChangePercentage24HInCurrency: Double?, sparklineIn7D: SparklineIn7D?, currentHolding: Double?) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.fullyDilutedValuation = fullyDilutedValuation
        self.totalVolume = totalVolume
        self.high24H = high24H
        self.low24H = low24H
        self.priceChange24H = priceChange24H
        self.priceChangePercentage24H = priceChangePercentage24H
        self.marketCapChange24H = marketCapChange24H
        self.marketCapChangePercentage24H = marketCapChangePercentage24H
        self.circulatingSupply = circulatingSupply
        self.totalSupply = totalSupply
        self.maxSupply = maxSupply
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.athDate = athDate
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
        self.atlDate = atlDate
        self.lastUpdated = lastUpdated
        self.priceChangePercentage24HInCurrency = priceChangePercentage24HInCurrency
        self.sparklineIn7D = sparklineIn7D
        self.currentHolding = currentHolding
    }
    

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case sparklineIn7D = "sparkline_in_7d"
    }

    // Init
    

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        currentPrice = try container.decode(Double.self, forKey: .currentPrice)
        marketCap = try container.decodeIfPresent(Double.self, forKey: .marketCap)
        marketCapRank = try container.decodeIfPresent(Int.self, forKey: .marketCapRank)
        fullyDilutedValuation = try container.decodeIfPresent(Double.self, forKey: .fullyDilutedValuation)
        totalVolume = try container.decodeIfPresent(Double.self, forKey: .totalVolume)
        high24H = try container.decodeIfPresent(Double.self, forKey: .high24H)
        low24H = try container.decodeIfPresent(Double.self, forKey: .low24H)
        priceChange24H = try container.decodeIfPresent(Double.self, forKey: .priceChange24H)
        priceChangePercentage24H = try container.decodeIfPresent(Double.self, forKey: .priceChangePercentage24H)
        marketCapChange24H = try container.decodeIfPresent(Double.self, forKey: .marketCapChange24H)
        marketCapChangePercentage24H = try container.decodeIfPresent(Double.self, forKey: .marketCapChangePercentage24H)
        circulatingSupply = try container.decodeIfPresent(Double.self, forKey: .circulatingSupply)
        totalSupply = try container.decodeIfPresent(Double.self, forKey: .totalSupply)
        maxSupply = try container.decodeIfPresent(Double.self, forKey: .maxSupply)
        ath = try container.decodeIfPresent(Double.self, forKey: .ath)
        athChangePercentage = try container.decodeIfPresent(Double.self, forKey: .athChangePercentage)
        athDate = try container.decodeIfPresent(String.self, forKey: .athDate)
        atl = try container.decodeIfPresent(Double.self, forKey: .atl)
        atlChangePercentage = try container.decodeIfPresent(Double.self, forKey: .atlChangePercentage)
        atlDate = try container.decodeIfPresent(String.self, forKey: .atlDate)
        lastUpdated = try container.decode(String.self, forKey: .lastUpdated)
        priceChangePercentage24HInCurrency = try container.decodeIfPresent(Double.self, forKey: .priceChangePercentage24HInCurrency)
        sparklineIn7D = try container.decodeIfPresent(SparklineIn7D.self, forKey: .sparklineIn7D)
        currentHolding = nil
    }
    
    // Factory method to fetch Coin data from API
    static func fetchCoin(by id: String, completion: @escaping (Result<Coin, Error>) -> Void) {
        let urlString = "https://api.coingecko.com/api/v3/coins/\(id)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let coin = try JSONDecoder().decode(Coin.self, from: data)
                completion(.success(coin))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // Hacer un refresh facilmente
    func refresh(completion: @escaping (Result<Coin, Error>) -> Void) {
        Coin.fetchCoin(by: self.id) { result in
            switch result {
            case .success(let updatedCoin):
                completion(.success(updatedCoin))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    var currentHoldingsValue: Double {
           return (currentHolding ?? 0) * self.currentPrice
       }
       
    var rank: Int {
           return Int(marketCapRank ?? 0)
       }
}

// MARK: - SparklineIn7D
class SparklineIn7D: Codable {
    let price: [Double]

    init(price: [Double]) {
        self.price = price
    }
}
