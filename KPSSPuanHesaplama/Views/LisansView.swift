//
//  LisansView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct LisansView: View {
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 30
    @State private var gyYanlisSayisi: Double = 0
    
    @State private var sonuc2023: Double = 0
    @State private var sonuc2024: Double = 0
    
    var body: some View {
        VStack {
            Form{
                Section{
                    Stepper("Dogru Sayisi: \(gyDogruSayisi, specifier: "%.0f")", value: $gyDogruSayisi, in: 1...(60-gyYanlisSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                        .bold()

                    Stepper("Yanlis Sayisi: \(gyYanlisSayisi, specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...(60-gyDogruSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                        .bold()
                } header:{
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.main)
                }
                
                Section{
                    Stepper("Dogru Sayisi: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 1...(60-gkYanlisSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                        .bold()

                    Stepper("Yanlis Sayisi: \(gkYanlisSayisi, specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...(60-gkDogruSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                        .bold()

                } header:{
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.main)
                }
                
                Section{
                    
                    Text("2023 KPSS Puaniniz: \(sonuc2023, specifier: "%.3f")")
                        .bold()
                    Text("2024 KPSS Puaniniz: \(sonuc2024, specifier: "%.3f")")
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet: Double = gkDogruSayisi - (gkYanlisSayisi/4)
                        let gyNet: Double = gyDogruSayisi - (gyYanlisSayisi/4)
                        
                        withAnimation(.spring) {
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            sonuc2024 = 48.616 + gyNet * 0.4756 + gkNet * 0.419
                        }
                    }
                    
                } header:{
                    Text("Sonuc").textCase(.none)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.main)
                }
                footer:{
                        Text("Not: Toplam ve dogru yanlis sayilari 60'i gecemez.")
                        .foregroundStyle(.blue)
                }
            }
        }
        .navigationTitle("Lisans (B Grubu)")
    }

}

#Preview {
    LisansView()
}
