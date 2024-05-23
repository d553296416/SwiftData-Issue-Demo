//
//  Item.swift
//  TestModelActor
//


import Foundation
import SwiftData

@Model
final class Item: Sendable {
    var timestamp: Date
    @Attribute(.ephemeral) public var showAlert = false
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
