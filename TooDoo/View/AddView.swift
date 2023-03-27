//
//  AddView.swift
//  TooDoo
//
//  Created by David Pinto on 2023-03-23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    var body: some View {
        
        ScrollView{
            VStack {
                TextField("Type here...", text: $textFieldText)
                    .frame(height: 60)
                    .padding(.horizontal)
                    .background(Color(#colorLiteral(red: 0.8900356192, green: 0.8878414306, blue: 0.9819386276, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action:saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.accentColor).frame(height: 55)
                        .cornerRadius(10)
                })
        
            }.padding(10)
        }
        .navigationTitle("Add Something Toodoo")
    }
    
    func saveButtonPressed(){
        if checkString(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }

    }
    
    func checkString() -> Bool {
        if textFieldText.count < 3{
            return false
        }
        return true
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }

    }
}
