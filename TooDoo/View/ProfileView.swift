//
//  ProfileView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-09.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser{
            List{
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("General"){
                    HStack{
                        SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        
                        Text("0.3")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Section("Account"){
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: .red)
                    }
                    Button {
                        print("Delete...")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
