//
//  Hype.swift
//  HypeCloudKit
//
//  Created by Darin Marcus Armstrong on 7/9/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation
import CloudKit

struct Constants {
    static let recordTypeKey = "Hype"
    fileprivate static let recordTextKey = "Text"
    static let timestampKey = "Timestamp"
}

class Hype {
    
    let hypeText: String
    let timestamp: Date
    
    //Creating a Hype
    init(hypeText: String, timestamp: Date = Date()) {
        self.hypeText = hypeText
        self.timestamp = timestamp
    }
    
}

//Creating a Hype from a CKRecord
extension Hype {
    convenience init?(ckRecord: CKRecord) {
        guard let hypeText = ckRecord[Constants.recordTextKey] as? String,
            let timestamp = ckRecord[Constants.timestampKey] as? Date
            else {return nil}
        
        self.init(hypeText: hypeText, timestamp: timestamp)
    }
}

//Creating a CKRecord
extension CKRecord {
    convenience init(hype: Hype) {
        self.init(recordType: Constants.recordTypeKey)
        self.setValue(hype.hypeText, forKey: Constants.recordTextKey)
        self.setValue(hype.timestamp, forKey: Constants.timestampKey)
    }
}
