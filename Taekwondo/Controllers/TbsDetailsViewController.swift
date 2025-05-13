//
//  TbsDetailsViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/13/25.
//

import UIKit

class TbsDetailsViewController: UIViewController {
    var tbsId: Int = 0
    
    private let tbsPic = UIImageView()
    private let uiLblTitle = UILabel()
    private let uiLblName = UILabel()
    private let uiLblEmailadd = UILabel()
    private let uiLblMobileno = UILabel()
    private let uiLbHomeadd = UILabel()
    private let uiLbDan = UILabel()
    private let uiLbBatch = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        GetTbsId(batchId: tbsId)
        
        uiLblTitle.frame = CGRect(x: 120, y: 100, width: 300, height: 40)
        uiLblTitle.text = "TBS Profile"
        uiLblTitle.font = UIFont.init(name: "arial", size: 24)
        self.view.addSubview(uiLblTitle)

        
        tbsPic.frame = CGRect(x: 90, y: 150, width: 190, height: 200)
        tbsPic.layer.cornerRadius = 20
        tbsPic.clipsToBounds = true

        self.view.addSubview(tbsPic)
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
        
        

    }
    
    func GetTbsId(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbsid/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let res = try? JSONDecoder().decode(Tbs.self, from: data) {
                  DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    DispatchQueue.main.async { [self] in
                        self.uiLblName.text = res.fullname
                        self.uiLbHomeadd.text = res.homeadd
                        self.uiLblEmailadd.text = res.emailadd!
                        self.uiLblMobileno.text = res.mobileno
                        self.uiLbDan.text = res.dan
                        self.uiLbBatch.text = "TBS Batch " + res.batch!
                        let strUrl1 = "http://127.0.0.1:9000/assets/tbs/"
                        let strUrl2 = strUrl1.appending(res.picture!)
                        let url = URL(string: strUrl2)
                        if let data = try? Data(contentsOf: url!) {
                            self.tbsPic.image = UIImage(data: data)
                        }

                     }
                  }
                 }
             }
         }.resume()
    }


}
