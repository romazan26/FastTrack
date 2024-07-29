//
//  WorkersView.swift
//  FastTrack
//
//  Created by Роман on 27.07.2024.
//

import SwiftUI

struct WorkersCellView: View {
    
    let place: Place

    var body: some View {
        ZStack {
            Color.secondColorApp
            if let workers = place.worker?.allObjects as? [Worker]{
                HStack {
                    if workers.isEmpty{
                        
                        //MARK: - No workers
                        HStack {
                            Circle().frame(width: 54)
                                .overlay {
                                    Circle()
                                        .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                                }
                            Circle().frame(width: 54)
                                .overlay {
                                    Circle()
                                        .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                                }
                                .offset(x: -30)
                            Circle().frame(width: 54)
                                .overlay {
                                    Circle()
                                        .stroke(.secondColorApp.opacity(0.5), lineWidth: 4.0)
                                }
                                .offset(x: -60)
                        }.foregroundStyle(.mainColorApp)
                        
                    }else{
                        //MARK: - Yes wirkers
                        HStack(spacing: -20) {
                            ForEach(workers) { worker in
                                Image(uiImage: worker.photoWorker ?? .worker1)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 53, height: 53)
                                    .cornerRadius(50)
                            }
                        }
                    }
                    
                    
                    //MARK: - Count of workers
                    Text("\(workers.count) workers")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .heavy))
                        .offset(x: workers.isEmpty ? -40: 0)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.circle.fill")
                        .resizable()
                        .foregroundStyle(.orangeApp)
                        .frame(width: 29, height: 29)
                }.padding()
            }
        }
        .frame(height: 82)
        .cornerRadius(41)
    }
}

#Preview {
    WorkersCellView(place: Place())
}
