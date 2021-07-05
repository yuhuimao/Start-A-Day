//
//  DashboardView.swift
//  Start A Day
//
//  Created by 游輝懋 on 2021/7/5.
//

import SwiftUI
import UIKit

struct DashboardView: View {
    var body: some View {
        VStack {
            NewsCard()
                .padding(4)
            
            HStack(spacing: 1) {
                WeatherCard()
                ToDoListView()
            }
            .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
            
            Spacer()
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
