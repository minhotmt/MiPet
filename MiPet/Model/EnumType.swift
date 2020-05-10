//
//  EnumType.swift
//  MiPet
//
//  Created by MinKo on 5/17/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import Foundation

enum TypeMenu {
    case TypeCat
    case Healthy
    case Eat
    case Matching
    
    var count: Int {
        return 4
    }
    
    var description: String {
        switch self {
        case .TypeCat:
            return "Các loại mèo"
        case .Healthy:
            return "Sức khoẻ cho mèo"
        case .Eat:
            return "Các cho mèo ăn"
        case .Matching:
            return "Lưu ý khi phối mèo"
        }
    }
}

//enum TypesCat {
//    case CatHome
//    case CatBritish
//    case CatBaTu
//    case CatOther
//    case CatRussia
//    
//    var count: Int {
//        return 5
//    }
//    
//    var description: String {
//        switch self {
//        case .CatHome:
//            return "Mèo ta"
//        case .CatBritish:
//            return "Mèo Anh"
//        case .CatBaTu:
//            return "Mèo Ba tư"
//        case .CatOther:
//            return "Mèo khác"
//        case .CatRussia:
//            return "Mèo Nga"
//        }
//    }
//    
//    var image: String {
//        switch self {
//        case .CatHome:
//            return "cat_home"
//        case .CatBritish:
//            return "cat_brish"
//        case .CatBaTu:
//            return "cat_batu"
//        case .CatOther:
//            return "cat_other"
//        case .CatRussia:
//            return "cat_russia"
//        }
//    }
//}
//
//enum HealthyType {
//    case hohap
//    case vetai
//    case duongruot
//    case bochet
//    case tieuchay
//    
//    var count: Int {
//        return 5
//    }
//    
//    var description: String {
//        switch self {
//        case .hohap:
//            return "Hô hấp"
//        case .vetai:
//            return "Ve tai"
//        case .bochet:
//            return "Bọ chét"
//        case .tieuchay:
//            return "tiêu chảy"
//        case .duongruot:
//            return "Đường ruột"
//        }
//    }
//    
//    var image: String {
//        switch self {
//        case .hohap:
//            return "phoi_icon"
//        case .vetai:
//            return "bochet"
//        case .bochet:
//            return "bochet"
//        case .tieuchay:
//            return "giun_icon"
//        case .duongruot:
//            return "ruot_icon"
//        }
//    }
//    
//}
//
//enum Matching {
//    case taicup
//    case channgan
//    case golden
//    case silver
//    case tabby
//    case bicolor
//    case mat2mau
//    
//    var count: Int {
//        return 7
//    }
//    
//    var description: String {
//        switch self {
//        case .taicup:
//            return "Tai cụp"
//        case .channgan:
//            return "Chân ngắn"
//        case .golden:
//            return "Màu Golden"
//        case .silver:
//            return "Màu Silver"
//        case .tabby:
//            return "Màu tabby"
//        case .mat2mau:
//            return "Mắt 2 màu"
//        case .bicolor:
//            return "Màu bicolor"
//        }
//    }
//    
//    var image: String {
//        switch self {
//        case .taicup:
//            return "taicup"
//        case .channgan:
//            return "channgan"
//        case .golden:
//            return "golden"
//        case .silver:
//            return "silver"
//        case .tabby:
//            return "tabby"
//        case .mat2mau:
//            return "mat2mau"
//        case .bicolor:
//            return "bicolor"
//        }
//    }
//}
//
//enum EatCat {
//    case truongthanh
//    case con
//    case mangbau
//    
//    var count: Int {
//        return 3
//    }
//    
//    var description: String {
//        switch self {
//        case .truongthanh:
//            return "Mèo trưởng thành"
//        case .con:
//            return "Mèo con"
//        case .mangbau:
//            return "Mèo bầu"
//        }
//    }
//    
//    var image: String {
//        switch self {
//        case .truongthanh:
//            return "meo_truong_thanh"
//        case .con:
//            return "meo_con"
//        case .mangbau:
//            return "meo_bau"
//        }
//    }
//    
//}
