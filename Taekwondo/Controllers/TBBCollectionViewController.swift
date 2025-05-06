//
//  TBBCollectionViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/5/25.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerReuseIdentifier = "headerView"

class TBBCollectionViewController: UICollectionViewController {
    private var tbbImages: [Tbb] = []
    private var hdrView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTBBdata()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        layout.itemSize = CGSize(width: (view.frame.size.width/3)+45,
                                 height: (view.frame.size.width/3)+150)

        layout.headerReferenceSize = CGSize(width: 300, height: 80);
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
                
        self.collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
        
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tbbImages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        let tbbPics = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200))

        let str1 = "http://127.0.0.1:9000/assets/victory/"
        let str2 = str1.appending(self.tbbImages[indexPath.row].pastorimage)
        let url = URL(string: str2)
        if let data = try? Data(contentsOf: url!) {
            tbbPics.image = UIImage(data: data)
        }
        cell.contentView.addSubview(tbbPics)
        cell.clipsToBounds = true
        cell.backgroundColor = .yellow
        cell.backgroundColor = .black

        let lblDesc = UILabel(frame: CGRect(x: 0, y: 220, width: 260, height: 40))
        lblDesc.text = tbbImages[indexPath.row].pastorname
        lblDesc.textColor = UIColor.black
        lblDesc.backgroundColor = .yellow
        lblDesc.font = UIFont(name: "Arial", size: 14)
        cell.contentView.addSubview(lblDesc)
        return cell
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath)
        let lbl = UILabel(frame: CGRect(x: 20, y: 5, width: 380, height: 40))
        lbl.text = "List of Taekwondo Blackbelt Brotherhood (TBB)"
        lbl.textColor = .yellow
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "arial", size: 22)
        lbl.clipsToBounds = true;
        lbl.numberOfLines = 2
        lbl.lineBreakMode = .byWordWrapping
        lbl.sizeToFit()
        headerView.addSubview(lbl)
        return headerView
}
    
    func loadTBBdata() {
        guard let url = URL(string: "http://127.0.0.1:9000/getvictorypastors") else { return }

         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Tbb].self, from: data) {
                     DispatchQueue.main.async {
                         self.tbbImages = decodedResponse
                        self.collectionView.reloadData()

                     }
                 }
             }
         }.resume()
    }

    
    
}

