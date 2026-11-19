import SwiftUI

// CREATE: trabaja sobre una mascota nueva (@State)
// y al guardar la agrega a la lista del padre (@Binding)
struct NuevaMascotaView: View {
    @Binding var mascotas: [Mascota]
    @State private var nueva = Mascota(nombre: "", especie: .perro, edad: 1, vacunada: false)
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        FormularioMascota(mascota: $nueva)
            .navigationTitle("Nueva mascota")
            .toolbar {
                Button("Guardar") {
                    mascotas.append(nueva)
                    dismiss()
                }
                .disabled(nueva.nombre.isEmpty)
            }
    }
}

#Preview {
    NavigationStack {
        NuevaMascotaView(mascotas: .constant(Mascota.ejemplos))
    }
}
