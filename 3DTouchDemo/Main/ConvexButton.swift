//
//  ConvexButton.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import SwiftUI

struct ConvexButton: View {
    
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(text) {
            self.action()
        }
    }
}

struct ConvexButton_Previews: PreviewProvider {
    static var previews: some View {
        ConvexButton(text: "3D Touch") {
            
        }
    }
}
