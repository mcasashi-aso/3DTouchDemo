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
    
    let baseColor = UIColor(red: 193/255, green: 226/255, blue: 251/255, alpha: 1)

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
        toZoomHost.view.frame = CGRect(x: 40, y: 100, width: 300, height: 125)
        self.view.addSubview(toZoomHost.view)
        
        // toContextMenu
        let toContextMenuButton = ConvexButton(text: "Context Menu", color: Color(baseColor)) {
            self.performSegue(withIdentifier: "toCentextMenu", sender: nil)
        }
        let toContextMenuHost = UIHostingController(rootView: toContextMenuButton)
        toContextMenuHost.view.frame = CGRect(x: 40, y: 300, width: 300, height: 125)
        self.view.addSubview(toContextMenuHost.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toZoom":
            _ = segue.destination as! ZoomViewController
        case "toCentextMenu":
            let nav = segue.destination as! UINavigationController
            _ = nav.viewControllers.first! as! ContextMenuViewController
        default:
            fatalError("segue was not found")
        }
    }
    
}
