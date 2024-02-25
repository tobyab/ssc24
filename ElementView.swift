//
//  ElementView.swift
//  mol
//
//  Created by Toby Brown on 25/02/2024.
//

import SwiftUI

var data = ReadData()

struct ElementView: View {
    let blue = Color(red: 133, green: 152, blue: 218, opacity: 1)
    let orange = Color(red: 245, green: 176, blue: 97, opacity: 1)

    var element: Element
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Moon"), Color("Sun"),]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    if element.phase == "Gas" {
                        Image(systemName: "wind")
                            .opacity(0.7)
                    } else if element.phase == "Solid" {
                        Image(systemName: "cube")
                            .opacity(0.7)
                    } else if element.phase == "Liquid" {
                        Image(systemName: "drop")
                            .opacity(0.7)
                    }
                    
                    Text(element.phase)
                        .opacity(0.7)
                }
                
                Text(element.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text(element.symbol)
                    Text("•")
                    Text(String(element.atomicMass) + "(g/mol)")
                }
                .font(.caption)
                .opacity(0.7)
            }.foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .center)
        }.frame(maxHeight: 150)

                List {

                    // this is so janky, pls enjoy :) i don't know how to swift
                    Section {
                        InfoView(title: "Name", value: element.name, unit: "", phase: element.phase, icon: "person")
                        InfoView(title: "Phase", value: element.phase, unit: "", phase: element.phase, icon: "")
                        InfoView(title: "Category", value: element.category, unit: "", phase: "", icon: "list.bullet")
                        InfoView(title: "Atomic Mass", value: String(element.atomicMass ), unit: "g/mol", phase: element.phase, icon: "scalemass")
                        InfoView(title: "Boiling Point", value: String(element.boil ?? 0), unit: "ºF", phase: element.phase, icon: "heat.waves")
                        InfoView(title: "Density", value: String(element.density ?? 0), unit: "g/l", phase: element.phase, icon: "squareshape.dotted.split.2x2")
                        InfoView(title: "Molar Heat", value: String(element.molar_heat ?? 0), unit: "mol x K", phase: element.phase, icon: "thermometer.sun")
                        InfoView(title: "Discovered By", value: element.discoveredBy ?? "", unit: "", phase: element.phase, icon: "magnifyingglass")
                        InfoView(title: "Named By", value: element.namedBy ?? "", unit: "", phase: element.phase, icon: "person")
                        InfoView(title: "Number", value: String(element.number), unit: "", phase: element.phase, icon: "number")
                        InfoView(title: "Period", value: String(element.period), unit: "", phase: element.phase, icon: "tablecells")
                        InfoView(title: "Group", value: String(element.group), unit: "", phase: element.phase, icon: "rectangle.3.group")
                        InfoView(title: "Appearance", value: element.appearance ?? "", unit: "", phase: element.phase, icon: "eye")
                    }
                    Section(header: Text("Summary")) {
                        VStack {
                            Text(element.summary ?? "")
                        }
                        HStack {
                            Image(systemName: "info.circle")
                            Text("Learn more")
                        }.foregroundColor(.cyan)
                    }
                }
    }
}


#Preview {
    ElementView(element: data.elements[0])
}
