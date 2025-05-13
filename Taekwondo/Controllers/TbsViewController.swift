//
//  TbsViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/12/25.
//

import UIKit

let pageSpacing: CGFloat = 10

private var tagKey : UInt8 = 0

extension UITapGestureRecognizer {
 public var tagNo:Int{
    get{
        return objc_getAssociatedObject(self, &tagKey) as! Int
    }
    set(newValue){
        objc_setAssociatedObject(self, &tagKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
 }
}

class TbsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var tbsBatch01: [Tbs1] = []
    private var tbsBatch02: [Tbs2] = []
    private var tbsBatch03: [Tbs3] = []
    private var tbsBatch04: [Tbs4] = []

    private let itemWidth: CGFloat = 100
    private let layout = UICollectionViewFlowLayout()

    private let batch1View = UIView()
    private let batch1Label = UILabel()
    
    private let batch2View = UIView()
    private let batch2Label = UILabel()
    
    private let batch3View = UIView()
    private let batch3Label = UILabel()

    private let batch4View = UIView()
    private let batch4Label = UILabel()
    
    private var collectionview1: UICollectionView!
    private var cellId01 = "Cell01"

    private var collectionview2: UICollectionView!
    private var cellId02 = "Cell02"

    private var collectionview3: UICollectionView!
    private var cellId03 = "Cell03"

    private var collectionview4: UICollectionView!
    private var cellId04 = "Cell04"
        
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.black
        return sv
    }()
    
