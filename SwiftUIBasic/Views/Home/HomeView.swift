//
//  HomeView.swift
//  SwiftUIBasic
//
//  Created by lyhou on 20/5/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var activities = [
        "Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket",
        "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash",
    ]

    var colors: [Color] = [
        .blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple,
        .red,
    ]

    @State private var selected = "Baseball"
    @State private var id = 1

    var body: some View {
        VStack {
            Text("Why not try").font(.largeTitle.bold())
            Spacer()

            Circle()
                .fill(colors.randomElement() ?? .blue)
                .padding(20)
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 100))
                        .foregroundStyle(.white)
                )
                .transition(.slide)
                .id(id)

            Text("\(selected)")
                .font(.system(size: 20))
                .padding(.bottom)
            Spacer()

            Button("Try Again") {
                withAnimation(.easeIn(duration: 1)) {
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }

            }
            .buttonStyle(.borderedProminent)
        }

    }
}

#Preview {
    HomeView()
}
