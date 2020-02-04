//
//  ViewController.swift
//  3DTouchDemo
//
//  Created by Masashi Aso on 2020/02/02.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//

import Combine
import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    
    @Published var force: CGFloat = 0
    @Published var point: CGPoint = .zero
    
    var cancelable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.bounds.width
        let height = self.view.bounds.height
        let imageHeight = self.imageView.bounds.height
        self.point = self.view.center
        
        let magnificationPublisher = self.$force
            .map { force in (1 + force*5) }
        
        magnificationPublisher
            .map { multiple in width * multiple }
            .assign(to: \.widthConstraint.constant, on: self)
            .store(in: &cancelable)
        
        self.$point
            .map { point in -(point.x - width/2) }
            .combineLatest(magnificationPublisher)
            .map { _x, magnification in
                let x = _x * magnification
                let limitAbs = width/2 * (magnification-1)
                let limit = x > 0 ? limitAbs : -limitAbs
                return abs(x) < limitAbs ? x : limit
            }
            .assign(to: \.horizontalConstraint.constant, on: self)
            .store(in: &cancelable)
        
        self.$point
            .map { point in -(point.y - height/2) }
            .combineLatest(magnificationPublisher)
            .map { _y, magnification in
                let y = _y * magnification
                let limitAbs = (height - imageHeight)/2 * (magnification-1)
                let limit = y > 0 ? limitAbs : -limitAbs
                return abs(y) < limitAbs ? y : limit
            }
            .assign(to: \.verticalConstraint.constant, on: self)
            .store(in: &cancelable)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let percent = touch.force / touch.maximumPossibleForce
        self.force = percent
        self.point = touch.location(in: self.view)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.force = 0
        self.point = self.view.center
    }
    
    override var canBecomeFirstResponder: Bool { true }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.dismiss(animated: true)
        }
    }
    
}

