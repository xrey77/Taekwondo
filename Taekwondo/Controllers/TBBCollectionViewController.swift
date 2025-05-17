//
//  TBBCollectionViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/5/25.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "headerView"
private let footerReuseIdentifier = "footerView"

private var tagKey : UInt8 = 0

extension UITapGestureRecognizer {

public var tagName:Int{
    get{
        return objc_getAssociatedObject(self, &tagKey) as! Int

    }
    set(newValue){
        objc_setAssociatedObject(self, &tagKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}
}

class TBBCollectionViewController: UICollectionViewController {
    
    private var tbbBatch1: [Tbb1] = []
    private var tbbBatch2: [Tbb2] = []
    private var tbbBatch3: [Tbb3] = []
    private var tbbBatch4: [Tbb4] = []

    private var hdrView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        loadTbbBatch1(batchId: 1)
        loadTbbBatch2(batchId: 2)
        loadTbbBatch3(batchId: 3)
        loadTbbBatch4(batchId: 4)

        //HEADER
        self.collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        //FOOTER
//        self.collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerReuseIdentifier)
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left.square"),
            style: .done,
            target: self,
            action: #selector(barTapped(sender:))
        )

        
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var cnt: Int = 0
        switch section {
        case 1:
            cnt = tbbBatch1.count
            break
        case 2:
            cnt = tbbBatch2.count
            break
        case 3:
            cnt = tbbBatch3.count
            break
        case 4:
            cnt = tbbBatch4.count
            break
        default:
            break
        }
        return cnt
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        if (indexPath.section == 0) {
            return cell
        } else if (indexPath.section == 1) {
            
            let tbbPics1 = UIImageView()
            tbbPics1.frame = CGRect(x: 0.0, y: 0.0, width: 190, height: 190)
            let str1 = "http://127.0.0.1:9000/assets/tbb/"
            let str2 = str1.appending(self.tbbBatch1[indexPath.row].picture)
            let url = URL(string: str2)
            if let data = try? Data(contentsOf: url!) {
                tbbPics1.image = UIImage(data: data)
            }

            let tbbPics1Tapped = UITapGestureRecognizer(target: self, action: #selector(section1Btn(_:)))
            tbbPics1.isUserInteractionEnabled = true
            tbbPics1Tapped.tagName = self.tbbBatch1[indexPath.row].id
            tbbPics1.addGestureRecognizer(tbbPics1Tapped)
            
            cell.contentView.addSubview(tbbPics1)
            cell.backgroundColor = .black
            let lblDesc1 = UILabel()
            lblDesc1.frame = CGRect(x: 0, y: 200, width: 190, height: 40)
            let fullname = tbbBatch1[indexPath.row].firstname + " " + tbbBatch1[indexPath.row].lastname
            lblDesc1.text = fullname
            lblDesc1.setNeedsDisplay()
            lblDesc1.textColor = UIColor.yellow
            lblDesc1.backgroundColor = .darkGray
            lblDesc1.font = UIFont(name: "Arial", size: 14)
            cell.contentView.addSubview(lblDesc1)
            return cell
            
        } else if (indexPath.section == 2) {
            
            let tbbPics2 = UIImageView()
            tbbPics2.frame = CGRect(x: 0.0, y: 0.0, width: 190, height: 200)
            let str1 = "http://127.0.0.1:9000/assets/tbb/"
            let str2 = str1.appending(self.tbbBatch2[indexPath.row].picture)
            let url = URL(string: str2)
            if let data = try? Data(contentsOf: url!) {
                tbbPics2.image = UIImage(data: data)
            }

            let tbbPics2Tapped = UITapGestureRecognizer(target: self, action: #selector(section2Btn(_:)))
            tbbPics2Tapped.tagName = self.tbbBatch2[indexPath.row].id
            tbbPics2.isUserInteractionEnabled = true
            tbbPics2.addGestureRecognizer(tbbPics2Tapped)

            cell.contentView.addSubview(tbbPics2)
            cell.backgroundColor = .black
            
            let lblDesc2 = UILabel()
            lblDesc2.frame = CGRect(x: 0, y: 200, width: 190, height: 40)
            let fullname = tbbBatch2[indexPath.row].firstname + " " + tbbBatch2[indexPath.row].lastname
            lblDesc2.text = fullname
            lblDesc2.textColor = UIColor.yellow
            lblDesc2.backgroundColor = .darkGray
            lblDesc2.font = UIFont(name: "Arial", size: 14)
            cell.contentView.addSubview(lblDesc2)
            return cell
            
        } else if (indexPath.section == 3) {
            
            let tbbPics3 = UIImageView()
            tbbPics3.frame = CGRect(x: 0.0, y: 0.0, width: 190, height: 200)
            let str1 = "http://127.0.0.1:9000/assets/tbb/"
            let str2 = str1.appending(self.tbbBatch3[indexPath.row].picture)
            let url = URL(string: str2)
            if let data = try? Data(contentsOf: url!) {
                tbbPics3.image = UIImage(data: data)
            }

            let tbbPics3Tapped = UITapGestureRecognizer(target: self, action: #selector(section3Btn(_:)))
            tbbPics3Tapped.tagName = self.tbbBatch3[indexPath.row].id
            tbbPics3.isUserInteractionEnabled = true
            tbbPics3.addGestureRecognizer(tbbPics3Tapped)
            
            cell.contentView.addSubview(tbbPics3)
            cell.backgroundColor = .black

            let lblDesc3 = UILabel()
            let fullname = tbbBatch3[indexPath.row].firstname + " " + tbbBatch3[indexPath.row].lastname
            lblDesc3.frame = CGRect(x: 0, y: 200, width: 190, height: 40)
            lblDesc3.text = fullname
            lblDesc3.textColor = UIColor.yellow
            lblDesc3.backgroundColor = .darkGray
            lblDesc3.font = UIFont(name: "Arial", size: 14)
            cell.contentView.addSubview(lblDesc3)
            return cell
            
        } else if (indexPath.section == 4) {
            
            let tbbPics4 = UIImageView()
            tbbPics4.frame = CGRect(x: 0.0, y: 0.0, width: 190, height: 200)
            let str11 = "http://127.0.0.1:9000/assets/tbb/"
            let str22 = str11.appending(self.tbbBatch4[indexPath.row].picture)
            let url = URL(string: str22)
            if let data = try? Data(contentsOf: url!) {
                tbbPics4.image = UIImage(data: data)
            }

            let tbbPics4Tapped = UITapGestureRecognizer(target: self, action: #selector(section4Btn(_:)))
            tbbPics4Tapped.tagName = self.tbbBatch4[indexPath.row].id
            tbbPics4.isUserInteractionEnabled = true
            tbbPics4.addGestureRecognizer(tbbPics4Tapped)

            cell.contentView.addSubview(tbbPics4)
            cell.backgroundColor = .black

            let lblDesc4 = UILabel()
            lblDesc4.frame = CGRect(x: 0, y: 200, width: 190, height: 40)
            let fullname = tbbBatch4[indexPath.row].firstname + " " + tbbBatch4[indexPath.row].lastname
            lblDesc4.text = fullname
            lblDesc4.textColor = UIColor.yellow
            lblDesc4.backgroundColor = .darkGray
            lblDesc4.font = UIFont(name: "Arial", size: 14)
            cell.contentView.addSubview(lblDesc4)
            return cell
            
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
//        let row = indexPath.row
//        print(row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if(section==0) {
            return CGSize.zero
        } else {
            return CGSize(width:collectionView.frame.size.width, height:80)
        }

    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

//        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerView", for: indexPath)

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)
            let lblHeader1 = UILabel()

            if (indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4) {
                headerView.isHidden = false
                lblHeader1.removeFromSuperview()
                lblHeader1.backgroundColor = UIColor.gray
                lblHeader1.textColor = .yellow
                lblHeader1.textAlignment = .left
                lblHeader1.isUserInteractionEnabled = true
                lblHeader1.font = UIFont(name: "arial", size: 22)
                lblHeader1.removeFromSuperview()
                lblHeader1.text = "TBB Batch \(indexPath.section)"
                lblHeader1.frame = CGRect(x: 10, y: 10, width: 300, height: 30)
                headerView.addSubview(lblHeader1)
                return headerView
            } else {
                lblHeader1.frame = CGRect.zero
                headerView.frame = CGRect.zero
                headerView.isHidden = true
                return headerView
            }

        
//        case UICollectionView.elementKindSectionFooter:

//            let lblFooter = UILabel(frame: CGRect(x: 40, y: 5, width: 380, height: 40))
//            lblFooter.text = "Copyright © Philippine Taekwondo Association"
//            lblFooter.text = ""
//            lblFooter.textColor = .yellow
//            lblFooter.textAlignment = .center
//            lblFooter.font = UIFont(name: "arial", size: 14)
//            lblFooter.clipsToBounds = true;
//            lblFooter.numberOfLines = 2
//            lblFooter.lineBreakMode = .byWordWrapping
//            lblFooter.sizeToFit()
//            footerView.addSubview(lblFooter)
//            return footerView

        default:
            assert(false, "Unexpected element kind")
        }
}
    
    @objc func section1Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbbDtlsVC") as! TbbDetailsViewController
        vc.tbbId = sender.tagName
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func section2Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbbDtlsVC") as! TbbDetailsViewController
        vc.tbbId = sender.tagName
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func section3Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbbDtlsVC") as! TbbDetailsViewController
        vc.tbbId = sender.tagName
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func section4Btn(_ sender: UITapGestureRecognizer) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbbDtlsVC") as! TbbDetailsViewController
        vc.tbbId = sender.tagName
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func barTapped(sender: UIBarButtonItem) {
         dismiss(animated: true, completion: nil)
     }

    
    func loadTbbBatch1(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbbbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Tbb1].self, from: data) {
                     DispatchQueue.main.async {
                        self.tbbBatch1 = decodedResponse
                        self.collectionView.reloadData()
                     }
                 }
             }
         }.resume()
    }

    func loadTbbBatch2(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbbbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Tbb2].self, from: data) {
                     DispatchQueue.main.async {
                        self.tbbBatch2 = decodedResponse
                        self.collectionView.reloadData()
                     }
                 }
             }
         }.resume()
    }

    func loadTbbBatch3(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbbbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Tbb3].self, from: data) {
                     DispatchQueue.main.async {
                        self.tbbBatch3 = decodedResponse
                        self.collectionView.reloadData()
                     }
                 }
             }
         }.resume()
    }

    func loadTbbBatch4(batchId: Int) {
        guard let url = URL(string: "http://127.0.0.1:9000/gettbbbatch/\(batchId)") else { return }
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Tbb4].self, from: data) {
                     DispatchQueue.main.async {
                        self.tbbBatch4 = decodedResponse
                        self.collectionView.reloadData()
                     }
                 }
             }
         }.resume()
    }

    
    
}
