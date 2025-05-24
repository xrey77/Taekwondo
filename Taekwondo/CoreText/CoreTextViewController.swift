//
//  CoreTextViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CoreTextViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        sv.isScrollEnabled = true
        return sv
    }()
        
    private var bodyView: UIView = {
        let v = UIScrollView()
        return v
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupUI()
    
        
//        // 1
//        guard let file = Bundle.main.path(forResource: "zombies", ofType: "txt") else { return }
//
//        do {
//          let text = try String(contentsOfFile: file, encoding: .utf8)
//
//          // 2
//          let parser = MarkupParser()
//          parser.parseMarkup(text)
//            (self.view as? CTView)?.importAttrString(parser.attrString)
//        print("test")
//
//        } catch _ {
//        }
//
        

    }
    

    private func setupUI() {
        self.view.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = bodyView.frame.size
    
        self.scrollView.addSubview(self.bodyView)
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        
        let hConst = bodyView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            bodyView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            bodyView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            bodyView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            bodyView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            bodyView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1),
            bodyView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 3.9),
        ])
    }

    
    
}
