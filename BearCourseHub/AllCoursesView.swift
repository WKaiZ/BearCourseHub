//
//  AllCoursesView.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI
import SwiftData

struct AllCoursesView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query private var courses: [Course]
    @State private var presentingSheet: Bool = false
    @State private var presentingModSheet: Bool = false
    @State private var initialized: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ZStack {
                        Text("Bear Course Hub").foregroundStyle(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).padding().bold()
                        HStack {
                            Spacer()
                            if initialized == true || !courses.isEmpty {
                                Button(action: {
                                    presentingSheet.toggle()
                                }, label: {
                                    Image(systemName: "plus")
                                }).sheet(isPresented: $presentingSheet, content: {
                                    AddCourseView()
                                }).padding()
                            } else {
                                Button(action: {
                                    modelContext.insert(Course(prefix: "CS", num: "61A", desc: "An introduction to programming and computer science focused on abstraction techniques as means to manage program complexity. Techniques include procedural abstraction; control abstraction using recursion, higher-order functions, generators, and streams; data abstraction using interfaces, objects, classes, and generic operators; and language abstraction using interpreters and macros. The course exposes students to programming paradigms, including functional, object-oriented, and declarative approaches. It includes an introduction to asymptotic analysis of algorithms. There are several significant programming projects.", website: "https://cs61a.org", bookmark: false, unit: 4, image: "logo", courseName: "Structure and Interpretation of Computer Programs", usefulLink1: "https://github.com/hachimanyukinoshita/berkeley/tree/main/CS%2061A", usefulLink2: "", usefulLink3: "", notes: ""))
                                    modelContext.insert(Course(prefix: "CS", num: "61B", desc: "Fundamental dynamic data structures, including linear lists, queues, trees, and other linked structures; arrays strings, and hash tables. Storage management. Elementary principles of software engineering. Abstract data types. Algorithms for sorting and searching. Introduction to the Java programming language.", website: "https://fa23.datastructur.es", bookmark: false, unit: 4, image: "images", courseName: "Data Structures", usefulLink1: "https://github.com/hachimanyukinoshita/berkeley/tree/main/CS%2061B", usefulLink2: "", usefulLink3: "", notes: ""))
                                    modelContext.insert(Course(prefix: "CS", num: "70", desc: "Logic, infinity, and induction; applications include undecidability and stable marriage problem. Modular arithmetic and GCDs; applications include primality testing and cryptography. Polynomials; examples include error correcting codes and interpolation. Probability including sample spaces, independence, random variables, law of large numbers; examples include load balancing, existence arguments, Bayesian inference.", website: "https://fa23.datastructur.es", bookmark: false, unit: 4, image: "penguin_and_pigeon", courseName: "Discrete Mathematics and Probability Theory", usefulLink1: "https://github.com/hachimanyukinoshita/berkeley/tree/main/MATH%2055", usefulLink2: "", usefulLink3: "", notes: ""))
                                    initialized = true
                                }, label: {
                                    Text("Initialize").padding().bold()
                                }).background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray.opacity(0.3)))
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "magnifyingglass").padding()
                        TextField("", text: $searchText).padding()
                    }.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(.gray.opacity(0.3))).padding()
                    ForEach(courses) {course in
                        if (course.prefix+course.num).lowercased().contains(searchText.lowercased()) || searchText == "" {
                            NavigationLink {
                                CourseView(course: course).toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button(action: {
                                            course.bookmark.toggle()
                                        }) {
                                            if course.bookmark == false {
                                                Image(systemName: "bookmark")
                                            } else {
                                                Image(systemName: "bookmark.fill")
                                            }
                                        }
                                    }
                                    ToolbarItem(placement: .automatic) {
                                        Button(action: {
                                            presentingModSheet.toggle()
                                        }) {
                                            Image(systemName: "pencil")
                                        }.sheet(isPresented: $presentingModSheet, content: {
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

struct AddCourseView: View {
    @State private var prefix: String = ""
    @State private var num: String = ""
    @State private var desc: String = ""
    @State private var website: String = ""
    @State private var unit: String = ""
    @State private var usefulLink1: String = ""
    @State private var usefulLink2: String = ""
    @State private var usefulLink3: String = ""
    @State private var courseName: String = ""
    @State private var notes: String = ""
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack {
                Text("Course Prefix: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $prefix).padding()
                Text("Course Number: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $num).padding()
                Text("Course Name: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $courseName).padding()
                Text("Course Units: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $unit).padding()
                Text("Course Description: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $desc).padding()
                Text("Course Website:  ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $website).padding()
                Text("Useful Link #1: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink1).padding()
                Text("Useful Link #2: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink2).padding()
                Text("Useful Link #3: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink3).padding()
                Text("Notes: ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $notes).padding()
                Button(action: {
                    modelContext.insert(Course(prefix: prefix, num: num, desc: desc, website: website, bookmark: false, unit: Int(unit) ?? 4, image: "", courseName: courseName, usefulLink1: usefulLink1, usefulLink2: usefulLink2, usefulLink3: usefulLink3, notes: notes))
                    prefix = ""
                    num = ""
                    desc = ""
                    website = ""
                    unit = ""
                    courseName = ""
                    usefulLink1 = ""
                    usefulLink2 = ""
                    usefulLink3 = ""
                    notes = ""
                    dismiss()
                }, label: {
                    Text("Submit")
                }).padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
            }
        }
    }
}

struct modCourseView: View {
    var course: Course
    @State private var prefix: String = ""
    @State private var num: String = ""
    @State private var desc: String = ""
    @State private var website: String = ""
    @State private var unit: String = ""
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var courseName: String = ""
    @State private var usefulLink1: String = ""
    @State private var usefulLink2: String = ""
    @State private var usefulLink3: String = ""
    @State private var notes: String = ""
    var body: some View {
        ScrollView {
            VStack {
                Text("Course prefix is currently: \(course.prefix), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .red.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $prefix).padding()
                Text("Course number is currently: \(course.num), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $num).padding()
                Text("Course name is currently: \(course.courseName), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $courseName).padding()
                Text("Course units is currently: \(course.unit), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $unit).padding()
                Text("Course description is currently: \(course.desc), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $desc).padding()
                Text("Course website is currently: \(course.website), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $website).padding()
                Text("Useful Link # 1 is currently: \(course.usefulLink1), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink1).padding()
                Text("Useful Link # 1 is currently: \(course.usefulLink2), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink2).padding()
                Text("Useful Link # 1 is currently: \(course.usefulLink3), what would you like to change it to? ").padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .blue.opacity(0.9), radius: 10)
                TextField("Enter here:", text: $usefulLink3).padding()
                HStack {
                    Button(action: {
                        modelContext.insert(Course(prefix: prefix == "" ? course.prefix : prefix, num: num == "" ? course.num : num, desc: desc == "" ? course.desc : desc, website: website == "" ? course.website : website, bookmark: course.bookmark, unit: Int(unit) ?? 4, image: course.image, courseName: courseName == "" ? course.courseName : courseName, usefulLink1: usefulLink1 == "" ? course.usefulLink1 : usefulLink1, usefulLink2: usefulLink2 == "" ? course.usefulLink2 : usefulLink2, usefulLink3: usefulLink3 == "" ? course.usefulLink3 : usefulLink3, notes: notes == "" ? course.notes : notes))
                        prefix = ""
                        num = ""
                        website = ""
                        desc = ""
                        unit = ""
                        courseName = ""
                        usefulLink1 = ""
                        usefulLink2 = ""
                        usefulLink3 = ""
                        notes = ""
                        modelContext.delete(course)
                        dismiss()
                    }, label: {
                        Text("Submit")
                    }).padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .purple.opacity(0.9), radius: 10)
                    Button(action: {
                        prefix = ""
                        num = ""
                        website = ""
                        desc = ""
                        unit = ""
                        courseName = ""
                        usefulLink1 = ""
                        usefulLink2 = ""
                        usefulLink3 = ""
                        notes = ""
                        modelContext.delete(course)
                        dismiss()
                    }, label: {
                        Text("Delete")
                    }).padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .purple.opacity(0.9), radius: 10)
                    if course.bookmark == true {
                        Button(action: {
                            course.bookmark.toggle()
                            dismiss()
                        }, label: {
                            Text("Remove as Bookmark")
                        }).padding().foregroundColor(.white).background(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).cornerRadius(10).shadow(color: .purple.opacity(0.9), radius: 10)
                    }
                }
            }
        }
    }
}
