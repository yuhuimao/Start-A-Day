//
//  LocationListView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/14.
//

import SwiftUI

struct LocationListView: View {
    private let locations: [String] = ["宜蘭縣", "花蓮縣", "臺東縣", "澎湖縣", "金門縣", "連江縣", "臺北市", "新北市", "桃園市", "臺中市", "臺南市", "高雄市", "基隆市", "新竹縣", "新竹市", "苗栗縣", "彰化縣", "南投縣", "雲林縣", "嘉義縣", "嘉義市", "屏東縣"]
    @State private var searchText: String = ""
    @Binding var locationName: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            
            List {
                ForEach(locations.filter { searchText
                    .isEmpty ? true : $0.contains(searchText)
                }, id: \.self) { location in
                    Text(location)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.locationName = location.removingPercentEncoding!
                            presentationMode.wrappedValue.dismiss()
                        }
                }
            }.id(UUID())
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView(locationName: .constant("臺北市"))
    }
}
