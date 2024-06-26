//
//  MaskSwiftUI.swift
//  CoolAnimationsSwiftUI
//
//  Created by Sabr on 26.06.2024.
//

import SwiftUI

struct MaskSwiftUI: View {
    @State var rating: Int = 0

    var body: some View {
        ZStack {
            starsView
                .overlay( overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack() {
                Rectangle()
                    .fill(LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MaskSwiftUI()
    }
}
