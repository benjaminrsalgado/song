//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

    }
}

class  ContadorModel: ObservableObject{
    @Published var cuenta = 0
}


#Preview {
    ContentView()
}
