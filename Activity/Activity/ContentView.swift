//
//  ContentView.swift
//  Activity
//
//  Created by Viettasc Doan on 3/31/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct Stuff: Identifiable, Codable {
    
    var id: Int
    var name: String
    var number: Int
    var description: String
    
}

class Information: ObservableObject {
    
    @Published var data = [
        Stuff(id: 1, name: "Ice-cream", number: 10, description: "hot chocolate"),
        Stuff(id: 2, name: "Cup-cake", number: 20, description: "lemon mango"),
        Stuff(id: 3, name: "Cheese", number: 30, description: "new")
    ]
    
}

struct ContentView: View {
    
    @EnvironmentObject var information: Information
    @State var show = false
    func toggle() {
        show.toggle()
    }
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Avatar")) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        Image("tyemtee")
                        .resizable()
                        .scaledToFit()
                        .padding()
                    }
                    .frame(height: 231)
                }
                List {
                    ForEach(information.data) { item in
                        NavigationLink(destination: DetailView(stuff: item)) {
                            Text("\(item.name)")
                        }
                    }
                }
            }
            .navigationBarTitle("Activity")
            .navigationBarItems(trailing:
                Button(action: toggle) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $show) {
                    AddView().environmentObject(self.information)
            }
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
