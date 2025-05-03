//
//  NationalsTableViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/2/25.
//

import UIKit

class NationalsTableViewController: UITableViewController  {

    private var nationalsData: [Nationals] = []
    private let lblTitle = UILabel()
    private let headerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.clear
        self.loadNationalsdata()
//        self.tableView.register(UINib(nibName: "CustomHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: CustomHeader.reuseIdentifier)
        self.tableView.dataSource = self
        self.tableView.delegate = self

//        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nationalsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let str1 = "http://127.0.0.1:9000/assets/nationals/"
        let str2 = str1.appending(self.nationalsData[indexPath.row].competitionimage)
        let url = URL(string: str2)
        if let data = try? Data(contentsOf: url!) {
            cell.imageView?.image = UIImage(data: data)
        }
        cell.imageView?.translatesAutoresizingMaskIntoConstraints = false
        let marginguide = cell.contentView.layoutMarginsGuide
        cell.imageView?.topAnchor.constraint(equalTo: marginguide.topAnchor).isActive = true
        cell.imageView?.leadingAnchor.constraint(equalTo: marginguide.leadingAnchor).isActive = true
        cell.imageView?.heightAnchor.constraint(equalToConstant: 150).isActive = true
        cell.imageView?.widthAnchor.constraint(equalToConstant: 350).isActive = true
        cell.imageView?.contentMode = .scaleAspectFill

        let lblDesc = cell.viewWithTag(1) as? UILabel
        lblDesc?.text = nationalsData[indexPath.row].competitions
        lblDesc?.frame = CGRect(x: 20.0, y: 170.0, width: 300, height: 50)
        lblDesc?.textColor = UIColor.black

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50)
        headerView.backgroundColor = UIColor.clear
        lblTitle.frame = CGRect(x: 10, y: 0, width: 390, height: 50)
        lblTitle.text = "National Taekwondo Championships Gallery"
        lblTitle.textColor = UIColor.blue
        headerView.addSubview(lblTitle)
        return headerView
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
            //going up
            if scrollView.contentOffset.y > 40.0 {
                self.lblTitle.removeFromSuperview()
            }
            
        } else {
            
            if scrollView.contentOffset.y < 40.0 {
                self.headerView.addSubview(self.lblTitle)
            }
            
            //going down
        }
    }
    
    @objc func goBack() {
       print("goback...")
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadNationalsdata() {
        guard let url = URL(string: "http://127.0.0.1:9000/getnationals") else { return }

         URLSession.shared.dataTask(with: url) { data, response, error in
             if let data = data {
                 if let decodedResponse = try? JSONDecoder().decode([Nationals].self, from: data) {
                     DispatchQueue.main.async {
                         self.nationalsData = decodedResponse
                        self.tableView.reloadData()

                     }
                 }
             }
         }.resume()
    }

    
}
