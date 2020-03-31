//
//  AddView.swift
//  Activity
//
//  Created by Viettasc Doan on 3/31/20.
//  Copyright © 2020 Viettasc Doan. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var information: Information
    @Environment(\.presentationMode) var presentationMode
    @State var stuff = Stuff(id: 0, name: "", number: 0, description: "")
    func set() -> Void {
        stuff.id = information.data.count + 1
    }
    func edit() {
        if stuff.id > 0,
            stuff.name != "",
            stuff.number != 0,
            stuff.description != ""
            {
            let data = information.data
            if !data.isEmpty,
                !data.contains(where: {$0.id == stuff.id}) {
                information.data.append(stuff)
            }
        } else {
            print("validate")
        }
    }
    var body: some View {
        Form {
            Section(header: Text("Add")
                .font(.largeTitle)) {
                    Text("Id: \(information.data.count + 1)")
                        .onAppear {
                            self.set()
                    }
                    TextField("Name: ", text: $stuff.name)
                    Stepper("Number: \(stuff.number)", value: $stuff.number)
                    TextField("Description: ", text: $stuff.description)
                    Button("Ok") {
                        self.edit()
                        self.presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding()
        }
        .foregroundColor(Color.pink.opacity(0.6))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
