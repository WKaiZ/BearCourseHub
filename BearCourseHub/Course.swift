//
//  Course.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI
import SwiftData

@Model
class Course {
    var prefix: String
    var num: String
    var desc: String
    var website: String
    var unit: Int
    var bookmark: Bool
    var image: String
    var courseName: String
    var usefulLink1: String
    var usefulLink2: String
    var usefulLink3: String
    var notes: String
    
    init(prefix: String, num: String, desc: String, website: String, bookmark: Bool, unit: Int, image: String, courseName: String, usefulLink1: String, usefulLink2: String, usefulLink3: String, notes: String) {
        self.prefix = prefix
        self.num = num
        self.desc = desc
        self.website = website
        self.unit = unit
        self.bookmark = bookmark
        self.image = image
        self.courseName = courseName
        self.usefulLink1 = usefulLink1
        self.usefulLink2 = usefulLink2
        self.usefulLink3 = usefulLink3
        self.notes = notes
    }
}
