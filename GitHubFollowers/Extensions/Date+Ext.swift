//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 07/02/2022.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        return formatted(.dateTime.month().year())
    }
}
