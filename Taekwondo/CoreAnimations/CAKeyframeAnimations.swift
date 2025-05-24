//
//  CAKeyframeAnimations.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit
import CoreGraphics


class CAKeyframeAnimations: UIViewController {

    private var txtPassword = UITextField()
    private var btnShake = UIButton()
    private var yellowView = UIView()
    private var btnStart = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        txtPassword.frame = CGRect(x: 100, y: 50, width: 200, height: 40)
        txtPassword.backgroundColor = .white
        view.addSubview(txtPassword)
        
        btnShake.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        btnShake.setTitle("Shake Passcode Field", for: .normal)
        btnShake.setTitleColor(.white, for: .normal)
        btnShake.backgroundColor = .blue
        btnShake.addTarget(self, action: #selector(didShakeButtonTapped), for: .touchUpInside)
        view.addSubview(btnShake)
        
        yellowView.frame = CGRect(x: -50, y: 300, width: 50, height: 50)
        yellowView.backgroundColor = .yellow
        yellowView.layer.cornerRadius = 60
        yellowView.clipsToBounds = true
        view.addSubview(yellowView)
        
        btnStart.frame = CGRect(x: 100, y: 600, width: 200, height: 50)
        btnStart.setTitle("Start", for: .normal)
        btnStart.setTitleColor(.white, for: .normal)
        btnStart.backgroundColor = .blue
        btnStart.addTarget(self, action: #selector(didStartButtonTapped), for: .touchUpInside)
        view.addSubview(btnStart)
    }
    
    @objc func didShakeButtonTapped() {
        self.animatePasscodeField()
    }

    @objc func didStartButtonTapped() {
        self.animateYellowView()
    }
}

extension CAKeyframeAnimations {
    
    private func showSinPath() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = sinPath()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    
    private func sinPath() -> CGPath {
        let startPoint = yellowView.center
        let width = self.view.bounds.width - 2 * startPoint.x
        let height = self.view.bounds.height / 6.0
        return CGPath.sinPath(startPoint: startPoint, width: width, height: height, periods: 1.5)
        
    }
    
    private func animatePasscodeField() {
        let xanimation = CAKeyframeAnimation(keyPath: "position.x")
        xanimation.isAdditive = true
        xanimation.values = [0, 10, -10, 10, -5, 5, -5, 0]
        xanimation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1]
        xanimation.duration = 0.4
        txtPassword.layer.add(xanimation, forKey: "shakePasscodeField")
    }
    
    private func animateYellowView() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = #keyPath(CALayer.position)
        animation.path = self.sinPath()
        animation.repeatCount = 1
        animation.duration = 6.0
        animation.calculationMode = .paced
        animation.rotationMode = .rotateAuto
        yellowView.layer.add(animation, forKey: "sinPath")
    }
}

extension CGPath {
    class func sinPath(startPoint: CGPoint, width: CGFloat, height: CGFloat, periods: CGFloat) -> CGPath {
        let path = UIBezierPath()
        let maxAngle: CGFloat = 2 * CGFloat.pi * periods
        let iterations = Int(min(1000, 100 * periods))
        let point = { (angle: CGFloat) -> CGPoint in
            let x = startPoint.x + angle  / maxAngle * width
            let y = startPoint.y - sin(angle) * height
            return CGPoint(x: x, y: y)
        }
        path.move(to: startPoint)
        for i in 1...iterations {
            path.addLine(to: point(maxAngle * CGFloat(i) / CGFloat(iterations)))
        }
        return path.cgPath
    }
}
