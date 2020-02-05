//
//  ConvexButton.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI
import Neumorphismic

struct ConvexButton: View {
    
    var text: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .center) {
            color.edgesIgnoringSafeArea(.all)
            
            NMHighlightableButton(action: {
                self.action()
            }) { isH in
                Text(self.text)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "3765A9"))
                    .frame(width: 300, height: 125)
                    .contentShape(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(self.color)
                            .frame(width: 300, height: 125)
                            .modifier(NMConvexModifier(bottomRightShadowColor: Color(hex: "7CA0D5"), topLeftShadowColor: Color(hex: "EFF4FA")))
                    )
                    .opacity(isH ? 0.8 : 1)
            }
        }
        .environment(\.nmBaseColor, self.color)
    }
}
    
struct ConvexButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(hex: "C1D2EB")
                .edgesIgnoringSafeArea(.all)
            
            ConvexButton(text: "3D Touch", color: Color(hex: "C1D2EB")) {
                
            }
        }
    }
}
