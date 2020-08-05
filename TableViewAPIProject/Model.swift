//
//  Product.swift
//  TableViewAPIProject
//
//  Created by Shankar Suman on 22/03/20.
//  Copyright © 2020 Shankar Suman. All rights reserved.
//

import Foundation

class ProductDetails: Codable {
    var data: data?
}


class data: Codable {
    var products: [Product]?
}

class Product: Codable {
    var name: String?
    var images: [String]?
}

