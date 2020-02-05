//
//  Color++.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI

extension Color {
    func primary(_ value: Double) -> Color {
        let (_, _, l, _) = getHSLA()
        return (l > 0.5) ? darker(value) : lighter(value)
    }
}

struct ColorExtension_Preview: PreviewProvider {
    
    static func preview(_ color: Color) -> some View {
        ZStack {
            color
            Text(color.description)
        }
    }
    
    static var previews: some View {
        let base = Color(hex: "C1D2EB")
        return Group {
            preview(base)
            preview(base.darker(0.18))
            preview(base.lighter(0.12))
            preview(base.primary(0.4))
        }
        .previewLayout(.fixed(width: 200, height: 100))
    }
}
