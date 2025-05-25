//
//  OABTView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct OABTView: View {
    @State private var gkDogruSayisi: Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 30
    @State private var gyYanlisSayisi: Double = 0
    
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    @State private var oabtDogruSayisi: Double = 40
    @State private var oabtYanlisSayisi: Double = 0
    
    @State private var sonuc2023: Double = 0
    @State private var sonuc2024: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var sonucEB2024: Double = 0
    @State private var sonucOABT2023: Double = 0
    @State private var sonucOABT2024: Double = 0

    @State private var isShowingSheet: Bool = false
    
    @State private var oabtKatsayi = 0.4334
    @State private var oabtPuan = 43.805
    
    @State private var selectedOption = 0
    let options = [
    (0.4334,43.805, "Beden Egitimi"),
    (0.3666,41.071, "Biyoloji"),
    (0.4301, 39.060, "Cografya"),
    (0.4052,34.908, "Din Kültürü"),
    (0.3679,42.156, "Edebiyat"),
    (0.5388,39.313, "Fen Bilgisi"),
    (0.3817,41.604, "Fizik"),
    (0.5225,36.309, "ilkögretim Matematik"),
    (0.3883,37.962, "imam Hatip Meslek Dersleri Ö."),
    (0.3791, 40.920, "ingilizce"),
    (0.4542,42.157, "Kimya") ,
    (0.4247,41.759, "Lise Matematik"),
    (0.4944,33.292, "Okul Öncesi"),
    (0.4883, 29.014, "Rehberlik "),
    (0.6184,33.598, "Sinif Ögretmenligi"),
    (0.6142,34.101, "Sosyal Bilgiler"),
    (0.3521,41.418, "Tarih") ,
    (0.4565,34.329, "Türkçe")
    ]
    
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
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.main)
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
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.main)
                }
                
                Section{
                    Stepper("Dogru Sayisi: \(ebDogruSayisi, specifier: "%.0f")", value: $ebDogruSayisi, in: 1...(80-ebYanlisSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()

                    Stepper("Yanlis Sayisi: \(ebYanlisSayisi, specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...(80-ebDogruSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()

                } header:{
                    Text("Egitim Bilimleri")
                        .textCase(.none)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.main)
                    
                } footer:{
                    Text("Not: Egitim Bilimleri dogru ve yanlis sayilari toplami 80'i gecemez.")
                    .foregroundStyle(.blue)
            }
                
                Section{
                    Picker("Bolum Seciniz", selection: $selectedOption) {
                        ForEach(0..<options.count, id: \.self){ index in
                            HStack{
                                Text(options[index].2)
                            }
                        }
                    }
                    .pickerStyle(.wheel)
                    .tint(Color.main)
                    .onChange(of: selectedOption) {
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    
                    Stepper("Dogru Sayisi: \(oabtDogruSayisi, specifier: "%.0f")", value: $oabtDogruSayisi, in: 1...(75-oabtYanlisSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: oabtDogruSayisi)
                        .bold()

                    Stepper("Yanlis Sayisi: \(oabtYanlisSayisi, specifier: "%.0f")", value: $oabtYanlisSayisi, in: 0...(75-oabtDogruSayisi), step: 1)
                        .sensoryFeedback(.selection, trigger: oabtYanlisSayisi)
                        .bold()
                    HesaplaButton(title: "Hesapla") {
                        let gkNet: Double = gkDogruSayisi - (gkYanlisSayisi/4)
                        let gyNet: Double = gyDogruSayisi - (gyYanlisSayisi/4)
                        let ebNet: Double = ebDogruSayisi - (ebYanlisSayisi/4)
                        let oabtNet: Double = oabtDogruSayisi - (oabtYanlisSayisi/4)
                        isShowingSheet.toggle()

                        withAnimation(.spring) {
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                            sonuc2024 = 48.616 + gyNet * 0.4756 + gkNet * 0.419
                            sonucEB2024 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            sonucOABT2023 = oabtPuan + gyNet * 0.1720 + gkNet * 0.3672 + ebNet * 0.37145 + oabtNet * oabtKatsayi
                            sonucOABT2024 = oabtPuan + gyNet * 0.1992 + gkNet * 0.3512 + ebNet * 0.34714 + oabtNet * oabtKatsayi
                            
                        }
                    }
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2023: sonuc2023, sonuc2024: sonuc2024, sonucEB2023: sonucEB2023, sonucEB2024: sonucEB2024, sonucOABT2023: sonucOABT2023, sonucOABT2024: sonucOABT2024)
                    }

                } header:{
                    Text("OABT")
                        .textCase(.none)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.main)
                } footer:{
                    Text("Not: OABT dogru ve yanlis sayilari toplami 75'i gecemez.")
                    .foregroundStyle(.blue)
            }
                
            }
        }
        .navigationTitle("OABT")
    }
}


#Preview {
    OABTView()
}
