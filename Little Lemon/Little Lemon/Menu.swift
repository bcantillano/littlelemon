//
//  Menu.swift
//  Little Lemon
//
//  Created by Byron Cantillano on 11/11/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    var body: some View {
        VStack{
            Text("Little Lemon Restaurant");
            Text("Chicago");
            Text("Your local restaurant serving fresh Mediterranean food!");
            
            TextField("Search menu", text: $searchText)
                                    .textFieldStyle(.roundedBorder)
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                                (dishes: [Dish]) in
                                List(dishes) { dish in
                                    Text("Item: \(dish.title!) - Price: \(dish.price!)")
                                }
                                .listStyle(.plain)
                            }
            
        }.onAppear(){
            getMenuData(viewContext: viewContext);
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
            return [NSSortDescriptor(key: "title",
                                      ascending: true,
                                      selector:
                                        #selector(NSString.localizedStandardCompare))]
        }

    func buildPredicate() -> NSPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        
        return search
        }
}

#Preview {
    Menu()
}
