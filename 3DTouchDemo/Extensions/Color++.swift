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
