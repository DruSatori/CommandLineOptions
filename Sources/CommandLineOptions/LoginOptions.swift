//
//  LoginOptions.swift
//  dwcasset
//
//  Created by Andrew Satori on 1/30/22.
//

import Foundation

public extension Options {
    var host : String?  { get { return params["host"] ?? "http://localhost/" } }
    var user : String?  { get { return params["user"] ?? nil } }
    var password : String?  { get { return params["password"] ?? nil } }
}
