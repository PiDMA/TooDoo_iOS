//
//  SettingsRowView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-11-09.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    //american spelling :)
    let tintColor: Color
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
}
