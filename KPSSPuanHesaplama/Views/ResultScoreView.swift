//
//  ResultScoreView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct ResultScoreView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List (0 ..< 50) {item in
                    Text("Hesaplama \(item)")

                }
            }
            .navigationTitle("Gecmis Hesaplamalar")
        }
    }
}

#Preview {
    ResultScoreView()
}
