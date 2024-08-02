//
//  WorkerCellView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct WorkerCellView: View {
    let worker: Worker
    @StateObject var vm: PlaceViewModel
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack(spacing: 20) {
                //MARK: - Photo worker
                if worker.photoWorker == nil{
                   
                        Image(.test)
                            .resizable()
                            .frame(width: 53, height: 53)
                }else{
                    Image(uiImage: worker.photoWorker ?? .worker1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 53, height: 53)
                        .cornerRadius(50)
                }
                
                //MARK: - Divider
                Rectangle()
                    .foregroundStyle(.gray)
                    .frame(width: 1, height: 32)
                
                //MARK: - Name worker
                Text(worker.nameWorker ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .heavy))
                
                Spacer()
                
                Button(action: {vm.deleteWorker(worker: worker)}, label: {
                    Image(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 29, height: 29)
                        .foregroundStyle(.orangeApp)
                })
            }
            .padding()
        }
        
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    WorkerCellView(worker: Worker(), vm: PlaceViewModel())
}
