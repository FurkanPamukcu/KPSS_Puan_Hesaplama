//
//  MainView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NavigationLink(destination: OrtaogretimView()) {
                            HStack {
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Ortaogretim")
                                    .badge(
                                        Text("P94")
                                            .italic()
                                    )
                            }
                        }
        
                        NavigationLink(destination: OnlisansView()) {
                            HStack {
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Onlisans")
                                    .badge(
                                        Text("P93")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: LisansView()) {
                            HStack {
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Lisans (B Grubu)")
                                    .badge(
                                        Text("P3")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: EgitimBilimleriView()) {
                            HStack {
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("Egitim Bilimleri")
                                    .badge(
                                        Text("P10")
                                            .italic()
                                    )
                            }
                        }
                        NavigationLink(destination: OABTView()) {
                            HStack {
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(.main)
                                
                                Text("OABT")
                                    .badge(
                                        Text("P121")
                                            .italic()
                                    )
                            }
                        }
                    }
                    header: { Text("Bolum seciniz").textCase(.none)
                    }
                }
            }
            .navigationTitle("KPSS Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
