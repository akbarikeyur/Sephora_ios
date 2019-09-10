//
//  NSErrorAdditions.swift
//  Cozy Up
//
//  Created by Keyur on 20/07/19.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

public extension NSError {
    
    public func isNoConnectionError() -> Bool {
        return self.domain == NSURLErrorDomain && self.code == NSURLErrorNotConnectedToInternet
    }
    
    public func isFileNotFoundError() -> Bool {
        return self.domain == NSCocoaErrorDomain && self.code == NSFileReadNoSuchFileError
    }
    
}
