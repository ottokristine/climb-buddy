//
//  ClimbGrade.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 8/29/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

class ClimbGrade {
    let numberRating: Int
    let ratingName: String
    let ratingType: RatingType
    
    init(numberRating: Int, ratingName: String, ratingType: RatingType) {
        self.numberRating = numberRating
        self.ratingName = ratingName
        self.ratingType = ratingType
    }
    
}
