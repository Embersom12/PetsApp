//
//  Mascota.swift
//  MascotasCRUD
//

import Foundation

enum Especie: String, CaseIterable, Identifiable {
    case perro = "Perro"
    case gato = "Gato"
    case ave = "Ave"
    case otro = "Otro"

    var id: Self { self }

    var icono: String {
        switch self {
        case .perro: return "dog"
        case .gato: return "cat"
        case .ave: return "bird"
        case .otro: return "pawprint"
        }
    }
}

struct Mascota: Identifiable {
    let id = UUID()
    var nombre: String
    var especie: Especie
    var edad: Int
    var vacunada: Bool
}

extension Mascota {
    static let ejemplos = [
        Mascota(nombre: "Firulais", especie: .perro, edad: 4, vacunada: true),
        Mascota(nombre: "Michi", especie: .gato, edad: 2, vacunada: false),
        Mascota(nombre: "Piolín", especie: .ave, edad: 1, vacunada: true)
    ]
}
