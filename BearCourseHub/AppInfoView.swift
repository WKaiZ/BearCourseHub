//
//  AppInfoView.swift
//  BearCourseHub
//
//  Created by Wesley Zheng on 11/21/23.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30).frame(width: 200, height: 200).foregroundStyle(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing))
                VStack {
                    Image("California_Golden_Bears_logo.svg").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
                    Text("B C H").font(.system(size: 50, design: .rounded)).bold().clipShape(RoundedRectangle(cornerRadius: 25)).foregroundStyle(.cyan)
                }
            }.padding()
            Text("Bear Course Hub").font(.system(size: 30)).padding().foregroundStyle(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).bold()
            Text("Version 1.0.0").font(.system(size: 20)).padding().foregroundStyle(LinearGradient(colors: [.orange.opacity(0.5),.blue.opacity(0.4),.orange.opacity(0.5)], startPoint: .top, endPoint: .trailing)).bold()
        }
    }
}

#Preview {
    AppInfoView()
}
