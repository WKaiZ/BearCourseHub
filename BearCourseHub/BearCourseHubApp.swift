//
//  BearCourseHubApp.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI

@main
struct BearCourseHubApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: [Course.self])
        }
    }
}
