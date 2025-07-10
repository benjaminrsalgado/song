//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
   PantallaAjustes()
    }
}

class  ModoModel: ObservableObject{
    @Published var modoOscuro = false
    
    func  alternarModo() {
        modoOscuro.toggle()
    }
}

struct PantallaAjustes: View{
    @StateObject var keep = ModoModel()
    var body: some View{
        VStack{
            if keep.modoOscuro{
                Text("modo oscuro activado")
                    
            }else{
                Text("modo claro")
                    
            }
            BotonAlternarModo(keep:keep)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)// se expanda horiz. y verti.
            .background(keep.modoOscuro ? .black : .blue)// condicional para que cambie
            .foregroundColor(.white) //color del texto
    }
}

struct BotonAlternarModo: View{
    @ObservedObject var keep: ModoModel
    var body: some View{
        Button(action:{
            keep.alternarModo()
        }){
            Text("PRESS THE BUTTON")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ContentView()
}
