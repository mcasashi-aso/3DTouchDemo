//
//  ViewController.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    let baseColor = UIColor(red: 193, green: 226, blue: 251, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = baseColor
        
        // toZoom
        let toZoomButton = ConvexButton(text: "Zoom", color: Color(baseColor)) {
            self.performSegue(withIdentifier: "toZoom", sender: nil)
        }
        let toZoomHost = UIHostingController(rootView: toZoomButton)
        toZoomHost.view.frame = CGRect(x: 40, y: 100, width: 300 + 32, height: 125 + 32)
        self.view.addSubview(toZoomHost.view)
        
        // toContextMenu
        let toContextMenuButton = ConvexButton(text: "Context Menu", color: Color(baseColor)) {
            self.performSegue(withIdentifier: "toContextMenu", sender: nil)
        }
        let toContextMenuHost = UIHostingController(rootView: toContextMenuButton)
        toContextMenuHost.view.frame = CGRect(x: 0, y: 0, width: 300, height: 125)
//        self.view.addSubview(toContextMenuHost.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toZoom":
            _ = segue.destination as! ZoomViewController
        case "toContextMenu":
            _ = segue.destination as! ContextMenuViewController
        default:
            fatalError("segue was not found")
        }
    }
    
}
