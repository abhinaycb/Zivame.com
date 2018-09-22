//
//  DetailsModel.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation

struct DetailsModel:Codable {
    
    let details:Detail?
}

struct Detail:Codable {
    let basicDetailsTab:BasicDetailsTab?
    let fabricAndCareTab:FabricAndCareTab?
    let reviewsTab:ReviewsTab?
}

struct BasicDetailsTab:Codable {
    let values:[TextObject]?
    let count:Int?
}

struct FabricAndCareTab:Codable {
    let values:[ListObject]?
    let count:Int?
}

struct ReviewsTab:Codable {
    let values:[ReviewObject]?
    let count:Int?
}

struct ListObject:Codable {
    let list:[String]?
}

struct TextObject:Codable {
    let text:String?
}

struct ReviewObject:Codable {
    let reviews:[Review]?
    let rating:Int?
    let totalReviewCount:Int?
}

struct Review:Codable {
    let description:String?
    let rating:Int?
    let likes:Int?
    let timeLine:String?
    let reviewId:Int?
    let customerName:String?
}
