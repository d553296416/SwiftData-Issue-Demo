//
//  ItemView.swift
//  TestModelActor
//


import SwiftUI
import SwiftData

struct ItemView: View {
    @Environment(Item.self) private var item
    var body: some View {
        HStack {
            Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
            Text("(can't update)")
        }
    }
}



struct Item2View: View {
    @Query private var items: [Item]
    init(persistentModelID: PersistentIdentifier) {
        _items = Query(filter: #Predicate<Item> { model in
            model.persistentModelID == persistentModelID
        })
    }
    var body: some View {
        HStack {
            Text(items.first!.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
            Text("(can update)")
        }
    }
}
