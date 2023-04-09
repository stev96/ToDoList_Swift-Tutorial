//
//  ContentView.swift
//  ToDoList
//
//  Created .
//

import SwiftUI

struct Aufgabe: Identifiable {
    
    var id = UUID()
    var bezeichnung: String
    var erledigt = false
}

struct ContentView: View {
    
    @State var isBold = false
    @State  var abstand = 0
    @State var neueAufgabe = ""
    @State var aufgaben: [Aufgabe] = [
    ]
    
    // Oberflächeninhalt
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(aufgaben.indices, id: \.self) { i in
                        HStack {
                            Button(action: {
                                aufgaben[i].erledigt.toggle()
                                
                            }, label: {
                                if aufgaben[i].erledigt {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                } else {
                                    Image(systemName: "circle")
                                }
                            }).buttonStyle(PlainButtonStyle())
                            NavigationLink(destination: DetailView(bezeichnung: $aufgaben[i].bezeichnung)) {
                                Text(aufgaben[i].bezeichnung)
                            }
                        }
                    }
                    .onDelete(perform: { offset in
                        aufgaben.remove(atOffsets: offset)
                    })
                }
                
                Spacer()
                HStack {
                    TextField("Neue Aufgabe", text: $neueAufgabe)
                    Button("Hinzufügen") {
                        let aufgabe = Aufgabe(bezeichnung: neueAufgabe)
                        aufgaben.append(aufgabe)
                        neueAufgabe = ""
                    }
                }
                .padding(.horizontal, 30)
                }
                .navigationTitle("Meine Aufgaben")
            
            }
        }
    }
    
struct DetailView: View {
    
    @Binding var bezeichnung: String
    
    var body: some View {
        TextField("Aufgabe", text: $bezeichnung)
    }
    
    
    
    
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
