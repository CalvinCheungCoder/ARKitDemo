//
//  Masks.swift
//  Cube
//
//  Created by Calvin on 2017/7/19.
//  Copyright © 2017年 Calvin. All rights reserved.
//

struct Masks:OptionSet {

    let rawValue: Int
    
    static let ship = Masks(rawValue: 1 << 0)
    static let bullet = Masks(rawValue: 1 << 1)
    
}
