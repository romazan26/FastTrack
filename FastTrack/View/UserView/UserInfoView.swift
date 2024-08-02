//
//  UserInfoView.swift
//  FastTrack
//
//  Created by Роман on 30.07.2024.
//

import SwiftUI

struct UserInfoView: View {
    @StateObject var vm: RegistrationViewModel
    @StateObject var vmPlace: PlaceViewModel
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack(spacing: 20) {
                //MARK: - Toolbar
                HStack{
                    //MARK: - Back button
                    Button(action: {vm.isPresentInfoUser.toggle()}, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 29, height: 29)
                            .foregroundStyle(.orangeApp)
                    })
                    
                    Spacer()
                    
                    //MARK: - User name
                    Text(vm.users.first?.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    Button(action: {vm.isPresentSetting.toggle()}, label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundStyle(.gray)
                            .frame(width: 24, height: 24)
                    })
                }
                
                //MARK: - Last entry
                HStack {
                    Text("Last entry")
                    Spacer()
                    Text(Dateformatter(date: vm.users.first?.dataEntry ?? Date()))
                }
                .foregroundStyle(.white)
                .padding(.top, 20)
                
                HStack {
                    Text("Name")
                    Spacer()
                    Text("\(vm.users.first?.name ?? "") \(vm.users.first?.serName ?? "")")
                }.foregroundStyle(.gray)
                
                Spacer()
                
                //MARK: - Log out button
                Button(action: {
                    vmPlace.deleteAll()
                    vm.deleteUsers()
                    vm.isPresentGame = false
                    
                }, label: {
                    OrangeButtonView(text: "Log out")
                })
                
            }.padding()
        }
        //MARK: - Sheet
        .sheet(isPresented: $vm.isPresentSetting, content: {
            SettingsView(vm: vm, vmPlace: vmPlace)
        })
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
}

#Preview {
    UserInfoView(vm: RegistrationViewModel(), vmPlace: PlaceViewModel())
}
