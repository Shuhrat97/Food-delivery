//
//  Category.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import Foundation

struct Categories:Codable{
    let categories:[Category]
}

struct Category:Codable{
    let idCategory:String
    let strCategory:String
    let strCategoryThumb:String
    let strCategoryDescription:String
}
