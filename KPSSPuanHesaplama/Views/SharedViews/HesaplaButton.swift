//
//  HesaplaButton.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct HesaplaButton: View {
    
    let title: String
    let action: () -> Void
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
        
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("İlk SwiftUI Uygulamam")
    })
}
