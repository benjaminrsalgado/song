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

struct Tarea: Identifiable{
    let id = UUID()
    let titulo : String
    let completada : Bool
}

class TareasManager{
    @Published var tareas: [Tarea]
    
    func change(){
        tareas.toggle
    }
}

struct ListaDeTareas: View{
    @StateObject var mostrar = TareasManager()
    var body: some View{
        for(mostrar)
    }
}

struct TareaView: View{
    @ObservedObject var mostrar: TareasManager
    var body some view{
        Button(action:{
            
        })
    }
}
#Preview {
    ContentView()
}
