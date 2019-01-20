//
//  DataExtension.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 20/05/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public extension Data {
    
    // MARK: - Instance Properties
    
    public var hexEncoded: String {
        return self.reduce("", { result, byte in
            return result + String(format: "%02hhx", byte)
        })
    }
}
