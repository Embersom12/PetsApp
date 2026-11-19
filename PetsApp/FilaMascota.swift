import SwiftUI

// READ: fila de la lista, solo lee la mascota
struct FilaMascota: View {
    let mascota: Mascota

    var body: some View {
        HStack {
            Image(systemName: mascota.especie.icono)
                .foregroundStyle(.orange)
                .frame(width: 32)
            VStack(alignment: .leading) {
                Text(mascota.nombre)
                    .font(.headline)
                Text("\(mascota.especie.rawValue) · \(mascota.edad) años")
                    .foregroundStyle(.secondary)
            }
            Spacer()
            if mascota.vacunada {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    List {
        FilaMascota(mascota: Mascota.ejemplos[0])
        FilaMascota(mascota: Mascota.ejemplos[1])
    }
}
