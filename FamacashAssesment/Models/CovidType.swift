//
//  CovidType.swift
//  FamacashAssesment
//
//  Created by jaipee on 10/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import Foundation

// MARK: - GlobalType
protocol GlobalType {
    var newConfirmed: Int? { get set }
    var totalConfirmed: Int? { get set }
    var newDeaths: Int? { get set }
    var totalDeaths: Int? { get set }
    var newRecovered: Int? { get set }
    var totalRecovered: Int? { get set }
}
