//
//  ViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//  Sr. Software Engineer / Philippine National Taekwondo Instructor
//
import iCarousel
import Foundation
import UIKit


class ViewController: UIViewController {
    private let splashView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 110, y: 150, width: 150, height: 300))
        imageView.image = UIImage(named: "pta_splash")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(splashView)

    }
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    ///SPLASH SCREEN ANIMATION
    override func viewDidLayoutSubviews() {
        self.splashView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            animates()
    })
        
    func animates() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffx = size - self.view.frame.size.width
            let diffy = self.view.frame.size.height - size
            self.splashView.frame = CGRect(x: -(diffx/2), y: diffy/2, width: size, height: size)
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.splashView.alpha = 0
        }, completion: { done in
            if done {
                
                let homeVC = HomeViewController()
                let homeViewController = UINavigationController(rootViewController: homeVC)
//                homeViewController.modalTransitionStyle = .crossDissolve
                homeViewController.modalPresentationStyle = .fullScreen
                self.present(homeViewController, animated: true, completion: nil)
            }            
        })
    }

}
}
