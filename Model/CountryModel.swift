//
//  CountryModel.swift
//  Laender
//
//  Created by Domenic Moran on 08.08.22.
//

import Foundation

/// struct zum lesen der Inhalte der JSON-Datei
struct CountryModel: Decodable {
    var countryName: String
    var inhabitants: String
    var capital: String
    var currency: String
    var imageName: String
}
