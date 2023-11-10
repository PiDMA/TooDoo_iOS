//
//  InputView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-08.
//
//This will just be a repeatable line of code for signups/logins

import SwiftUI

struct InputView: View {
    @Binding var text : String
    let title: String
    let placeholder : String
    var isSecuredField  = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            if isSecuredField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
