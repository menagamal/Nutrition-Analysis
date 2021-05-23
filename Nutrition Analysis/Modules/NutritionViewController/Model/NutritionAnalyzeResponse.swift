

import Foundation
struct NutritionAnalyzeResponse : Codable {
	let uri : String?
	let yield : Double?
	let calories : Int?
	let totalWeight : Double?
	let dietLabels : [String]?
	let healthLabels : [String]?
	let cautions : [String]?
	let totalNutrients : TotalNutrients?
	let totalDaily : TotalDaily?
	let totalNutrientsKCal : TotalNutrientsKCal?

	enum CodingKeys: String, CodingKey {

		case uri = "uri"
		case yield = "yield"
		case calories = "calories"
		case totalWeight = "totalWeight"
		case dietLabels = "dietLabels"
		case healthLabels = "healthLabels"
		case cautions = "cautions"
		case totalNutrients = "totalNutrients"
		case totalDaily = "totalDaily"
		case totalNutrientsKCal = "totalNutrientsKCal"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		yield = try values.decodeIfPresent(Double.self, forKey: .yield)
		calories = try values.decodeIfPresent(Int.self, forKey: .calories)
		totalWeight = try values.decodeIfPresent(Double.self, forKey: .totalWeight)
		dietLabels = try values.decodeIfPresent([String].self, forKey: .dietLabels)
		healthLabels = try values.decodeIfPresent([String].self, forKey: .healthLabels)
		cautions = try values.decodeIfPresent([String].self, forKey: .cautions)
		totalNutrients = try values.decodeIfPresent(TotalNutrients.self, forKey: .totalNutrients)
		totalDaily = try values.decodeIfPresent(TotalDaily.self, forKey: .totalDaily)
		totalNutrientsKCal = try values.decodeIfPresent(TotalNutrientsKCal.self, forKey: .totalNutrientsKCal)
	}

}
