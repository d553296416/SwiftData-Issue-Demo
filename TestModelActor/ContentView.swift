//
//  ContentView.swift
//  TestModelActor
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    let container = modelContext.container
                    let modelId = items[0].persistentModelID
                    // Analog network update
                    Task.detached {
                        let actor = MyModelActor(modelContainer: container)
                        try await actor.updateData(identifier: modelId)
                        
                    }
                } label: {
                    Text("change item date")
                }
                
                List {
                    ForEach(items) { item in
                        // can't update view！！ ❌
                        ItemView()
                            .environment(item)
                        
                        // but this can!! ✅
                        HStack {
                            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                            Text("(can update)")
                        }
                        
                        // but this can!! ✅
                        Item2View(persistentModelID: item.persistentModelID)
                    }
                }
            }
            .onAppear(perform: {
                let newItem = Item(timestamp: Date())
                modelContext.insert(newItem)
            })
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
