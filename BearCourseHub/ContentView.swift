//
//  ContentView.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var courses: [Course]
    var body: some View {
        TabView {
            MyCoursesView().tabItem{ Label("My Courses", systemImage: "bookmark")}
            AllCoursesView().tabItem { Label("All Courses", systemImage: "book")}
            AppInfoView().tabItem { Label("App Info", systemImage: "info")}
        }
    }
}

#Preview {
    ContentView().modelContainer(for: [Course.self])
}
