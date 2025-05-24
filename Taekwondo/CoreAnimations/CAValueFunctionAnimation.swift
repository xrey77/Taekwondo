//
//  CAValueFunctionAnimation.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CAValueFunctionAnimation: UIViewController {

    private var globeIcon = UIImageView()
    private var globeBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        globeIcon.frame = CGRect(x: 90, y: 100, width: 200, height: 200)
        globeIcon.image = UIImage(named: "globes")
        view.addSubview(globeIcon)
        
        
        globeBtn.frame = CGRect(x: 120, y: 340, width: 150, height: 50)
        globeBtn.setTitle("start animation", for: .normal)
        globeBtn.setTitleColor(.white, for: .normal)
        globeBtn.backgroundColor = .blue
        globeBtn.addTarget(self, action: #selector(startAnimationTapped), for: .touchUpInside)
        view.addSubview(globeBtn)
        
        

    }
    
    @objc func startAnimationTapped() {
        let rotateAnimation = CABasicAnimation()
        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = Float.pi
        rotateAnimation.duration = 5
        rotateAnimation.repeatCount = .infinity
        globeIcon.layer.add(rotateAnimation, forKey: "transform")    
    }

}
