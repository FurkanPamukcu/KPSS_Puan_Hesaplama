//
//  SonucView.swift
//  KPSSPuanHesaplama
//
//  Created by Furkan Pamukcu on 25.05.2025.
//

import SwiftUI

struct SonucView: View {
    
    @Environment(\.dismiss) private var dismiss
    let sonuc2023: Double
    let sonuc2024: Double
    let sonucEB2023: Double
    let sonucEB2024: Double
    let sonucOABT2023: Double?
    let sonucOABT2024: Double?

    
    var body: some View {
        
        NavigationStack {
            VStack {
                List{
                    Section {
                        Text("2023 P3 Puaniniz: \(sonuc2023, specifier: "%.3f")")
                            .bold()
                        Text("2024 P3 Puaniniz: \(sonuc2024, specifier: "%.3f")")
                            .bold()
                    }
                    header: {
                        Text("P3 (Memur) KPSS")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.main)
                    }
                    
                    Section {
                        Text("2023 P10 Puaniniz: \(sonucEB2023, specifier: "%.3f")")
                            .bold()
                        Text("2024 P10 Puaniniz: \(sonucEB2024, specifier: "%.3f")")
                            .bold()
                    }
                    header: {
                        Text("P10 (Ogretmen) KPSS")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundStyle(.main)
                    }
                    
                    Section {
                        if sonucOABT2023 != nil{
                            Text("2023 P121 Puaniniz: \(sonucOABT2023 ?? 0, specifier: "%.3f")")
                                .bold()
                        }
                        if sonucOABT2024 != nil{
                            Text("2024 P121 Puaniniz: \(sonucOABT2024 ?? 0, specifier: "%.3f")")
                                .bold()
                            
                        }
                    }
                    header: {
                        if sonucOABT2023 != nil || sonucOABT2024 != nil {
                            Text("P121 (OABT) KPSS")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.main)
                        }
                    }
                }
            }
            .navigationTitle("Sonuc")
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .tint(Color.main)
                            .frame(width: 50, height: 50)
                            .background(Material.thin)
                            .cornerRadius(10)
                            .padding(.vertical, 5)
                    }

                })
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    SonucView(sonuc2023: 0, sonuc2024: 0, sonucEB2023: 0, sonucEB2024: 0, sonucOABT2023: 0, sonucOABT2024: 0)
}
