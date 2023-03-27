//
//  TooDooApp.swift
//  TooDoo
//
//  Created by David Pinto on 2023-03-26.
//

import SwiftUI


@main
struct TooDooApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
