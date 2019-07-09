//
//  HypeController.swift
//  HypeCloudKit
//
//  Created by Darin Marcus Armstrong on 7/9/19.
//  Copyright © 2019 Darin Marcus Armstrong. All rights reserved.
//

import Foundation
import CloudKit

class HypeController {
    
    static let sharedInstance = HypeController()
    
    var hypes: [Hype] = []
    
    //MARK: -CRUD Functions
    let database = CKContainer.default().publicCloudDatabase
    
    //Save
    func saveHype(text: String, completion: @escaping(Bool) -> Void) {
        let hype = Hype(hypeText: text)
        let hypeRecord = CKRecord(hype: hype)
        database.save(hypeRecord) { (_, error) in
            if let error = error {
                print("Error in \(#function): \(error.localizedDescription) /n---/n \(error)")
                completion(false)
                return
            }
            self.hypes.insert(hype, at: 0)
            completion(true)
        }
    }
    
    //Fetch
    func fetchHype(completion: @escaping(Bool) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: Constants.recordTypeKey, predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: Constants.timestampKey, ascending: false)]
        database.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print("Error in \(#function): \(error.localizedDescription) /n---/n \(error)")
                completion(false)
                return
            }
            guard let records = records else {completion(false); return}
            let hypes = records.compactMap({Hype(ckRecord: $0)})
            self.hypes = hypes
            completion(true)
        }
    }
    
    //Subscription
    func  subscribeToRemoteNotifications(completion: @escaping(Error?) -> Void) {
        
    }
}
