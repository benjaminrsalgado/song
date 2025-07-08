//
//  ContentView.swift
//  song
//
//  Created by Benjamin Rojo on 07/07/25.
//

import SwiftUI

// 1️⃣ Modelo con Identifiable
struct Gen: Identifiable {
    let id = UUID()
    let titulo: String
    var esFavorita: Bool
}

// 2️⃣ ViewModel que maneja el estado
class CancionesManager: ObservableObject {
    @Published var canciones: [Gen] = [
        Gen(titulo: "Cruel Summer", esFavorita: false),
        Gen(titulo: "All Too Well", esFavorita: true),
        Gen(titulo: "Shake It Off", esFavorita: false)
    ]
    
    func toggleFavorito(id: UUID) {
        if let index = canciones.firstIndex(where: { $0.id == id }) {
            canciones[index].esFavorita.toggle()
        }
    }
}

// 3️⃣ Vista principal que muestra la lista
struct ListaCanciones: View {
    @StateObject var manager = CancionesManager()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(manager.canciones) { cancion in
                    CancionView(cancion: cancion, manager: manager)
                }
            }
            .navigationTitle("Mis Canciones")
        }
    }
}

// 4️⃣ Vista hija para cada fila
struct CancionView: View {
    let cancion: Gen
    @ObservedObject var manager: CancionesManager
    
    var body: some View {
        HStack {
            Text(cancion.titulo)
            Spacer()
            Button(action: {
                manager.toggleFavorito(id: cancion.id)
            }) {
                Image(systemName: cancion.esFavorita ? "heart.fill" : "heart")
                    .foregroundColor(.pink)
            }
        }
        .padding(.vertical, 8)
    }
}

// Vista de previsualización
struct ContentView: View {
    var body: some View {
        ListaCanciones()
    }
}

#Preview {
    ContentView()
}
