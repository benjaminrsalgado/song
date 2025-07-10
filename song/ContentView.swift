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

// MODELO DEL CONTADOR
class ContadorModel: ObservableObject {
    @Published var cuenta = 0
    
    func change() {
        cuenta += 1
    }
}

// VISTA PRINCIPAL
struct PantallaPrincipal: View {
    @StateObject var keep = ContadorModel()
    var body: some View {
        ZStack {
            // Fondo con gradiente
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Contador Bonito")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                // Número grande y con estilo
                Text("\(keep.cuenta)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.white.opacity(0.2))
                            .shadow(radius: 10)
                    )
                
                BotonContador(keep: keep)
            }
            .padding()
        }
    }
}

// BOTÓN PERSONALIZADO
struct BotonContador: View {
    @ObservedObject var keep: ContadorModel
    var body: some View {
        Button(action: {
            keep.change()
        }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .font(.title)
                Text("¡Presiona el botón!")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.pink, .orange]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(20)
            .shadow(radius: 8)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(1.1)
        .animation(.spring(), value: keep.cuenta)
    }
}

#Preview {
    ContentView()
}
