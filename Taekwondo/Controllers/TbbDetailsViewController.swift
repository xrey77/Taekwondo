//
//  TbbDetailsViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/11/25.
//

import UIKit

class TbbDetailsViewController: UIViewController {

    var tbbId: Int = 0
    
    private let tbbPic = UIImageView()
    private let uiLblTitle = UILabel()
    private let uiLblName = UILabel()
    private let uiLblEmailadd = UILabel()
    private let uiLblMobileno = UILabel()
    private let uiLbHomeadd = UILabel()
    private let uiLbDan = UILabel()
    private let uiLbBatch = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbbProfile(tbbId: tbbId)

        uiLblTitle.frame = CGRect(x: 120, y: 100, width: 300, height: 40)
        uiLblTitle.text = "TBB Profile"
        uiLblTitle.font = UIFont.init(name: "arial", size: 24)
        self.view.addSubview(uiLblTitle)

        
        tbbPic.frame = CGRect(x: 90, y: 150, width: 190, height: 200)
        tbbPic.layer.cornerRadius = 20
        tbbPic.clipsToBounds = true

        self.view.addSubview(tbbPic)
        uiLblName.frame = CGRect(x: 100, y: 370, width: 300, height: 40)
        self.view.addSubview(uiLblName)

        uiLbHomeadd.frame = CGRect(x: 100, y: 400, width: 300, height: 40)
        self.view.addSubview(uiLbHomeadd)

        uiLblEmailadd.frame = CGRect(x: 100, y: 430, width: 300, height: 40)
        self.view.addSubview(uiLblEmailadd)
        
        uiLblMobileno.frame = CGRect(x: 100, y: 460, width: 300, height: 40)
        self.view.addSubview(uiLblMobileno)

        uiLbDan.frame = CGRect(x: 100, y: 490, width: 300, height: 40)
        self.view.addSubview(uiLbDan)

        uiLbBatch.frame = CGRect(x: 100, y: 520, width: 300, height: 40)
        self.view.addSubview(uiLbBatch)

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

    func tbbProfile(tbbId: Int) {
        guard let urlx = URL(string: "http://127.0.0.1:9000/gettbbid/\(tbbId)") else { return }
         URLSession.shared.dataTask(with: urlx) { data, response, error in
             if let data = data {
                if let res = try? JSONDecoder().decode(Tbb.self, from: data) {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
                        self.uiLblName.text = res.fullname
                        self.uiLbHomeadd.text = res.homeadd
                        self.uiLblEmailadd.text = res.emailadd!
                        self.uiLblMobileno.text = res.mobileno
                        self.uiLbDan.text = res.dan
                        self.uiLbBatch.text = "TBB Batch " + res.batch!                        
                        let strUrl1 = "http://127.0.0.1:9000/assets/tbb/"
                        let strUrl2 = strUrl1.appending(res.picture!)
                        let url = URL(string: strUrl2)
                        if let data = try? Data(contentsOf: url!) {
                            self.tbbPic.image = UIImage(data: data)
                        }
                     }

                 }
             }
         }.resume()
    }



}
