//
//  LoginView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-08.
//

import SwiftUI


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            NavigationStack {
                VStack{
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
                    }
                    InputView(text: $password, 
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecuredField: true)     
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in
                Button{
                    Task{
//                        print("SIGN IN FROM LOGIN VIEW")
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{
                        Text("SIGN IN").fontWeight(.semibold)
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

                Spacer()
                
                //sign up
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack{
                        Text("Dont have an account?")
                        Text("Sign up!")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size: 14))
                }
            }
    }
}

extension LoginView: AuthenticationFormProtocol{
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
