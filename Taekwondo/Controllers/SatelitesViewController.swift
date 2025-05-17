//
//  SatelitesViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/16/25.
//

import UIKit

class SatelitesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
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


}
