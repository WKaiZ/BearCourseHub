//
//  MyCoursesView.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI
import SwiftData

struct MyCoursesView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var presenting: Bool = false
    @Query private var courses: [Course]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Bear Course Hub").foregroundStyle(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).padding().bold()
                    ForEach(courses) {course in
                        if course.bookmark == true {
                            NavigationLink {
                                CourseView(course: course).toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button(action: {
                                            presenting.toggle()
                                        }) {
                                            Image(systemName: "pencil")
                                        }.sheet(isPresented: $presenting, content: {
                                            modCourseView(course: course)
                                        })
                                    }
                                }
                            } label: {
                                Image(course.image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).padding()
                                Text(course.prefix + "" + course.num).frame(width: 200, height: 100).padding()
                            }.background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).foregroundStyle(.white).cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MyCoursesView().modelContainer(for: Course.self)
}
