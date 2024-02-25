//
//  Elements.swift
//  mol
//
//  Created by Toby Brown on 25/02/2024.
//

import Foundation

struct Element: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case appearance
        case atomicMass
        case boil
        case category
        case density
        case discoveredBy
        case melt
        case molar_heat
        case namedBy
        case number
        case period
        case group
        case phase
        case source
        case summary
        case symbol
        case shells
    }

    var id = UUID().uuidString
    var name: String
    var appearance: String?
    var atomicMass: Double
    var boil: Double?
    var category: String
    var density: Double?
    var discoveredBy: String?
    var melt: Double?
    var molar_heat: Double?
    var namedBy: String?
    var number: Int
    var period: Int
    var group: Int
    var phase: String
    var source: String?
    var summary: String?
    var symbol: String
    var shells: [Int]
}

class ReadData: ObservableObject  {
    @Published var elements = [Element]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "elements", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        print("URL", url)
        
        do {
            let data = try Data(contentsOf: url)
            let elements = try JSONDecoder().decode([Element].self, from: data)
            self.elements = elements
            print(data)
        } catch {
            print("Failed to decode JSON: \(error)")
        }
    }
}