    private var bodyView: UIView = {
        let v = UIScrollView()
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupUIScroll()

            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 10

            layout.itemSize =  CGSize(width: itemWidth*2.3, height: 221)

        
            ///BATCH 1
            batch1Label.frame = CGRect(x: 10, y: 0, width: 309, height: 21)
            batch1Label.text = "TBS Batch 1"
            batch1Label.textColor = .white
            batch1Label.font = UIFont(name: "Arial Black", size: 28)
            bodyView.addSubview(batch1Label)

            batch1View.frame = CGRect(x: 0, y: 30, width: self.view.frame.size.width*3, height: 222)
            batch1View.backgroundColor = UIColor.blue
            bodyView.addSubview(batch1View)
            
        let frame = CGRect(x: 0, y: 0, width: 400, height: 222)
            collectionview1 = UICollectionView(frame: frame, collectionViewLayout: layout)
            collectionview1.dataSource = self
            collectionview1.delegate = self
            collectionview1.register(TbsCollectionViewCell1.self, forCellWithReuseIdentifier: self.cellId01)
            collectionview1.showsVerticalScrollIndicator = false
            collectionview1.backgroundColor = UIColor.gray
            batch1View.addSubview(collectionview1)
            GETTbSBatch1(batchId: 1)

            ///BATCH 2
            bodyView.addSubview(batch2View)
            batch2Label.frame = CGRect(x: 10, y: 280, width: 309, height: 21)
            batch2Label.text = "TBS Batch 2"
            batch2Label.textColor = .white
            batch2Label.font = UIFont(name: "Arial Black", size: 28)
            bodyView.addSubview(batch2Label)
            
            batch2View.frame = CGRect(x: 0, y: 320, width: self.view.frame.size.width*3, height: 222)
            batch2View.backgroundColor = UIColor.red
            bodyView.addSubview(batch2View)
            let frame2 = CGRect(x: 0, y: 0, width: 400, height: 222)
            collectionview2 = UICollectionView(frame: frame2, collectionViewLayout: layout)
            collectionview2.dataSource = self
            collectionview2.delegate = self
            collectionview2.register(tbsCollectionViewCell2.self, forCellWithReuseIdentifier: self.cellId02)
            collectionview2.showsVerticalScrollIndicator = false
            collectionview2.backgroundColor = UIColor.gray
            batch2View.addSubview(collectionview2)
            GETTbSBatch2(batchId: 2)

            ///BATCH 3
            bodyView.addSubview(batch3View)
            batch3Label.frame = CGRect(x: 10, y: 560, width: 309, height: 21)
            batch3Label.text = "TBS Batch 3"
            batch3Label.textColor = .white
            batch3Label.font = UIFont(name: "Arial Black", size: 28)
            bodyView.addSubview(batch3Label)

            batch3View.frame = CGRect(x: 0, y: 590, width: self.view.frame.size.width*3, height: 222)
            batch3View.backgroundColor = UIColor.blue
            bodyView.addSubview(batch3View)
            
            let frame3 = CGRect(x: 0, y: 0, width: 400, height: 222)
            collectionview3 = UICollectionView(frame: frame3, collectionViewLayout: layout)
            collectionview3.dataSource = self
            collectionview3.delegate = self
            collectionview3.register(TbsCollectionViewCell3.self, forCellWithReuseIdentifier: self.cellId03)
            collectionview3.showsVerticalScrollIndicator = false
            collectionview3.backgroundColor = UIColor.gray
            batch3View.addSubview(collectionview3)
            GETTbSBatch3(batchId: 3)
                
            ///BATCH 4
            bodyView.addSubview(batch3View)
            batch4Label.frame = CGRect(x: 10, y: 820, width: 309, height: 21)
            batch4Label.text = "TBS Batch 4"
            batch4Label.textColor = .white
            batch4Label.font = UIFont(name: "Arial Black", size: 28)
            bodyView.addSubview(batch4Label)
    
            batch4View.frame = CGRect(x: 0, y: 850, width: self.view.frame.size.width*3, height: 222)
            batch4View.backgroundColor = UIColor.orange
            bodyView.addSubview(batch4View)
            let frame4 = CGRect(x: 0, y: 0, width: 400, height: 222)
            collectionview4 = UICollectionView(frame: frame4, collectionViewLayout: layout)
            collectionview4.dataSource = self
            collectionview4.delegate = self
            collectionview4.register(TbsCollectionViewCell4.self, forCellWithReuseIdentifier: self.cellId04)
            collectionview4.showsVerticalScrollIndicator = false
            collectionview4.backgroundColor = UIColor.gray
            batch4View.addSubview(collectionview4)
            GETTbSBatch4(batchId: 4)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    private func setupUIScroll() {
        self.view.addSubview(self.scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
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
            bodyView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor, multiplier: 2.5),
        ])
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.collectionview1.viewWithTag(1) ) {
            return self.tbsBatch01.count
        }
        else if (collectionView == self.collectionview2.viewWithTag(2)) {
            return self.tbsBatch02.count
        }
        else if (collectionView == self.collectionview3.viewWithTag(3)) {
            return self.tbsBatch03.count
        }
        else if (collectionView  == self.collectionview4.viewWithTag(4)) {
            return self.tbsBatch04.count
        }
        return 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == self.collectionview1.viewWithTag(1)) {
            let cell1 = collectionview1.dequeueReusableCell(withReuseIdentifier: self.cellId01, for: indexPath) as! TbsCollectionViewCell1
            let img1 = UIImageView()
            img1.frame = CGRect(x: 0, y: 0, width: 220.0, height: 172.0)
            let url1 = "http://127.0.0.1:9000/assets/tbs/\(self.tbsBatch01[indexPath.row].picture)"
            let urlBatch1 = URL(string: url1)
            if let data1 = try? Data(contentsOf: urlBatch1!) {
                img1.image = UIImage(data: data1)
            }
            img1.isUserInteractionEnabled = true
            let img1Tapped = UITapGestureRecognizer(target: self, action: #selector(img1Btn(_:)))
            img1Tapped.tagNo = self.tbsBatch01[indexPath.row].id
            img1.addGestureRecognizer(img1Tapped)
            cell1.contentView.addSubview(img1)
            
            let batch1Label = UILabel()
            batch1Label.frame = CGRect(x: 0, y: 170, width: 220, height: 40)
            batch1Label.text = self.tbsBatch01[indexPath.row].firstname + " " + self.tbsBatch01[indexPath.row].middlename + " " + self.tbsBatch01[indexPath.row].lastname
            batch1Label.textColor = .white
            batch1Label.backgroundColor = .purple
            cell1.contentView.addSubview(batch1Label)
            return cell1

        } else if (collectionView == self.collectionview2.viewWithTag(2)) {
            
            let cell2 = collectionview2.dequeueReusableCell(withReuseIdentifier: self.cellId02, for: indexPath) as! tbsCollectionViewCell2
            let img2 = UIImageView()
            img2.frame = CGRect(x: 0, y: 0, width: 220, height: self.batch2View.frame.height-50)
            let urla1 = "http://127.0.0.1:9000/assets/tbs/\(self.tbsBatch02[indexPath.row].picture)"
            let urlBatch2 = URL(string: urla1)
            if let data2 = try? Data(contentsOf: urlBatch2!) {
                img2.image = UIImage(data: data2)
            }
            img2.isUserInteractionEnabled = true
            let img2Tapped = UITapGestureRecognizer(target: self, action: #selector(img2Btn(_:)))
            img2Tapped.tagNo = self.tbsBatch02[indexPath.row].id
            img2.addGestureRecognizer(img2Tapped)
            cell2.contentView.addSubview(img2)
            
            let batch2Label = UILabel()
            batch2Label.frame = CGRect(x: 0, y: 170, width: 220, height: 40)
            batch2Label.text = self.tbsBatch02[indexPath.row].firstname + " " + self.tbsBatch02[indexPath.row].middlename + " " + self.tbsBatch02[indexPath.row].lastname
            batch2Label.textColor = .white
            batch2Label.backgroundColor = .purple
            cell2.contentView.addSubview(batch2Label)
            return cell2

        } else if (collectionView == self.collectionview3.viewWithTag(3)) {

            let cell3 = collectionview3.dequeueReusableCell(withReuseIdentifier: self.cellId03, for: indexPath) as! TbsCollectionViewCell3
            let img3 = UIImageView()
            img3.frame = CGRect(x: 0, y: 0, width: 220, height: self.batch3View.frame.height-50)
            let urlb1 = "http://127.0.0.1:9000/assets/tbs/\(self.tbsBatch03[indexPath.row].picture)"
            let urlBatch3 = URL(string: urlb1)
            if let data3 = try? Data(contentsOf: urlBatch3!) {
                img3.image = UIImage(data: data3)
            }
            img3.isUserInteractionEnabled = true
            let img3Tapped = UITapGestureRecognizer(target: self, action: #selector(img3Btn(_:)))
            img3Tapped.tagNo = self.tbsBatch03[indexPath.row].id
            img3.addGestureRecognizer(img3Tapped)
            cell3.contentView.addSubview(img3)
            
            let batch3Label = UILabel()
            batch3Label.frame = CGRect(x: 0, y: 170, width: 220, height: 40)
            batch3Label.text = self.tbsBatch03[indexPath.row].firstname + " " + self.tbsBatch03[indexPath.row].middlename + " " + self.tbsBatch03[indexPath.row].lastname
            batch3Label.textColor = .white
            batch3Label.backgroundColor = .purple
            cell3.contentView.addSubview(batch3Label)
            return cell3

        } else if (collectionView == self.collectionview4.viewWithTag(4)) {

            let cell4 = collectionview4.dequeueReusableCell(withReuseIdentifier: self.cellId04, for: indexPath) as! TbsCollectionViewCell4
            let img4 = UIImageView()
            img4.frame = CGRect(x: 0, y: 0, width: 220, height: self.batch4View.frame.height-50)
            let urlc1 = "http://127.0.0.1:9000/assets/tbs/\(self.tbsBatch04[indexPath.row].picture)"
            let urlBatch4 = URL(string: urlc1)
            if let data4 = try? Data(contentsOf: urlBatch4!) {
                img4.image = UIImage(data: data4)
            }
            img4.isUserInteractionEnabled = true
            let img4Tapped = UITapGestureRecognizer(target: self, action: #selector(img4Btn(_:)))
            img4Tapped.tagNo = self.tbsBatch04[indexPath.row].id
            img4.addGestureRecognizer(img4Tapped)
            cell4.contentView.addSubview(img4)
            
            let batch4Label = UILabel()
            batch4Label.frame = CGRect(x: 0, y: 170, width: 220, height: 40)
            batch4Label.text = self.tbsBatch04[indexPath.row].firstname + " " + self.tbsBatch04[indexPath.row].middlename + " " + self.tbsBatch04[indexPath.row].lastname
            batch4Label.textColor = .white
            batch4Label.backgroundColor = .purple
            cell4.contentView.addSubview(batch4Label)
            return cell4
        }
        return UICollectionViewCell()
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if (collectionView == self.collectionview1.viewWithTag(1)) {
//            self.collectionview1.deselectItem(at: indexPath, animated: true)
//            let row = indexPath.row
//            print(row)
//        } else if (collectionView == self.collectionview2.viewWithTag(2)) {
//            self.collectionview2.deselectItem(at: indexPath, animated: true)
//            let row = indexPath.row
//            print(row)
//        } else if (collectionView == self.collectionview3.viewWithTag(3)) {
//            self.collectionview3.deselectItem(at: indexPath, animated: true)
//            let row = indexPath.row
//            print(row)
//
//        } else if (collectionView == self.collectionview4.viewWithTag(4)) {
//            self.collectionview4.deselectItem(at: indexPath, animated: true)
//            let row = indexPath.row
//            print(row)
//        }
//    }
    
    @objc func img1Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbsDtlsVC") as! TbsDetailsViewController
        vc.tbsId = sender.tagNo
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func img2Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbsDtlsVC") as! TbsDetailsViewController
        vc.tbsId = sender.tagNo
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func img3Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbsDtlsVC") as! TbsDetailsViewController
        vc.tbsId = sender.tagNo
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func img4Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbsDtlsVC") as! TbsDetailsViewController
        vc.tbsId = sender.tagNo
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    func GETTbSBatch1(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbsbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse1 = try? JSONDecoder().decode([Tbs1].self, from: data) {
                  DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                     DispatchQueue.main.async {
                        self.tbsBatch01 = decodedResponse1
                        self.collectionview1.tag = 1
                        self.collectionview1.reloadData()
                     }
                  }
                 }
             }
         }.resume()
    }

    func GETTbSBatch2(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbsbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse2 = try? JSONDecoder().decode([Tbs2].self, from: data) {
                  DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    DispatchQueue.main.async { [self] in
                        self.tbsBatch02 = decodedResponse2
                        self.collectionview2.tag = 2
                        self.collectionview2.reloadData()
                     }
                   }
                 }
             }
         }.resume()
    }

    func GETTbSBatch3(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbsbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse3 = try? JSONDecoder().decode([Tbs3].self, from: data) {
                  DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    DispatchQueue.main.async { [self] in
                        self.tbsBatch03 = decodedResponse3
                        self.collectionview3.tag = 3
                        self.collectionview3.reloadData()
                     }
                  }
                 }
             }
         }.resume()
    }

    func GETTbSBatch4(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbsbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse4 = try? JSONDecoder().decode([Tbs4].self, from: data) {

                  DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                    DispatchQueue.main.async {
                        self.tbsBatch04 = decodedResponse4
                        self.collectionview4.tag = 4
                        self.collectionview4.reloadData()
                    }
                  }
                    
                 }
             }
         }.resume()
    }


    
}


//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//}
