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

class ClimbGradeSingleton {
    static let sharedInstance = ClimbGradeSingleton()
    
    //bouldering grades
    let intro = ClimbGrade(numberRating: 0, ratingName: "VIntro", ratingType: RatingType.bouldering)
    let v1 = ClimbGrade(numberRating: 1, ratingName: "V1", ratingType: RatingType.bouldering)
    let v2 = ClimbGrade(numberRating: 2, ratingName: "V2", ratingType: RatingType.bouldering)
    let v3 = ClimbGrade(numberRating: 3, ratingName: "V3", ratingType: RatingType.bouldering)
    let v4 = ClimbGrade(numberRating: 4, ratingName: "V4", ratingType: RatingType.bouldering)
    let v5 = ClimbGrade(numberRating: 5, ratingName: "V5", ratingType: RatingType.bouldering)
    let v6 = ClimbGrade(numberRating: 6, ratingName: "V6", ratingType: RatingType.bouldering)
    let v7 = ClimbGrade(numberRating: 7, ratingName: "V7", ratingType: RatingType.bouldering)
    let v8 = ClimbGrade(numberRating: 8, ratingName: "V8", ratingType: RatingType.bouldering)
    let v9 = ClimbGrade(numberRating: 9, ratingName: "V9", ratingType: RatingType.bouldering)
    let v10 = ClimbGrade(numberRating: 10, ratingName: "V10", ratingType: RatingType.bouldering)
    
    //YDS grades
    let level50 = ClimbGrade(numberRating: 0, ratingName: "5.0", ratingType: RatingType.YDS)
    let level51 = ClimbGrade(numberRating: 1, ratingName: "5.1", ratingType: RatingType.YDS)
    let level52 = ClimbGrade(numberRating: 2, ratingName: "5.2", ratingType: RatingType.YDS)
    let level53 = ClimbGrade(numberRating: 3, ratingName: "5.3", ratingType: RatingType.YDS)
    let level54 = ClimbGrade(numberRating: 4, ratingName: "5.4", ratingType: RatingType.YDS)
    let level55 = ClimbGrade(numberRating: 5, ratingName: "5.5", ratingType: RatingType.YDS)
    let level56 = ClimbGrade(numberRating: 6, ratingName: "5.6", ratingType: RatingType.YDS)
    let level57 = ClimbGrade(numberRating: 7, ratingName: "5.7", ratingType: RatingType.YDS)
    let level58 = ClimbGrade(numberRating: 8, ratingName: "5.8", ratingType: RatingType.YDS)
    let level59 = ClimbGrade(numberRating: 9, ratingName: "5.9", ratingType: RatingType.YDS)
    let level510a = ClimbGrade(numberRating: 10, ratingName: "5.10a", ratingType: RatingType.YDS)
    let level510b = ClimbGrade(numberRating: 11, ratingName: "5.10b", ratingType: RatingType.YDS)
    let level510c = ClimbGrade(numberRating: 12, ratingName: "5.10c", ratingType: RatingType.YDS)
    let level510d = ClimbGrade(numberRating: 13, ratingName: "5.10d", ratingType: RatingType.YDS)
    let level511a = ClimbGrade(numberRating: 14, ratingName: "5.11a", ratingType: RatingType.YDS)
    let level511b = ClimbGrade(numberRating: 15, ratingName: "5.11b", ratingType: RatingType.YDS)
    let level511c = ClimbGrade(numberRating: 16, ratingName: "5.11c", ratingType: RatingType.YDS)
    let level511d = ClimbGrade(numberRating: 17, ratingName: "5.11d", ratingType: RatingType.YDS)
    let level512a = ClimbGrade(numberRating: 18, ratingName: "5.12a", ratingType: RatingType.YDS)
    let level512b = ClimbGrade(numberRating: 19, ratingName: "5.12b", ratingType: RatingType.YDS)
    let level512c = ClimbGrade(numberRating: 20, ratingName: "5.12c", ratingType: RatingType.YDS)
    let level512d = ClimbGrade(numberRating: 21, ratingName: "5.12d", ratingType: RatingType.YDS)
    let level513a = ClimbGrade(numberRating: 22, ratingName: "5.13a", ratingType: RatingType.YDS)
    let level513b = ClimbGrade(numberRating: 23, ratingName: "5.13b", ratingType: RatingType.YDS)
    let level513c = ClimbGrade(numberRating: 24, ratingName: "5.13c", ratingType: RatingType.YDS)
    let level513d = ClimbGrade(numberRating: 25, ratingName: "5.13d", ratingType: RatingType.YDS)
    let level514a = ClimbGrade(numberRating: 26, ratingName: "5.14a", ratingType: RatingType.YDS)
    
    func getGradeArray(ratingType: RatingType) -> [ClimbGrade] {
        var array = [ClimbGrade]()
        switch ratingType {
        case .YDS:
            array = [level50,level51,level52,level53,level54,level55,level57,level58,level59,level510a,level510b,level510c,level510d,level511a,level511b,level511c,level511d,level512a,level512b,level512c,level512d, level513a,level513b,level513c,level513d,level514a]
        case .bouldering:
            array = [v1,v2,v3,v4,v5,v6,v7,v8,v9,v10]
        default:
            print("Not a valid rating type")
        }
        
        return array
    }
    
    func getGradeNames(ratingType: RatingType) -> [String] {
        let grades = getGradeArray(ratingType: ratingType)
        var gradeNames = [String]()
        for grade in grades {
            gradeNames.append(grade.ratingName)
        }
        
        return gradeNames
        
    }
    
}
