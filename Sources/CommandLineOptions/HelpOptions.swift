//
//  CommandOptions.swift
//  dwcasset
//
//  Created by Andrew Satori on 1/30/22.
//

import Foundation

public extension Options {
    
    // help
    var showHelp : Bool { get { return  params.keys.contains("help") } }
    var helpForCommand : String? { get { return params["help"] ?? nil } }
    
}
