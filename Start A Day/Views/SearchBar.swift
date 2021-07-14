//
//  SearchBar.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/14.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    // MARK: - Properties
    
    typealias UIViewType = UISearchBar
    
    @Binding var text: String
    
    // MARK: - Methods
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}
