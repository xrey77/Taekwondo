//
//  CAAnimationDelegate.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CAAnimationDelegate: UIViewController, QuartzCore.CAAnimationDelegate {

    private var tkdImage1 = UIImageView()
    private var startBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tkdImage1 = UIImageView(frame: CGRect(x: 30, y: 100, width: 320, height: 200))
        tkdImage1.image = UIImage(named: "tkd2")
        view.addSubview(tkdImage1)
        
        startBtn.frame = CGRect(x: 90, y: 330, width: 200, height: 50)
        startBtn.setTitle("start", for: .normal)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.backgroundColor = .blue
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        view.addSubview(startBtn)
    }
    

    @objc func startBtnTapped() {

        let fadeOutAnimation = CABasicAnimation()
        fadeOutAnimation.keyPath = "opacity"
        fadeOutAnimation.fromValue = 1
        fadeOutAnimation.toValue = 0
        fadeOutAnimation.duration = 5
        
        fadeOutAnimation.delegate = self
        
        tkdImage1.layer.add(fadeOutAnimation,
                          forKey: "fade")

    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        tkdImage1.layer.removeFromSuperlayer()
    }
}
