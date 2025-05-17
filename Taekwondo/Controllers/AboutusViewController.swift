//
//  AboutusViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//

import UIKit

class AboutusViewController: UIViewController {
    private let uiLabeltitle = UILabel()
    private let uiLabel1 = UILabel()
    private let img1 = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        self.uiLabeltitle.frame = CGRect(x: 120, y: 60, width: 270, height: 40)
        self.uiLabeltitle.text = "ABOUT US"
        self.uiLabeltitle.font = UIFont(name: "arial", size: 29)
        self.uiLabeltitle.textColor = .white
        view.addSubview(uiLabeltitle)

        uiLabel1.frame = CGRect(x: 35, y: 120, width: 300, height: 40)
        uiLabel1.text = "The Philippine Taekwondo Association (PTA) is the national governing body for taekwondo in the Philippines. It was established in 1976 and seeks to promote and advance the sport. The PTA is a member of the World Taekwondo Federation and the Philippine Olympic Committee"
        uiLabel1.textColor = .white
        uiLabel1.numberOfLines = 0
        uiLabel1.lineBreakMode = .byWordWrapping
        uiLabel1.sizeToFit()
        uiLabel1.font = UIFont(name: "arial", size: 18)
        uiLabel1.textAlignment = .justified
        view.addSubview(uiLabel1)
     
        img1.frame = CGRect(x: 35, y: 300, width: 300, height: 350)
        img1.image = UIImage(named: "aboutus1")
        img1.layer.cornerRadius = 20
        img1.clipsToBounds = true
        view.addSubview(img1)
        
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left.square"),
            style: .done,
            target: self,
            action: #selector(barTapped(sender:))
        )

        
    }
    
   @objc func barTapped(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
