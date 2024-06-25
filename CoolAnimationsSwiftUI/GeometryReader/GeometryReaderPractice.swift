//
//  GeometryReaderBootcamp.swift
//  Testing
//
//  Created by Sabr on 24.06.2024.
//

import SwiftUI

struct GeometryReaderPractice: View {
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        VStack {
                            RoundedRectangle(cornerRadius: 20)
                                .rotation3DEffect(
                                    Angle(degrees: getPercentage(geo: geometry) * 10),
                                    axis: (x: 0.0, y: 1.0, z: 0.0))
                            Text("\(geometry.frame(in: .global).midX)")
                        }
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
}

struct GeometryReaderPractice_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPractice()
    }
}
