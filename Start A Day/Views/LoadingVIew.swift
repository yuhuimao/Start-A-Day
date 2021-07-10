//
//  LoadingVIew.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/9.
//

import SwiftUI

struct LoadingView: View {
    var tintColor: Color = .gray
    var scale: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scale, anchor: .center)
            .foregroundColor(tintColor)
    }
}

struct LoadingVIew_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

extension LoadingView {
    @ViewBuilder func hidden(_ shouldHidden: Bool) -> some View {
        switch shouldHidden {
        case true:
            self.hidden()
            
        case false:
            self
        }
    }
}
