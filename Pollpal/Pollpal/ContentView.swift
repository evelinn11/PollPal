//
//  ContentView.swift
//  Pollpal
//
//  Created by student on 20/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationStack{
                DashboardRView()
                    .navigationTitle("Hello, Feli")
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationStack{
                HistoryView()
                    .navigationTitle("History")
            }
            .tabItem{
                Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                Text("History")
            }
            
            NavigationStack{
                HistoryView()
                    .navigationTitle("Profile")
            }
            .tabItem{
                Image(systemName: "person")
                Text("Profile")
            }
        }
        .tint(Color(hex: "#FE982A"))
    }
}

//kalau mau ambil dr hex color
extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        let scanner = Scanner(string: hexSanitized)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

#Preview {
    ContentView()
}
