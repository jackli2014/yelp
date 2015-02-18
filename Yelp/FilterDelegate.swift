//
//  FilterDelegate.swift
//  Yelp
//
//  Created by Shengjun Li on 2/17/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import Foundation


protocol FilterDelegate : NSObjectProtocol {
    func didApplyFilter(categories: NSArray)
}
