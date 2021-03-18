//
//  Petitions.swift
//  project7
//
//  Created by mac on 2021/3/18.
//

import Foundation



struct Petitions: Codable {
    //先抓回results 再到Petition去parse細部
    var results: [Petition]
}
