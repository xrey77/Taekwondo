//
//  ViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//
import Foundation
import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    private var menuView: UIView!
    private let menuData: NSArray = ["About Us","Contact Us","Location Map","Vision","Mission","Competitions","Year Plan","Training Schedules","Olympics", "Login","Register","Profile","Logout"]
    private let menuIcon: NSArray = ["questionmark.diamond","phone","mappin.circle","person","person","person","person","person","person","person","person","person","person"]
//    private let stackView = UIStackView()
    private let bottomView = UIView()
    private var bgView = UIView()
    private var isLogin = false
    private let loginDialog = UIView()
    private let Hstack = UIStackView()
    private var menuTable: UITableView!
    private var show = true
    private var scrollView = UIScrollView()
    
    
    
//    fileprivate let stackView: UIStackView = {
//        let stack = UIStackView()
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.distribution = .fillEqually
//        stack.axis = .horizontal
//        stack.spacing = 10
//        return stack
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        
        //IMPLEMENT SWIPE GESTURES
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedRight))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeUp)
        
        //HORIZONTAL BOTTOM BAR ICONS
        bottomView.backgroundColor = .systemGray6
        bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
        navigationController?.view.addSubview(bottomView)

        let icon1 = UIImageView(frame: CGRect(x:20, y:10, width:30,height:30));
        icon1.isUserInteractionEnabled = true
        icon1.image = UIImage(systemName: "gear")
        let icon1Tapped = UITapGestureRecognizer(target: self, action: #selector(settingsNavigation(_:)))
        icon1.addGestureRecognizer(icon1Tapped)
        bottomView.addSubview(icon1)
        let lbl1 = UILabel()
        lbl1.frame = CGRect(x: 10, y: 30, width: 100, height: 40)
        lbl1.textColor = UIColor.black
        lbl1.font = UIFont(name: "Arial", size: 14)
        lbl1.text = "Settings";
        bottomView.addSubview(lbl1)

        let icon2 = UIImageView(frame: CGRect(x:80, y:10, width:40,height:30));
        icon2.isUserInteractionEnabled = true
        icon2.image = UIImage(systemName: "person.3.fill")
        let icon2Tapped = UITapGestureRecognizer(target: self, action: #selector(nationalsNavigation(_:)))
        icon2.addGestureRecognizer(icon2Tapped)
        bottomView.addSubview(icon2)
        let lbl2 = UILabel()
        lbl2.frame = CGRect(x: 70, y: 31, width: 100, height: 40)
        lbl2.textColor = UIColor.black
        lbl2.font = UIFont(name: "Arial", size: 14)
        lbl2.text = "Nationals";
        bottomView.addSubview(lbl2)

        let icon3 = UIImageView(frame: CGRect(x:140, y:10, width:35,height:30));
        icon3.isUserInteractionEnabled = true
        icon3.image = UIImage(named: "tbb")
        let icon3Tapped = UITapGestureRecognizer(target: self, action: #selector(TBBNavigation(_:)))
        icon3.addGestureRecognizer(icon3Tapped)
        bottomView.addSubview(icon3)
        let lbl3 = UILabel()
        lbl3.frame = CGRect(x: 140, y: 31, width: 100, height: 40)
        lbl3.textColor = UIColor.black
        lbl3.font = UIFont(name: "Arial", size: 14)
        lbl3.text = "TBB";
        bottomView.addSubview(lbl3)

        let icon4 = UIImageView(frame: CGRect(x:190, y:10, width:35,height:30));
        icon4.isUserInteractionEnabled = true
        icon4.image = UIImage(named: "tbs")
        let icon4Tapped = UITapGestureRecognizer(target: self, action: #selector(TBSNavigation(_:)))
        icon4.addGestureRecognizer(icon4Tapped)
        bottomView.addSubview(icon4)
        let lbl4 = UILabel()
        lbl4.frame = CGRect(x: 190, y: 31, width: 100, height: 40)
        lbl4.textColor = UIColor.black
        lbl4.font = UIFont(name: "Arial", size: 14)
        lbl4.text = "TBS";
        bottomView.addSubview(lbl4)
        
        let icon5 = UIImageView(frame: CGRect(x:240, y:10, width:40,height:30));
        icon5.isUserInteractionEnabled = true
        icon5.image = UIImage(systemName: "rectangle.split.3x3.fill")
        let icon5Tapped = UITapGestureRecognizer(target: self, action: #selector(satelitesNavigation(_:)))
        icon5.addGestureRecognizer(icon5Tapped)
        bottomView.addSubview(icon5)
        let lbl5 = UILabel()
        lbl5.frame = CGRect(x: 230, y: 31, width: 100, height: 40)
        lbl5.textColor = UIColor.black
        lbl5.font = UIFont(name: "Arial", size: 14)
        lbl5.text = "Satelites";
        bottomView.addSubview(lbl5)

        let icon6 = UIImageView(frame: CGRect(x:310, y:10, width:30,height:30));
        icon6.isUserInteractionEnabled = true
        icon6.image = UIImage(systemName: "checkmark.seal")
        let icon6Tapped = UITapGestureRecognizer(target: self, action: #selector(promotionsNavigation(_:)))
        icon6.addGestureRecognizer(icon6Tapped)
        bottomView.addSubview(icon6)
        let lbl6 = UILabel()
        lbl6.frame = CGRect(x: 290, y: 31, width: 100, height: 40)
        lbl6.textColor = UIColor.black
        lbl6.font = UIFont(name: "Arial", size: 14)
        lbl6.text = "Promotions";
        bottomView.addSubview(lbl6)

        //DRAWER MENU
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.horizontal.3"),
            style: .done,
            target: self,
            action: #selector(barTapped(_:))
        )
        menuView = UIView(frame: CGRect(x: -250, y: 10, width: 250, height: self.view.frame.height))
        self.view.addSubview(menuView)
        self.view.bringSubviewToFront(menuView)
        menuTable = UITableView(frame: CGRect(x: 0, y: 0, width: 250, height: self.view.frame.height))
        menuTable.showsVerticalScrollIndicator = false
        menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuTable.delegate = self
        menuTable.dataSource = self
        menuTable.backgroundColor = .systemTeal
        menuTable.allowsSelection = true
        
        
        
//        Hstack.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
//        Hstack.axis = NSLayoutConstraint.Axis.horizontal
//        Hstack.distribution  = UIStackView.Distribution.equalSpacing
//        Hstack.alignment = UIStackView.Alignment.center
//        Hstack.backgroundColor = UIColor.orange
//        Hstack.distribution = .equalSpacing
//        Hstack.translatesAutoresizingMaskIntoConstraints = true
        
//        self.view.addSubview(stackView)
//        scrollView.addSubview(stackView)


//        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        stackView.widthAnchor.constraint(equalToConstant: stackView.frame.width).isActive = false
//        stackView.centerXAnchor.constraint(equalTo: self.stackView.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.stackView.centerYAnchor).isActive = false
        
//        let img1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        let img1 = UIImageView()
//        img1.image = UIImage(named: "tikd1")
//        img1.contentMode = .scaleAspectFill
//        img1.clipsToBounds = true
//
////        let img2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        let img2 = UIImageView()
//        img2.image = UIImage(named: "tikd1")
//        img2.contentMode = .scaleAspectFill
//        img2.clipsToBounds = true
//
////        let img3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
//        let img3 = UIImageView()
//        img3.image = UIImage(named: "tikd1")
//        img3.contentMode = .scaleAspectFill
//        img3.clipsToBounds = true
//
////        let img4 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img4 = UIImageView()
//        img4.image = UIImage(named: "tikd1")
//        img4.contentMode = . scaleAspectFill
//        img4.clipsToBounds = true
//
////        let img5 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img5 = UIImageView()
//        img5.image = UIImage(named: "tikd1")
//        img5.contentMode = .scaleAspectFill
//        img5.clipsToBounds = true
//
////        let img6 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img6 = UIImageView()
//        img6.image = UIImage(named: "tikd1")
//        img6.contentMode = .scaleAspectFill
//        img6.clipsToBounds = true
//
////        let img7 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img7 = UIImageView()
//        img7.image = UIImage(named: "tikd1")
//        img7.contentMode = .scaleAspectFill
//        img7.clipsToBounds = true
//
////        let img8 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img8 = UIImageView()
//        img8.image = UIImage(named: "tikd1")
//        img8.contentMode = .scaleAspectFill
//        img8.clipsToBounds = true
//
////        let img9 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img9 = UIImageView()
//        img9.image = UIImage(named: "tikd1")
//        img9.contentMode = .scaleAspectFill
//        img9.clipsToBounds = true
//
////        let img10 = UIImageView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
//        let img10 = UIImageView()
//        img10.image = UIImage(named: "tikd1")
//        img10.contentMode = .scaleAspectFill
//        img10.clipsToBounds = true
//
//
//
//        scrollView = UIScrollView()
//        scrollView.delegate = self
//        scrollView.contentSize = CGSize(width: 2400, height: 300)
//        scrollView.addSubview(img1)
//        scrollView.addSubview(img2)
//        scrollView.addSubview(img3)
//        scrollView.addSubview(img4)
//        scrollView.addSubview(img5)
//        scrollView.addSubview(img6)
//        scrollView.addSubview(img7)
//        scrollView.addSubview(img8)
//        scrollView.addSubview(img9)
//        scrollView.addSubview(img10)
//        view.addSubview(scrollView)
//
//        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true


    }
    
//    override func viewDidLayoutSubviews() {
//          super.viewDidLayoutSubviews()
//          scrollView.frame = view.bounds
//      }

//    @objc func tabBar(tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//
//        if viewController == tabBarController.viewControllers?[0] {
//            print("not ok")
//            return false
//        } else {
//            print("ok")
//            return true
//        }
//    }
    
            
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.backgroundColor = .systemTeal
        cell.textLabel?.textColor = .black
        switch indexPath.row {
        case 0:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.red
            cell.textLabel!.text = "\(menuData[0])"
        case 1:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.purple
            cell.textLabel!.text = "\(menuData[1])"
        case 2:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[2])"
        case 3:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[3])"
        case 4:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[4])"
        case 5:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[5])"
        case 6:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[6])"
        case 7:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[7])"
        case 8:
            cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
            cell.imageView?.tintColor = UIColor.yellow
            cell.textLabel!.text = "\(menuData[8])"
        case 9:
            if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true {
                cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
                cell.imageView?.tintColor = UIColor.yellow
                cell.textLabel!.text = "\(menuData[11])"
            } else {
                cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
                cell.imageView?.tintColor = UIColor.yellow
                cell.textLabel!.text = "\(menuData[9])"
            }
        case 10:
            if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true {
                cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
                cell.imageView?.tintColor = UIColor.yellow
                cell.textLabel!.text = "\(menuData[12])"
            } else {
                cell.imageView?.image =  UIImage(systemName: menuIcon[indexPath.row] as! String)
                cell.imageView?.tintColor = UIColor.yellow
                cell.textLabel!.text = "\(menuData[10])"
            }
        default:
            break
        }
