//
//  TooDooApp.swift
//  TooDoo
//
//  Created by David Pinto on 2023-03-26.
//

import SwiftUI
<<<<<<< HEAD
import Firebase
=======

>>>>>>> main

@main
struct TooDooApp: App {
    
<<<<<<< HEAD
    //Init the state object "viewModel" once and then pass it as an enviromental variable
    @StateObject var viewModel = AuthViewModel()
    

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }

    }
}

//default app layout for copy and paste/ refrence
//@main
//struct TooDooApp: App {
//
//    @StateObject var listViewModel: ListViewModel = ListViewModel()
//    
//    var body: some Scene {
//        WindowGroup {
//            NavigationView{
//                ListView()
//            }
//            .environmentObject(listViewModel)
//        }
//    }
//}
//
=======
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
>>>>>>> main
