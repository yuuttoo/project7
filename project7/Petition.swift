//
//  Petition.swift
//  project7
//
//  Created by mac on 2021/3/18.
//

import Foundation


//準備抓回來的資料儲存結構與轉型(parse)
struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
