//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Jacklyn Tsai on 7/18/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        // this view showcases one or more featured landmarks at the top
        NavigationView {
            List{
                // temporary featured landmark display
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .clipped()
                    // content can extend to the edges of the display
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}