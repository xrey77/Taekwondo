//
//  CATransitionAnimation.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CATransitionAnimation: UIViewController {
    private let transitioningLayer = CATextLayer()

    private var transitionView = UIView()
    private var transitionBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        transitionView.frame = CGRect(x: 50, y: 100, width: 280, height: 100)
        transitionView.backgroundColor = .white
        view.addSubview(transitionView)
        
        transitionBtn.frame = CGRect(x: 100, y: 220, width: 200, height: 50)
        transitionBtn.setTitle("start Transition", for: .normal)
        transitionBtn.setTitleColor(.white, for: .normal)
        transitionBtn.backgroundColor = .blue
        transitionBtn.addTarget(self, action: #selector(transitionBtnTapped), for: .touchUpInside)
        view.addSubview(transitionBtn)
    }
    
    @objc func transitionBtnTapped() {
        transitioningLayer.frame = CGRect(x: 50, y: 100,
                                             width: 280, height: 100)
           
        view.layer.addSublayer(transitioningLayer)
           
           // Initial "red" state
           transitioningLayer.backgroundColor = UIColor.red.cgColor
           transitioningLayer.string = "Red"
           transitioningLayer.alignmentMode = .center
        runTransition()
    }

    func runTransition() {
        let transition = CATransition()
        transition.duration = 2

        transition.type = CATransitionType.push
        transition.type = .moveIn
        transition.subtype = .fromRight
//        transition.subtype = .fromTop
//        transition.subtype = .fromBottom
//        transition.subtype = .fromLeft
//        transition.autoreverses = true
//        transition.repeatCount = .infinity
        transitioningLayer.add(transition,
                               forKey: "transition")

        // Transition to "blue" state
        transitioningLayer.backgroundColor = UIColor.blue.cgColor
        transitioningLayer.string = "Blue"
    }
}
