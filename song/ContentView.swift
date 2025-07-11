//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VistaLikes()
    }
}

class LikeModel: ObservableObject{
    @Published var likes = 0
    
    func sumar(){
        likes += 1
    }
}

struct VistaLikes: View{
    @StateObject var keep = LikeModel()
    @State var mostrarMensaje = false //@State
    var body: some View{
        VStack{
            Text("La cantidad de likes son \(keep.likes)")
            if mostrarMensaje {
                Text("Gracias por tu like!!!")
            }else{
                Text("nadaa")
            }
            SwitchMensaje(mostrarMensaje: $mostrarMensaje) // ✅ conexión con Binding
            BotonLike(keep:keep) //✅ conexión con la clase en las dos struct

        }
    }
}

struct BotonLike:View{
    @ObservedObject var keep : LikeModel
    var body: some View{
        VStack{
            Button(action:{
                keep.sumar()
            }){
                Text("Press tu plus the number +")
                    .foregroundColor(.red)
            }
        }
    }
}

struct SwitchMensaje: View{
    @Binding var mostrarMensaje:Bool
    var body: some View{
        Toggle("Mostrar mensaje", isOn: $mostrarMensaje)
    }
}
#Preview {
    ContentView()
}
