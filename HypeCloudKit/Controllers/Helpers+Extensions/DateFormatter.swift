//
//  DateFormatter.swift
//  HypeCloudKit
//
//  Created by Darin Marcus Armstrong on 7/9/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation

extension Date {
    func formatString() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
}
