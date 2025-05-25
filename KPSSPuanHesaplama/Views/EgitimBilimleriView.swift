//
//  EgitimBilimleriView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct EgitimBilimleriView: View {
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 30
    @State private var gyYanlisSayisi: Double = 0
    
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    
    @State private var sonuc2023: Double = 0
    @State private var sonuc2024: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var sonucEB2024: Double = 0
    
    @State private var isShowingSheet: Bool = false
    
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
                    Stepper("Dogru Sayisi: \(ebDogruSayisi, specifier: "%.0f")", value: $ebDogruSayisi, in: 1...(80-ebYanlisSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()

                    Stepper("Yanlis Sayisi: \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...(80-ebDogruSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet: Double = gkDogruSayisi - (gkYanlisSayisi/4)
                        let gyNet: Double = gyDogruSayisi - (gyYanlisSayisi/4)
                        let ebNet: Double = ebDogruSayisi - (ebYanlisSayisi/4)
                        
                        withAnimation(.spring) {
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            sonuc2024 = 48.616 + gyNet * 0.4756 + gkNet * 0.419
                            sonucEB2024 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            
                            isShowingSheet.toggle()
                        }
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2023: sonuc2023, sonuc2024: sonuc2024, sonucEB2023: sonucEB2023, sonucEB2024: sonucEB2024, sonucOABT2023: nil, sonucOABT2024: nil)
                    }

                } header:{
                    Text("Egitim Bilimleri")
                        .textCase(.none)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle(.main)
                } footer:{
                        Text("Not: Egitim Bilimleri dogru ve yanlis sayilari toplami 80'i gecemez.")
                        .foregroundStyle(.blue)
                }
            }
        }
        .navigationTitle("Egitim Bilimleri")
    }
}

#Preview {
    EgitimBilimleriView()
}
