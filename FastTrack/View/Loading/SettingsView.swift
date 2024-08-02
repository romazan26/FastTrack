//
//  SettingsView.swift
//  FastTrack
//
//  Created by Роман on 30.07.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var vm: RegistrationViewModel
    @StateObject var vmPlace: PlaceViewModel
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack{
                //MARK: - Toolbar
                HStack {
                   
                    Spacer()
                    Text("Settings")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .offset(x: 6)
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.white)
                    }
                    
                }.padding()
                
                Spacer()
                //MARK: - Share App Button
                Button(action: {isPresentShare.toggle()}, label: {
                    SettingButton(text: "SHARE APP", imageName: "square.and.arrow.up")
                })
                
                
                //MARK: - Rate App Button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    SettingButton(text: "RATE APP", imageName: "star.fill")
                }
                
                //MARK: - Privacy button
                Button(action: {isPresentPolicy.toggle()}, label: {
                    SettingButton(text: "PRIVACY POLICY", imageName: "line.diagonal.arrow")
                })
                Spacer()
                
                //MARK: - Log out button
                Button(action: {
                    vmPlace.deleteAll()
                    vm.deleteUsers()
                    vm.isPresentGame = false
                }, label: {
                    OrangeButtonView(text: "Log out")
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: "https://google.com")!)
        })
    }
}

#Preview {
    SettingsView(vm: RegistrationViewModel(), vmPlace: PlaceViewModel())
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
