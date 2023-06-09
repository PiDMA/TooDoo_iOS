//
//  ListViewModel.swift
//  TooDoo
//
//  Created by David Pinto on 2023-03-24.
//

import Foundation

class ListViewModel: ObservableObject{
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "Test1", isCompleted: false),
            ItemModel(title: "Test2", isCompleted: false),
            ItemModel(title: "Test3", isCompleted: true)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
