/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct TotalDaily : Codable {
	let fAT : FAT?
	let fASAT : FASAT?
	let cHOCDF : CHOCDF?
	let fIBTG : FIBTG?
	let pROCNT : PROCNT?
	let cHOLE : CHOLE?
	let nA : NA?
	let cA : CA?
	let mG : MG?
	let k : K?
	let fE : FE?
	let zN : ZN?
	let p : P?
	let vITA_RAE : VITA_RAE?
	let vITC : VITC?
	let tHIA : THIA?
	let rIBF : RIBF?
	let nIA : NIA?
	let vITB6A : VITB6A?
	let fOLDFE : FOLDFE?
	let vITB12 : VITB12?
	let vITD : VITD?
	let tOCPHA : TOCPHA?
	let vITK1 : VITK1?

	enum CodingKeys: String, CodingKey {

		case fAT = "FAT"
		case fASAT = "FASAT"
		case cHOCDF = "CHOCDF"
		case fIBTG = "FIBTG"
		case pROCNT = "PROCNT"
		case cHOLE = "CHOLE"
		case nA = "NA"
		case cA = "CA"
		case mG = "MG"
		case k = "K"
		case fE = "FE"
		case zN = "ZN"
		case p = "P"
		case vITA_RAE = "VITA_RAE"
		case vITC = "VITC"
		case tHIA = "THIA"
		case rIBF = "RIBF"
		case nIA = "NIA"
		case vITB6A = "VITB6A"
		case fOLDFE = "FOLDFE"
		case vITB12 = "VITB12"
		case vITD = "VITD"
		case tOCPHA = "TOCPHA"
		case vITK1 = "VITK1"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fAT = try values.decodeIfPresent(FAT.self, forKey: .fAT) ?? nil
		fASAT = try values.decodeIfPresent(FASAT.self, forKey: .fASAT) ?? nil
		cHOCDF = try values.decodeIfPresent(CHOCDF.self, forKey: .cHOCDF) ?? nil
		fIBTG = try values.decodeIfPresent(FIBTG.self, forKey: .fIBTG) ?? nil
		pROCNT = try values.decodeIfPresent(PROCNT.self, forKey: .pROCNT) ?? nil
		cHOLE = try values.decodeIfPresent(CHOLE.self, forKey: .cHOLE) ?? nil
		nA = try values.decodeIfPresent(NA.self, forKey: .nA) ?? nil
		cA = try values.decodeIfPresent(CA.self, forKey: .cA) ?? nil
		mG = try values.decodeIfPresent(MG.self, forKey: .mG) ?? nil
		k = try values.decodeIfPresent(K.self, forKey: .k) ?? nil
		fE = try values.decodeIfPresent(FE.self, forKey: .fE) ?? nil
		zN = try values.decodeIfPresent(ZN.self, forKey: .zN) ?? nil
		p = try values.decodeIfPresent(P.self, forKey: .p) ?? nil
		vITA_RAE = try values.decodeIfPresent(VITA_RAE.self, forKey: .vITA_RAE) ?? nil
		vITC = try values.decodeIfPresent(VITC.self, forKey: .vITC) ?? nil
		tHIA = try values.decodeIfPresent(THIA.self, forKey: .tHIA) ?? nil
		rIBF = try values.decodeIfPresent(RIBF.self, forKey: .rIBF) ?? nil
		nIA = try values.decodeIfPresent(NIA.self, forKey: .nIA) ?? nil
		vITB6A = try values.decodeIfPresent(VITB6A.self, forKey: .vITB6A) ?? nil
		fOLDFE = try values.decodeIfPresent(FOLDFE.self, forKey: .fOLDFE) ?? nil
		vITB12 = try values.decodeIfPresent(VITB12.self, forKey: .vITB12) ?? nil
		vITD = try values.decodeIfPresent(VITD.self, forKey: .vITD) ?? nil
		tOCPHA = try values.decodeIfPresent(TOCPHA.self, forKey: .tOCPHA) ?? nil
		vITK1 = try values.decodeIfPresent(VITK1.self, forKey: .vITK1) ?? nil
	}

}
