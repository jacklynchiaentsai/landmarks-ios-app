//
//  ModelData.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/9/23.
//
/*
 - observable object is a a custom object for data that can be bound to a view from storage
 - SwiftUI subscribes to observable object and updates any views that need refreshing when data changes
 - an observable needs to publish any changes to its data  (@Publish) for subsriber to pick up the change
 */

import Foundation
import Combine

// declare a new model type that conforms to the Observable Object Protocol from the Combine framework
final class ModelData: ObservableObject{
    // create arraty of landmarks initialzed from .json file
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}


// load method that fetches JSON data with a given name from the app's main bundle
// relies on return type's conformance to the Decodable protocol

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
