//
//  Constants.swift
//  ZivameSampleApp
//
//  Created by Coffeebeans on 21/09/18.
//  Copyright © 2018 Coffeebeans. All rights reserved.
//

import Foundation
import UIKit

struct HardCodedStrings {
    static let defaultString = "defaultString"
    static let basicDetailsTabTitle = "BASIC DETAILS"
    static let fabricAndCareTabTitle = "FABRIC & CARE"
    static let reviewsTabTitle = "REVIEWS"
    static let baseDetailsTabViewControllerIdentifier = "BaseTabBarIdentifier"
    static let basicDetailsTabViewControllerIdentifier = "BasicTabBarIdentifier"
    static let fabricAndCareTabViewControllerIdentifier = "Fab&CareTabBarIdentifier"
    static let reviewTabViewControllerIdentifier = "ReviewTabBarIdentifier"
}


struct AppColors {
    static let clearColor = UIColor.clear
    static let whiteColor = UIColor.white
    static let selectedPinkColor = UIColor(displayP3Red: 233.0/255.0 , green: 30.0/255.0, blue: 99.0/255.0, alpha: 1.0)
    static let blackColor = UIColor.black
}


struct AppFonts {
    static let proximaRegularWithSize = UIFont(name: "Copperplate", size: 14.0)
    
}

let sampleJsonData = ["details": [
    "basicDetailsTab": [
        "values": [
            [
                "text": "It\'92s the bra that has just what your curves need. Carry yourself with ease and comfort all day long with a piece that will feel like second skin. Timeless in design and contemporary in style, this classic bra is likely to become an instant favourite for everyday wear.\\n\\nSometimes all a full-figured woman wants is a good quality foundation bra that is comfortable and gives reliable support. The double layered, seamed cups of this bra provide wirefree comfort and full coverage even as the wide side wings prevent spillage. Plus! The wider elastics give added support and comfort."
            ]
        ],
        "count": 1
    ],
    "fabricAndCareTab": [
        "values": [[
            "list": [
                "Fabric: Cotton Spandex",
                "Do Not Dry Clean",
                "Do Not Bleach",
                "Wash Dark Colours Separately",
                "Do Not Iron",
                "Hand Wash Allowed",
                "Do Not Tumble Dry"
            ]
            ]],
        "count": 1
    ],
    "reviewsTab": [
        "values": [ [
            "reviews": [
                [
                    "description": "Good quality cotton; nice fit, even for people who are busty. Tried buying a cotton bra for the first time and this one surely didn't let me down.\\r\\nThough, I wish they had it for bigger cups too.",
                    "rating": 5,
                    "likes": 1,
                    "timeLine": "2 year ago",
                    "reviewId": 53487,
                    "customerName": "Akshita"
                ],
                [
                    "description": "Very comfortable especially for bigger sizes",
                    "rating": 5,
                    "likes": 3,
                    "timeLine": "2 year ago",
                    "reviewId": 59766,
                    "customerName": "Anonymous"
                ]
            ],
            "rating": 4,
            "totalReviewCount": 109
            ]],
        "count": 1
    ]
    ]]

