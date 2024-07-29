//
//  WorkerCellView.swift
//  FastTrack
//
//  Created by Роман on 29.07.2024.
//

import SwiftUI

struct WorkerCellView: View {
    let worker: Worker
    var body: some View {
        ZStack {
            Color.secondColorApp
            HStack {
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
                Spacer()
                
                //MARK: - Name worker
                Text(worker.nameWorker ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 18, weight: .heavy))
                
                Spacer()
            }
        }
        .frame(height: 74)
        .cornerRadius(25)
    }
}

#Preview {
    WorkerCellView(worker: Worker())
}
