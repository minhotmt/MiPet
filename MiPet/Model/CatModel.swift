//
//  CatModel.swift
//  MiPet
//
//  Created by MinKo on 5/16/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import Foundation
import UIKit

struct TypeCatAll: Decodable {
    var typecat: [TypeCats]
}

struct TypeCats : Decodable {
    var name: String
    var type: String
    var title: String
    var descripton: String
    var image: [String]
    var thumnail: String
}

struct TypeHealthy: Decodable {
    var healthys: [Healthy]
}

struct Healthy: Decodable {
    var name: String
    var fix: String
    var bieuhien: String
    var image: [String]
    var thumnail: String
}

struct TypeMatching: Decodable {
    var matching: [MatchingCat]
}

struct MatchingCat: Decodable {
    var name: String
    var how: String
    var note: String
    var image: [String]
    var thumnail: String
}

struct TypeEat: Decodable {
    var eat: [Eat]
}

struct Eat: Decodable {
    var name: String
    var how: String
    var image: [String]
    var thumnail: String
}
