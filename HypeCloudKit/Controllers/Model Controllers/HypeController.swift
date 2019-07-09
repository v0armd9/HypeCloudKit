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
            self.hypes.append(hype)
            completion(true)
        }
    }
    
    //Fetch
    func fetchHype(completion: @escaping(Bool) -> Void) {
        
    }
    
    //Subscription
    func  subscribeToRemoteNotifications(completion: @escaping(Error?) -> Void) {
        
    }
}
