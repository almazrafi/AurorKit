//
//  UIImageExtension.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import UIKit

public extension UIImage {
    
    // MARK: - Instance Methods
    
    public final func scaled(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        
        self.draw(in: CGRect(x: 0.0,
                             y: 0.0,
                             size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    
    public final func scaledToWidth(_ width: CGFloat) -> UIImage? {
        guard self.size.width >= 1.0 else {
            return self.scaled(to: CGSize(width: width, height: width))
        }
        
        let scaleFactor = width / self.size.width
        
        return self.scaled(to: CGSize(width: self.size.width * scaleFactor,
                                      height: self.size.height * scaleFactor))
    }
    
    public final func scaledToHeight(_ height: CGFloat) -> UIImage? {
        guard self.size.height >= 1.0 else {
            return self.scaled(to: CGSize(width: height, height: height))
        }
        
        let scaleFactor = height / self.size.height
        
        return self.scaled(to: CGSize(width: self.size.width * scaleFactor,
                                      height: self.size.height * scaleFactor))
    }
}