///        cell.textLabel!.text = "\(menuData[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            navigatetoAboutus()
        case 1:
            navigatetoContactus()
        case 2:
            navigatetoLocationmap()
        case 3:
            navigatetoVision()
        case 4:
            navigatetoMission()
        case 5:
            navigatetoCompetitions()
        case 6:
            navigatetoYearplan()
        case 7:
            navigatetoTrainingSchedules()
        case 8:
            navigatetoOlympics()
        case 9:
            if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true {
                navigatetoProfile()
            } else {
                navigatetoLogin()
            }
        case 10:
            if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == true {
                navigatetoLogout()
            } else {
                navigatetoRegistration()
            }
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lblUsername = UILabel()
        let userDefaults = UserDefaults.standard
        let strUserpic = userDefaults.string(forKey: "USERPIC")

        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .systemGray
        var hdrIcon = UIImageView(frame: CGRect(x:20, y:8, width:190,height:80));
        if (strUserpic == nil) {
            hdrIcon.image = UIImage(named: "pta")
        } else {
            hdrIcon = UIImageView(frame: CGRect(x:60, y:8, width:100,height:100));
            hdrIcon.image = UIImage(data: Data(base64Encoded: strUserpic!)!)
            hdrIcon.layer.cornerRadius = 50.00
            hdrIcon.clipsToBounds = true

        }
        hdrIcon.tintColor = .white
        headerView.addSubview(hdrIcon)
        
        
        let strUsername = userDefaults.string(forKey: "USERNAME")
        if (strUsername == nil) {
            lblUsername.frame = CGRect.init(x: 30, y: 90, width: headerView.frame.width-25, height: headerView.frame.height-10)
            lblUsername.text = "Philippine Taekwondo Association"
            lblUsername.numberOfLines = 2
            lblUsername.lineBreakMode = .byWordWrapping
            lblUsername.textAlignment = .center
            lblUsername.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lblUsername.textColor = .white
            lblUsername.sizeToFit()
            lblUsername.textAlignment = .center
        } else {
            lblUsername.frame = CGRect.init(x: 0, y: 100, width: headerView.frame.width, height: 40)
            lblUsername.text = strUsername
            lblUsername.textColor = .white
            lblUsername.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            lblUsername.textAlignment = .center
        }
        headerView.addSubview(lblUsername)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }

        
