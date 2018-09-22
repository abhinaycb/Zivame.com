//
//  NetworkManager.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class NetworkManager {
    
    static let sharedNetworkManagerInstance = NetworkManager()
    let firebaseDatabaseRef = Database.database().reference()
    
    func getJsonModelsForTabs(completion:@escaping((DetailsModel?)->())) {
        firebaseDatabaseRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let detailObjectValue = snapshot.value as? Dictionary<String,Any> {
                do{
                    let jsonData = try JSONSerialization.data(withJSONObject: detailObjectValue, options: .prettyPrinted)
                    let model = try! JSONDecoder().decode(DetailsModel.self, from: jsonData)
                    completion(model)
                }catch{
                    completion(nil)
                }
            }
        })
    }
    
    
    func updateChangeInDataThruFirebaseWebHook() {
        
        
        
        
    }
    
    
}
//do{
//    let jsonData = try JSONSerialization.data(withJSONObject: sampleJsonData, options: .prettyPrinted)
//    return try! JSONDecoder().decode(DetailsModel.self, from: jsonData)
//}catch{
//    return nil
//}
