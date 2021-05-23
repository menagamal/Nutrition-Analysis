/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TotalNutrientsKCal : Codable {
	let pROCNT_KCAL : PROCNT_KCAL?
	let fAT_KCAL : FAT_KCAL?
	let cHOCDF_KCAL : CHOCDF_KCAL?

	enum CodingKeys: String, CodingKey {

		case pROCNT_KCAL = "PROCNT_KCAL"
		case fAT_KCAL = "FAT_KCAL"
		case cHOCDF_KCAL = "CHOCDF_KCAL"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pROCNT_KCAL = try values.decodeIfPresent(PROCNT_KCAL.self, forKey: .pROCNT_KCAL) ?? nil
		fAT_KCAL = try values.decodeIfPresent(FAT_KCAL.self, forKey: .fAT_KCAL) ?? nil
		cHOCDF_KCAL = try values.decodeIfPresent(CHOCDF_KCAL.self, forKey: .cHOCDF_KCAL) ?? nil
	}

}
