//
//  DetailView.swift
//  Activity
//
//  Created by Viettasc Doan on 3/31/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var information: Information
//    @State var stuff = Utility().decode()
    @State var stuff: Stuff
    
    var body: some View {
        VStack {
            HStack {
                Text("Number: \(stuff.number)")
                Stepper("Number: ", value: $stuff.number)
                .labelsHidden()
            }
            .font(.largeTitle)
            .padding()
            Text(stuff.description)
                .font(.title)
                .foregroundColor(.secondary)
        }
        .navigationBarTitle(stuff.name)
        .foregroundColor(Color.pink.opacity(0.6))
        .onDisappear {
            if self.stuff.id > 0 {
                self.information.data[self.stuff.id - 1] = self.stuff
            }
        }
    }
    
    
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
