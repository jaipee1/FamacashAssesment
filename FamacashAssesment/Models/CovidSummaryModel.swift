//
//  CovidSummaryModel.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import Foundation

// MARK: - CovidSummary
struct CovidSummary: Codable {
    var global: Global?
    var countries: [Country]?
    var date: String?

    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}
