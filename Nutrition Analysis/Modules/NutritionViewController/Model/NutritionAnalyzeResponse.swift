

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
		uri = try values.decodeIfPresent(String.self, forKey: .uri) ?? nil
		yield = try values.decodeIfPresent(Double.self, forKey: .yield) ?? nil
		calories = try values.decodeIfPresent(Int.self, forKey: .calories) ?? nil
		totalWeight = try values.decodeIfPresent(Double.self, forKey: .totalWeight) ?? nil
		dietLabels = try values.decodeIfPresent([String].self, forKey: .dietLabels) ?? nil
		healthLabels = try values.decodeIfPresent([String].self, forKey: .healthLabels) ?? nil
		cautions = try values.decodeIfPresent([String].self, forKey: .cautions) ?? nil
		totalNutrients = try values.decodeIfPresent(TotalNutrients.self, forKey: .totalNutrients) ?? nil
		totalDaily = try values.decodeIfPresent(TotalDaily.self, forKey: .totalDaily) ?? nil
		totalNutrientsKCal = try values.decodeIfPresent(TotalNutrientsKCal.self, forKey: .totalNutrientsKCal) ?? nil
	}

}
