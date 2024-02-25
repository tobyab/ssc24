import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadData()
    @State private var searchText = ""

    var body: some View {
            Section {
                NavigationStack {
                    
                    List(data.elements) { element in
                        NavigationLink {
                            ElementView(element: element)
                        } label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            if element.phase == "Gas" {
                                                Image(systemName: "wind")
                                                    .opacity(0.5)
                                            } else if element.phase == "Solid" {
                                                Image(systemName: "cube")
                                                    .opacity(0.5)
                                            } else if element.phase == "Liquid" {
                                                Image(systemName: "drop")
                                                    .opacity(0.5)
                                            }
                                            Text(element.symbol)
                                        }
                                        Text(element.name)
                                            .font(.caption)
                                            .opacity(0.5)
                                    }
                                    
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Text(element.category)
                                            .opacity(0.7)
                                            
                                            .font(.subheadline)
                                        Text(String(element.atomicMass))
                                            .opacity(0.5)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                    }.navigationTitle("Periodic Table")
                }.accentColor(.white)
            }
    }
}

#Preview {
    ContentView()
}
