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
    
    lazy var host = UIHostingController(rootView: ConvexButton(text: "3D Touch") {
        self.performSegue(withIdentifier: "toZoom", sender: nil)
    })

    override func viewDidLoad() {
        super.viewDidLoad()
        
        host.view.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        self.view.addSubview(host.view)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toZoom":
            let _ = segue.destination as! ZoomViewController
        default:
            break
        }
    }
    
}
