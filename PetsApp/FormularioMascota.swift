//
//  FormularioMascota.swift
//  MascotasCRUD
//
//  Un solo formulario para editar y para crear.
//

import SwiftUI

struct FormularioMascota: View {
    @Binding var mascota: Mascota

    var body: some View {
        Form {
            TextField("Nombre", text: $mascota.nombre)
            Picker("Especie", selection: $mascota.especie) {
                ForEach(Especie.allCases) { especie in
                    Text(especie.rawValue).tag(especie)
                }
            }
            Stepper("Edad: \(mascota.edad)", value: $mascota.edad, in: 0...30)
            Toggle("Vacunada", isOn: $mascota.vacunada)
        }
    }
}

#Preview {
    NavigationStack {
        FormularioMascota(mascota: .constant(Mascota.ejemplos[0]))
    }
}
