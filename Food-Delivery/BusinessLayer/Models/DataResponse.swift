//
//  DataResponse.swift
//  Soccer-Test
//
//  Created by Shuhrat Nurov on 06/08/22.
//

import Foundation

//
struct DataResponse<T:Codable>:Codable{
    let status:Bool
    let data:T
}
