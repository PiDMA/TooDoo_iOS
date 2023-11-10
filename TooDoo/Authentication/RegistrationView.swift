//
//  RegistrationView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-09.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        VStack(spacing:24){
            //Image
            Image("image-logo")
                .resizable()
                .scaledToFill()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 120)
                .padding(.vertical, 32)
            //Form Field
            VStack(spacing: 24){
                InputView(text: $email,
                          title: "Email",
                          placeholder: "name@example.com")
                .textInputAutocapitalization(.none)
                
                InputView(text: $fullname,
                          title: "Full Name",
                          placeholder: "Please enter your full name")
                
                InputView(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecuredField: true)
                
                InputView(text: $confirmedPassword,
                          title: "Confirm",
                          placeholder: "Confirm your password",
                          isSecuredField: true)
                
            }        
                .padding(.horizontal)
                .padding(.top, 12)
        }
        
        Button{
            dismiss()
        } label: {
            Button{
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
//                    print("DEBUG: Email \(email) trying to create account from RegistrationView")
                }
            } label: {
                HStack{
                    Text("SIGN UP").fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemBlue))
            .disabled(formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
        }
        Spacer()
        NavigationLink{
            LoginView()
                .navigationBarBackButtonHidden(true)
        } label: {
            HStack{
                Text("Already have an account?")
                Text("Sign in!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .font(.system(size: 14))
        }
    }
}


extension RegistrationView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmedPassword == password
        && !fullname.isEmpty
    }
}

#Preview {
    RegistrationView()
}
