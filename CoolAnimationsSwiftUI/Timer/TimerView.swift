//
//  TimerView.swift
//  CoolAnimationsSwiftUI
//
//  Created by Sabr on 04.07.2024.
//
import SwiftUI

struct TimerView: View {
    private let timer  = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .mint], startPoint: .topLeading, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            HStack(spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20: 0)
                Circle()
                    .offset(y: count == 2 ? -20: 0)
                Circle()
                    .offset(y: count == 3 ? -20: 0)
            }
            .frame(width: 200)
            .foregroundColor(.white)
            
            
        }
        .onReceive(timer, perform: {_ in
            withAnimation(.easeInOut(duration: 0.5)) {
                count = count == 3 ? 0 : count + 1
            }
        })
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

