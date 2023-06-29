//
//  Categori.swift
//  What'sGift
//
//  Created by sueun kim on 2023/06/30.
//

import Foundation


enum Categori{
    case age
    case sex
    case price
    case friend
    case lover
    case birthday
    
    var filtering : String {
        switch self{
        case .age:
            return "나이"
        case .sex:
           return "성별"
        case .price:
           return "가격"
        case .friend:
            return "친구"
        case .lover:
            return "연인"
        case .birthday:
            return "생일"
        }
    }
}
