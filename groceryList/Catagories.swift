//
//  Catagories.swift
//  groceryList
//
//  Created by apcs2 on 9/22/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import Foundation

class groceryCatagory
{
    var protein = [String]()
    var fish = [String]()
    var fruit = [String]()
    var veggies = [String]()
    var drinks = [String]()
    var grains = [String]()
    var dairy = [String]()
    
    init(protein p: Array<Any>, fish f: Array<Any>, fruit r: Array<Any>, veggies v: Array<Any>, drinks d: Array<Any>, grains g: Array<Any>, dairy y: Array<Any>)
    {
        protein = p as! [String]
        fish = f as! [String]
        fruit = r as! [String]
        veggies = v as! [String]
        drinks = d as! [String]
        grains = g as! [String]
        dairy = y as! [String]
    }
}
