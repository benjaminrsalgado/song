//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PantallaPrincipal()
       
    }
}

//ESTA ES LA CALSE
class  ContadorModel: ObservableObject{
    @Published var cuenta = 0
    
    func change(){
        cuenta += 1
    }
}
//LA VISTA QUE HEREDA LA CLASE
struct PantallaPrincipal: View{
    @StateObject var keep = ContadorModel()
    var body: some View{
        Text("\(keep.cuenta)")
        BotonContador(keep: keep)
    }
}
//LA SEGUNDA VISTA HEREDANDO LA CLASE
struct BotonContador:View{
    @ObservedObject var keep: ContadorModel
    var body: some View{
        Button(action:{
            keep.change()
        }){Text("Press the button")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    ContentView()
}
