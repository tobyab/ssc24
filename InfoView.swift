//
//  InfoView.swift
//  mol
//
//  Created by Toby Brown on 25/02/2024.
//

import SwiftUI

struct InfoView: View {
    let title: String
    let value: String
    let unit: String
    let phase: String
    let icon: String

    var body: some View {
        if value.isEmpty == false {
                HStack {
                    if (title == "Phase") {
                        if phase == "Gas" {
                            Image(systemName: "wind")
                                .foregroundColor(.cyan)
                        } else if phase == "Solid" {
                            Image(systemName: "cube")
                                .foregroundColor(.cyan)
                        } else if phase == "Liquid" {
                            Image(systemName: "drop")
                                .foregroundColor(.cyan)
                        }
                    } else {
                        Image(systemName: icon)
                            .foregroundColor(.cyan)
                    }
                    
                    
                    Text(title)
                    
                    Spacer()
                    HStack {
                        Text(value)
                        if unit.isEmpty == false {
                            Text("(" + unit + ")")
                        }
                    }.opacity(0.5)
                }
        }
    }
}

#Preview {
    InfoView(title: "Title", value: "Value", unit: "", phase: "Gas", icon: "cube")
}
