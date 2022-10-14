//
//  Meal.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 14/10/22.
//

import Foundation

struct Meals:Codable{
    let meals:[Meal]
}

struct Meal:Codable{
    let strMeal:String
    let strMealThumb:String
    let idMeal:String
}
