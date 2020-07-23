//
//  ContentView.swift
//  CodeUI
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack{
                Text("v1")
                Text("v2")
                Text("v3")

            }
            HStack{
                Text("h1")
                Text("h2")
                Text("h3")

            }
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
