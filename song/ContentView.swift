//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    @State var luci = 9
    var body: some View {
        pepe(luci: $luci)
    }
}

struct pepe:View{
    @Binding var luci: Int
    var body: some View{

    }
}

#Preview {
    ContentView()
}
