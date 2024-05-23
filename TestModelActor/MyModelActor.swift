//
//  MyModelActor.swift
//  TestModelActor
//


import Foundation
import SwiftData

@ModelActor
public actor MyModelActor {

    
    public func updateData(identifier: PersistentIdentifier) throws {
        guard let model = self[identifier, as: Item.self] else {
            return
        }
        model.timestamp = Date()
        try modelContext.save()
    }

    
}
