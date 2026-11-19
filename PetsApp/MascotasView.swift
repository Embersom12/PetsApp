//
//  MascotasView.swift
//  MascotasCRUD
//
//  Pantalla principal: es la dueña de la lista (@State)
//  y presta cada mascota a otras pantallas con @Binding.
//

import SwiftUI

struct MascotasView: View {
    @State private var mascotas = Mascota.ejemplos
    @State private var mascotaAEliminar: Mascota?
    @State private var mostrarAlerta = false

    var body: some View {
        NavigationStack {
            // $mascotas: cada fila recibe un Binding a SU mascota
            List($mascotas) { $mascota in
                NavigationLink {
                    // UPDATE: el formulario edita la mascota original
                    FormularioMascota(mascota: $mascota)
                        .navigationTitle(mascota.nombre)
                } label: {
                    FilaMascota(mascota: mascota)
                }
                .swipeActions {
                    // DELETE: primero se pide confirmación
                    Button("Eliminar", role: .destructive) {
                        mascotaAEliminar = mascota
                        mostrarAlerta = true
                    }
                }
            }
            .navigationTitle("Mascotas")
            .toolbar {
                // CREATE
                NavigationLink("Nueva") {
                    NuevaMascotaView(mascotas: $mascotas)
                }
            }
            .alert("¿Eliminar mascota?", isPresented: $mostrarAlerta) {
                Button("Eliminar", role: .destructive) {
                    mascotas.removeAll { $0.id == mascotaAEliminar?.id }
                }
                Button("Cancelar", role: .cancel) { }
            } message: {
                Text("Se eliminará a \(mascotaAEliminar?.nombre ?? "").")
            }
        }
    }
}

#Preview {
    MascotasView()
}
