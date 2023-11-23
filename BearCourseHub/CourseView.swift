//
//  CourseView.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/22/23.
//

import SwiftUI

struct CourseView: View {
    var course: Course
    var body: some View {
        ScrollView {
            VStack {
                Image(course.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                HStack {
                    Text(course.prefix)
                    Text(course.num)
                }.padding()
                HStack {
                    Text("Course Name: ")
                    Text(course.courseName)
                }.padding()
                HStack {
                    Text("Units: ")
                    Text(String(course.unit))
                }.padding()
                Text("Course Description: ").padding()
                Text(course.desc).padding()
                Text("Official Course Website")
                Text(LocalizedStringKey(course.website)).padding()
                Text("Useful Website #1: ")
                Text(LocalizedStringKey(course.usefulLink1)).padding()
                Text("Useful Website #2: ")
                Text(LocalizedStringKey(course.usefulLink2)).padding()
                Text("Useful Website #3: ")
                Text(LocalizedStringKey(course.usefulLink3)).padding()
                Text("Notes: ")
                Text(course.notes).padding()
            }
        }
    }
}
