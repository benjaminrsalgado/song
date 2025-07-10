//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       PerfilView()
    }
}

class  UsuarioModel: ObservableObject{
    @Published var nombre = "Invitado"
    
    func cambiarNombre(){
        nombre = "Benjamin Rojo"
    }
}

struct PerfilView: View{
    @StateObject var keep = UsuarioModel()
    var body: some View{
        VStack{
            Text(keep.nombre)
            EditarNombreView(keep:keep)
        }
    }
}

struct EditarNombreView:View{
    @ObservedObject var keep: UsuarioModel
    var body: some View{
        Button(action:{
            keep.cambiarNombre()
        }){
            Text("Change the name")
                .foregroundColor(.blue)
        }
    }
}



#Preview {
    ContentView()
}
