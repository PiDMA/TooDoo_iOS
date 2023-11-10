//
//  ContentView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}
    
#Preview {
    ContentView()
}
