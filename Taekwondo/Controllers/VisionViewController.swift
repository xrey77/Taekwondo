//
//  VisionViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//

import UIKit

class VisionViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
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