//    static prefix - (ObjCBool)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//    {
//      if ([touch.view isDescendantOfView:autocompleteTableView]) {
//
//        // Don't let selections of auto-complete entries fire the
//        // gesture recognizer
//        return NO;
//      }
//
//      return YES;
//    }

    
    
    
    @objc func navigatetoAboutus() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "aboutusVC") as! AboutusViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigatetoContactus() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "contactusVC") as! ContactusViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navigatetoVision() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "visionVC") as! VisionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navigatetoMission() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "missionVC") as! MissionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navigatetoLocationmap() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "locationmapVC") as! LocationmapViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navigatetoCompetitions() {


    }

    @objc func navigatetoYearplan() {
        
    }
    @objc func navigatetoTrainingSchedules() {
        
    }
    @objc func navigatetoOlympics() {
        
    }
    
    @objc func navigatetoProfile() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "profileVC") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigatetoLogout() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
            UserDefaults.standard.set(nil, forKey: "USERID")
            UserDefaults.standard.set(nil, forKey: "USERNAME")
            UserDefaults.standard.set(nil, forKey: "TOKEN")
            UserDefaults.standard.set(nil, forKey: "USERPIC")
            self.swipedLeft()
            self.menuTable.reloadData()
        }
    }



    @objc func navigatetoRegistration() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "registerVC") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navigatetoLogin() {
        
        swipedDown()
        swipedLeft()

        let loginVC = LoginViewController()
        let navloginVC = UINavigationController(rootViewController: loginVC)
        navloginVC.modalPresentationStyle = .custom
        present(navloginVC, animated: true, completion: nil)
        if UserDefaults.standard.bool(forKey: "IsUserLoggedIn") == false {
            print("done....")
        }
//        UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
//        self.menuTable.reloadData()

    }
    
        
    ///BOTTOM BAR ICONS
    @IBAction func settingsNavigation(_ sender: UITapGestureRecognizer) {
        print("Settings...")
    }

    @IBAction func nationalsNavigation(_ sender: UITapGestureRecognizer) {
        print("Nationals...")
    }

    @IBAction func TBBNavigation(_ sender: UITapGestureRecognizer) {
        print("TBB...")
    }

    @IBAction func TBSNavigation(_ sender: UITapGestureRecognizer) {
        print("TBS...")
    }
    
    @IBAction func satelitesNavigation(_ sender: UITapGestureRecognizer) {
        print("Satelites...")
    }

    @IBAction func promotionsNavigation(_ sender: UITapGestureRecognizer) {
        print("Promotions...")
    }
    

    @objc func barTapped(_ sender: UIBarButtonItem) {
            if (show) {
                self.menuTable.reloadData()
                setupMenuview()
                self.bottomView.isHidden = true

                show = false
            } else {
                show = true
                self.bottomView.isHidden = false

                UIView.animate(withDuration: 0.35, animations: { [self] in
                   let moveright = CGAffineTransform(translationX: -(menuView.bounds.width), y: 0.0)
                    menuView.transform = moveright
                })
            }
    }
    
    func setGradientBackground() {
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
         self.bgView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
         let gradientLayer:CAGradientLayer = CAGradientLayer()
         gradientLayer.frame.size = self.view.frame.size
         gradientLayer.colors = [UIColor.purple.cgColor,UIColor.systemTeal.withAlphaComponent(1).cgColor]
        self.bgView.layer.addSublayer(gradientLayer)
        self.view.addSubview(self.bgView)
    }
        
    @objc func setupMenuview() {
        menuView.addSubview(menuTable)

        UIView.animate(withDuration: 0.35, animations: { [self] in

           let moveright = CGAffineTransform(translationX: +(menuView.bounds.width), y: 0.0)
            menuView.transform = moveright


        })
        
        
    }
    
    //SWIPE GESTURES
    @objc func swipedRight()
    {
        self.bottomView.isHidden = true
        setupMenuview()
    }

    @objc func swipedLeft()
    {
        self.bottomView.isHidden = false
        UIView.animate(withDuration: 0.35, animations: { [self] in

           let moveright = CGAffineTransform(translationX: -(menuView.bounds.width), y: 0.0)
            menuView.transform = moveright
        })
    }
    
    @objc func swipedDown()
    {
        self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
        UIView.animate(withDuration: 0.35, animations: { [self] in

            let moveDown = CGAffineTransform(translationX: 0.0, y: +(bottomView.bounds.height))
            bottomView.transform = moveDown
        })

    }

    @objc func swipedUp()
    {
        UIView.animate(withDuration: 0.35, animations: { [self] in

            let moveDown = CGAffineTransform(translationX: 0.0, y: -(bottomView.bounds.height))
            bottomView.transform = moveDown
            self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
        })
    }

    @IBAction func loginIconCloseNavigation(_ sender: UITapGestureRecognizer) {
        
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let moveUp = CGAffineTransform(translationX: 0.0, y: -(self.loginDialog.bounds.height))
            self.loginDialog.transform = moveUp
        })
        
        self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.horizontal.3"),
            style: .done,
            target: self,
            action: #selector(barTapped(_:)))

//        self.menuTable.reloadData()

        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
           DispatchQueue.main.async {
                UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
                self.menuTable.reloadData()

           }
        }

    }
    
}

class SettingsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

class InstructorsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

class TBBController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}

class TBSController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class NationalTeamController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
    }
}

