//
//  AddWorkersView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct AddWorkersView: View {
    let place: Place
    @StateObject var vm: PlaceViewModel
    var body: some View {
        ZStack {
            Color.mainColorApp.ignoresSafeArea()
            VStack {
                //MARK: - Toll bar
                HStack {
                    
                    //MARK: - Back button
                    Button(action: {
                        vm.isPresentEditeWorkers.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .foregroundStyle(.orangeApp)
                            .frame(width: 29, height: 29)
                    })
                    
                    Spacer()
                    
                    //MARK: - Label View
                    Text("Workers")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    //MARK: - Count of workers
                    ZStack{
                        Circle()
                            .frame(width: 38)
                            .foregroundStyle(.secondColorApp)
                        if let workers = place.worker?.allObjects as? [Worker]{
                            Text("\(workers.count)")
                                .foregroundStyle(.white)
                                .font(.system(size: 19, weight: .heavy))
                        }
                    }
                }
                
                //MARK: - Total per workers
                ZStack{
                    Color.secondColorApp
                    VStack{
                        //MARK: - solary Place
                        CustomTextFieldView(placeholder: String(place.salary),
                                            alignment: .center,
                                            textAlignment: .center,
                                            text: $vm.simplePlaceSolary)
                            .foregroundStyle(.white)
                            .font(.system(size: 31, weight: .heavy))
                            .keyboardType(.numberPad)
                            .padding(.top, -20)
                        
                        Text("Total per workers")
                            .foregroundStyle(.gray)
                            .font(.system(size: 14))
                            .padding(.top, -20)
                    }
                }
                .frame(height: 95)
                .cornerRadius(32)
                
                Spacer()
                
                ScrollView {
                    if let workers = place.worker?.allObjects as? [Worker]{
                        ForEach(workers) { worker in
                            WorkerCellView(worker: worker, vm: vm)
                        }
                    }
                    //MARK: - Cars List TF
                    ForEach(0..<vm.countWorkers, id: \.self){i in
                        NewWorkerCellView(nameWorker: $vm.simpleWorkers[i], photoWorker: $vm.simpleWorkersImages[i])
                        
                    }
                    
                    //MARK: - one more car tF Button
                    Button(action: {
                        vm.addNewWorkerCell()
                    }
                    , label: {
                        ZStack {
                            Color.clear
                            Text("+").foregroundStyle(.white)
                        }
                    })
                    .frame(width: 356, height: 63)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white.opacity(0.3), lineWidth: 2)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    AddWorkersView(place: Place(), vm: PlaceViewModel())
}
