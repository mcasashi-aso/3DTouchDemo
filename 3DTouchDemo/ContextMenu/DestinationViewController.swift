//
//  DestinationViewController.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/04.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import UIKit

class DestinationViewController: UIViewController {
    
    class func create() -> Self {
        let sb = UIStoryboard(name: "ContextMenu", bundle: nil)
        return sb.instantiateViewController(identifier: "destination")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
