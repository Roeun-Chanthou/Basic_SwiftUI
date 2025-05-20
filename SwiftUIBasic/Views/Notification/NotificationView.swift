//
//  NotificationView.swift
//  SwiftUIBasic
//
//  Created by lyhou on 20/5/25.
//

import Foundation
import SwiftUI

struct NotificationView: View {
    var activities = [
        "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket",
        "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
    ]

    @State var selected = "Archery"

    var body: some View {
        VStack {
            Text("Notifications").font(.title)
            Spacer()

            Circle().fill(.blue)
                .padding(50)
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                )

            Text("\(selected)").font(.system(size: 20)).padding(.bottom)
            Spacer()

            Button("Try Again") {
                selected = activities.randomElement() ?? "Archery"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    NotificationView()
}
