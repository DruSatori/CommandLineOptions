//
//  Options.swift
//  CommandLineOptions Package
//
//  Created by Andrew Satori on 1/29/22.
//

import Foundation

public class Options {
    public var params : Dictionary<String, String?> = Dictionary<String,String?>()

    // anything starting with a - or -- is a key
    // any key containing an = is treated both, key and value split by the =
    // anything without a - or -- is a value associated with the prior key
    
    public init(args : [String]) {
        var key : String? = nil
        args.forEach { s in
            if (s == args[0]) { return }
            if (s.starts(with: "--") || s.starts(with: "-")) {
                // if the key is non null, add the prior key with a null value
                if (key != nil) {
                    params[key!] = "true"
                    key = nil
                }
                
                if (s.contains("=")) {
                    let parts = s.components(separatedBy: "=")
                    key = parts[0].replacingOccurrences(of: "-", with: "")
                    let value : String = parts[1]
                    params[key!] = value
                    key = nil
                    return
                }
                
                key = s.replacingOccurrences(of: "-", with: "")
                return
            }
            
            if (key != nil) {
                params[key!] = s
                key = nil
            }
        }
        if (key != nil) {
            params[key!] = "true"
            key = nil
        }
    }
    
    public var verbose : Bool {
        get {
            return params.keys.contains("verbose") ||
                params.keys.contains("v")
        }
    }

}
