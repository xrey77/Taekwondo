//
//  ViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//
import Foundation
import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    private let iosVersion = UIDevice.current.name
    
    private var menuView: UIView!
    private let menuData: NSArray = ["About Us","Contact Us","Location Map","Vision","Mission","Competitions","Year Plan","Training Schedules","Olympics", "Login","Register","Profile","Logout"]
    private let menuIcon: NSArray = ["questionmark.diamond","phone","mappin.circle","person","person","person","person","person","person","person","person","person","person"]
    private let bottomView = UIView()
    private let topView = UIView()
    private var bgView = UIView()
    private var isLogin = false
    private let loginDialog = UIView()
    private let Hstack = UIStackView()
    private var menuTable: UITableView!
    private var show = true
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
        print("IOS VERSION : \(iosVersion)")
        setupUI()
//        setGradientBackground()
        
        //IMPLEMENT SWIPE GESTURES
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedRight))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedLeft))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left

        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down

        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipedUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
    
        ///BODY
        let bodyIcon1 = UIImageView(frame: CGRect(x:1, y:70, width:380,height:200));
        bodyIcon1.image = UIImage(named: "tkd1.png")
        self.bodyView.addSubview(bodyIcon1)

        var bodyLabel1 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel1 = UILabel(frame: CGRect(x: 10, y: 280, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel1 = UILabel(frame: CGRect(x: 10, y: 280, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel1 = UILabel(frame: CGRect(x: 10, y: 280, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel1 = UILabel(frame: CGRect(x: 10, y: 280, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel1.numberOfLines = 0
        bodyLabel1.text = "Taekwondo's introduction to the Philippines in the 1970s and its subsequent growth and establishment are key aspects of its evolution. Wikipedia notes that Grandmaster Kim Bok Man and Young Man Park initially introduced the martial art in 1970, with Kim continuing Park's work after being invited by President Marcos. Grandmaster Hong Sung-chon later played a crucial role in promoting Taekwondo and establishing the Philippine Taekwondo Association (PTA) in 1975."
        bodyLabel1.textAlignment = .justified
        bodyLabel1.textColor = UIColor.white
        bodyLabel1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel1.sizeToFit()
        self.bodyView.addSubview(bodyLabel1)

        let boldAttribute1 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
        ]
        let boldText1 = NSAttributedString(string: "Key Stages in the Evolution:", attributes: boldAttribute1)
        let newString1 = NSMutableAttributedString()
        newString1.append(boldText1)
        var bodyLabel2 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel2 = UILabel(frame: CGRect(x: 10, y: 510, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel2 = UILabel(frame: CGRect(x: 10, y: 510, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel2 = UILabel(frame: CGRect(x: 10, y: 510, width: 350, height: 40))
        } else {
            bodyLabel2 = UILabel(frame: CGRect(x: 10, y: 510, width: 350, height: 40))
        }
        bodyLabel2.textColor = UIColor.white
        bodyLabel2.attributedText = newString1
        self.bodyView.addSubview(bodyLabel2)

        let boldAttribute2 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText2 = NSAttributedString(string: "Initial Introduction (1970s):", attributes: boldAttribute2)
        let newString2 = NSMutableAttributedString()
        newString2.append(boldText2)
        var bodyLabel3 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel3 = UILabel(frame: CGRect(x: 10, y: 540, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel3 = UILabel(frame: CGRect(x: 10, y: 540, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel3 = UILabel(frame: CGRect(x: 10, y: 540, width: 350, height: 40))
        } else {
            bodyLabel3 = UILabel(frame: CGRect(x: 10, y: 540, width: 350, height: 40))
        }
        bodyLabel3.textColor = UIColor.white
        bodyLabel3.attributedText = newString2
        self.bodyView.addSubview(bodyLabel3)

        var bodyLabel4 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel4 = UILabel(frame: CGRect(x: 10, y: 570, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel4 = UILabel(frame: CGRect(x: 10, y: 570, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel4 = UILabel(frame: CGRect(x: 10, y: 570, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel4 = UILabel(frame: CGRect(x: 10, y: 570, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel4.textColor = UIColor.white
        bodyLabel4.text = "Taekwondo was introduced by Kim Bok Man and Young Man Park, but its initial momentum slowed after Park's departure in 1971."
        bodyLabel4.numberOfLines = 0
        bodyLabel4.textAlignment = .justified
        bodyLabel4.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel4.sizeToFit()
        self.bodyView.addSubview(bodyLabel4)

        let boldAttribute3 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText3 = NSAttributedString(string: "Revival and Establishment (Mid-1970s):", attributes: boldAttribute3)
        let newString3 = NSMutableAttributedString()
        newString3.append(boldText3)
        var bodyLabel5 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel5 = UILabel(frame: CGRect(x: 10, y: 630, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel5 = UILabel(frame: CGRect(x: 10, y: 630, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel5 = UILabel(frame: CGRect(x: 10, y: 630, width: 350, height: 40))
        } else {
            bodyLabel5 = UILabel(frame: CGRect(x: 10, y: 630, width: 350, height: 40))
        }
        
        bodyLabel5.textColor = UIColor.white
        bodyLabel5.attributedText = newString3
        self.bodyView.addSubview(bodyLabel5)

        var bodyLabel6 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel6 = UILabel(frame: CGRect(x: 10, y: 660, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel6 = UILabel(frame: CGRect(x: 10, y: 660, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel6 = UILabel(frame: CGRect(x: 10, y: 660, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel6 = UILabel(frame: CGRect(x: 10, y: 660, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel6.textColor = UIColor.white
        bodyLabel6.text = "Grandmaster Hong Sung-chon's arrival in 1975 and subsequent establishment of the PTA marked a turning point, solidifying Taekwondo's presence in the Philippines."
        bodyLabel6.numberOfLines = 0
        bodyLabel6.textAlignment = .justified
        bodyLabel6.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel6.sizeToFit()
        self.bodyView.addSubview(bodyLabel6)

        let boldAttribute4 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText4 = NSAttributedString(string: "Growth and Popularity (1980s-Present):", attributes: boldAttribute4)
        let newString4 = NSMutableAttributedString()
        newString4.append(boldText4)
        var bodyLabel7 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel7 = UILabel(frame: CGRect(x: 10, y: 750, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel7 = UILabel(frame: CGRect(x: 10, y: 750, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel7 = UILabel(frame: CGRect(x: 10, y: 750, width: 350, height: 40))
        } else {
            bodyLabel7 = UILabel(frame: CGRect(x: 10, y: 750, width: 350, height: 40))
        }
        bodyLabel7.textColor = UIColor.white
        bodyLabel7.attributedText = newString4
        self.bodyView.addSubview(bodyLabel7)

        var bodyLabel8 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel8 = UILabel(frame: CGRect(x: 10, y: 780, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel8 = UILabel(frame: CGRect(x: 10, y: 780, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel8 = UILabel(frame: CGRect(x: 10, y: 780, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel8 = UILabel(frame: CGRect(x: 10, y: 780, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel8.textColor = UIColor.white
        bodyLabel8.text = "The PTA, under Hong's leadership, focused on organizing clinics, developing training materials, and holding competitions, leading to a significant increase in Taekwondo's popularity."
        bodyLabel8.numberOfLines = 0
        bodyLabel8.textAlignment = .justified
        bodyLabel8.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel8.sizeToFit()
        self.bodyView.addSubview(bodyLabel8)

        let boldAttribute5 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText5 = NSAttributedString(string: "Formal Structure and Certification (2010s):", attributes: boldAttribute5)
        let newString5 = NSMutableAttributedString()
        newString5.append(boldText5)
        var bodyLabel9 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel9 = UILabel(frame: CGRect(x: 10, y: 880, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel9 = UILabel(frame: CGRect(x: 10, y: 880, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel9 = UILabel(frame: CGRect(x: 10, y: 880, width: 350, height: 40))
        } else {
            bodyLabel9 = UILabel(frame: CGRect(x: 10, y: 880, width: 350, height: 40))
        }
        bodyLabel9.textColor = UIColor.white
        bodyLabel9.attributedText = newString4
        self.bodyView.addSubview(bodyLabel9)

        var bodyLabel10 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel10 = UILabel(frame: CGRect(x: 10, y: 910, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel10 = UILabel(frame: CGRect(x: 10, y: 910, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel10 = UILabel(frame: CGRect(x: 10, y: 910, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel10 = UILabel(frame: CGRect(x: 10, y: 910, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel10.textColor = UIColor.white
        bodyLabel10.text = "The establishment of the Philippine Taekwondo Foundation (PTF) in 2010 provided standardized education and certification for instructors, referees, and other key personnel, further professionalizing the sport."
        bodyLabel10.numberOfLines = 0
        bodyLabel10.textAlignment = .justified
        bodyLabel10.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel10.sizeToFit()
        self.bodyView.addSubview(bodyLabel10)

        let boldAttribute6 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText6 = NSAttributedString(string: "Current Status:", attributes: boldAttribute6)
        let newString6 = NSMutableAttributedString()
        newString6.append(boldText6)
        let bodyLabel11 = UILabel(frame: CGRect(x: 20, y: 1030, width: 350, height: 40))
        bodyLabel11.textColor = UIColor.white
        bodyLabel11.attributedText = newString4
        self.bodyView.addSubview(bodyLabel11)

        var bodyLabel12 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel12 = UILabel(frame: CGRect(x: 10, y: 1060, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel12 = UILabel(frame: CGRect(x: 10, y: 1060, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel12 = UILabel(frame: CGRect(x: 10, y: 1060, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel12 = UILabel(frame: CGRect(x: 10, y: 1060, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel12.textColor = UIColor.white
        bodyLabel12.text = "Taekwondo is now a widely recognized martial art in the Philippines, with a large number of practitioners and a strong network of regional committees, as highlighted by the Philippine Taekwondo Association."
        bodyLabel12.numberOfLines = 0
        bodyLabel12.textAlignment = .justified
        bodyLabel12.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel12.sizeToFit()
        self.bodyView.addSubview(bodyLabel12)

        let boldAttribute7 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 16.0)!
        ]
        let boldText7 = NSAttributedString(string: "Current Status:", attributes: boldAttribute7)
        let newString7 = NSMutableAttributedString()
        newString7.append(boldText7)
        let bodyLabel13 = UILabel(frame: CGRect(x: 20, y: 1160, width: 350, height: 40))
        
        bodyLabel13.textColor = UIColor.white
        bodyLabel13.attributedText = newString7
        self.bodyView.addSubview(bodyLabel13)

        var bodyLabel14 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel14 = UILabel(frame: CGRect(x: 10, y: 1190, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel14 = UILabel(frame: CGRect(x: 10, y: 1190, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel14 = UILabel(frame: CGRect(x: 10, y: 1190, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel14 = UILabel(frame: CGRect(x: 10, y: 1190, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel14.textColor = UIColor.white
        bodyLabel14.text = "Taekwondo was introduced to the Philippines through the efforts of Kim Bok Man and Young Man Park. Grand Master Kim Bok Man arrived in 1970 to continue Park's legacy of propagating Taekwondo upon the invitation of President Marcos. Kim continued to pioneer Taekwondo worldwide and left the Philippines in 1971."
        bodyLabel14.numberOfLines = 0
        bodyLabel14.textAlignment = .justified
        bodyLabel14.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel14.sizeToFit()
        self.bodyView.addSubview(bodyLabel14)

        let boldAttribute8 = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 19.0)!
        ]
        let boldText8 = NSAttributedString(string: "Key Figures:", attributes: boldAttribute8)
        let newString8 = NSMutableAttributedString()
        newString8.append(boldText8)
        var bodyLabel15 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel15 = UILabel(frame: CGRect(x: 10, y: 1350, width: 350, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel15 = UILabel(frame: CGRect(x: 10, y: 1350, width: 350, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel15 = UILabel(frame: CGRect(x: 10, y: 1350, width: 350, height: 40))
        } else {
            bodyLabel15 = UILabel(frame: CGRect(x: 10, y: 1350, width: 350, height: 40))
        }
        bodyLabel15.textColor = UIColor.white
        bodyLabel15.attributedText = newString8
        self.bodyView.addSubview(bodyLabel15)

        let firstPartInfo1 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 16.0)!
        ]
        let attributedString1 = NSMutableAttributedString(string: "♦ Grandmaster Kim Bok Man :", attributes: firstPartInfo1)

        // Second part with font size 20
        let secondPartInfo1 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 16.0)!
        ]
        attributedString1.append(NSAttributedString(string: " One of the pioneers who introduced Taekwondo to the Philippines in 1970.", attributes: secondPartInfo1))

        let bodyLabel16 = UILabel(frame: CGRect(x: 20, y: 1380, width: self.view.frame.size.width-50, height: 40))
        bodyLabel16.textColor = UIColor.white
        bodyLabel16.attributedText = attributedString1
        bodyLabel16.numberOfLines = 0
        bodyLabel16.textAlignment = .justified
        bodyLabel16.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel16.sizeToFit()
        self.bodyView.addSubview(bodyLabel16)

        
        let firstPartInfo2 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 16.0)!
        ]
        let attributedString2 = NSMutableAttributedString(string: "♦ Grandmaster Young Man Park :", attributes: firstPartInfo2)

        let secondPartInfo2 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 16.0)!
        ]
        attributedString2.append(NSAttributedString(string: " Another early pioneer who worked with Kim Bok Man to introduce Taekwondo.", attributes: secondPartInfo2))

        var bodyLabel17 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel17 = UILabel(frame: CGRect(x: 10, y: 1440, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel17 = UILabel(frame: CGRect(x: 10, y: 1440, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel17 = UILabel(frame: CGRect(x: 10, y: 1440, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel17 = UILabel(frame: CGRect(x: 10, y: 1440, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel17.textColor = UIColor.white
        bodyLabel17.attributedText = attributedString2
        bodyLabel17.numberOfLines = 0
        bodyLabel17.textAlignment = .justified
        bodyLabel17.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel17.sizeToFit()
        self.bodyView.addSubview(bodyLabel17)

        let firstPartInfo3 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica-Bold", size: 16.0)!
        ]
        let attributedString3 = NSMutableAttributedString(string: "♦ Grandmaster Hong Sung-Chon :", attributes: firstPartInfo3)

        let secondPartInfo3 = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 16.0)!
        ]
        attributedString3.append(NSAttributedString(string: " Considered the 'Father of Taekwondo' in the Philippines, he played a pivotal role in its growth and establishment.", attributes: secondPartInfo3))

        var bodyLabel18 = UILabel()
        if (iosVersion == "iPhone 8") {
            bodyLabel18 = UILabel(frame: CGRect(x: 10, y: 1500, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 11 Pro") {
            bodyLabel18 = UILabel(frame: CGRect(x: 10, y: 1500, width: self.view.frame.size.width-20, height: 40))
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bodyLabel18 = UILabel(frame: CGRect(x: 10, y: 1500, width: self.view.frame.size.width-20, height: 40))
        } else {
            bodyLabel18 = UILabel(frame: CGRect(x: 10, y: 1500, width: self.view.frame.size.width-20, height: 40))
        }
        bodyLabel18.textColor = UIColor.white
        bodyLabel18.attributedText = attributedString3
        bodyLabel18.numberOfLines = 0
        bodyLabel18.textAlignment = .justified
        bodyLabel18.lineBreakMode = NSLineBreakMode.byWordWrapping
        bodyLabel18.sizeToFit()
        self.bodyView.addSubview(bodyLabel18)
        
        ///BOTTOM BAR
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeDown)
        self.view.addGestureRecognizer(swipeUp)
        
        ///HORIZONTAL CUSTOM TOP BAR ICONS
        topBar()
        
        //HORIZONTAL CUSTOM BOTTOM BAR ICONS
        bottomView.backgroundColor = .systemGray6
        if (iosVersion == "iPhone 8") {
            bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
        } else if (iosVersion == "iPhone 11 Pro") {
            bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
        } else if (iosVersion == "iPhone 12 Pro Max") {
            bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
        } else {
            bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
        }
        navigationController?.view.addSubview(bottomView)

        var icon1 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon1 = UIImageView(frame: CGRect(x:20, y:10, width:30,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon1 = UIImageView(frame: CGRect(x:20, y:3, width:30,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon1 = UIImageView(frame: CGRect(x:20, y:3, width:30,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon1 = UIImageView(frame: CGRect(x:40, y:3, width:30,height:30));

        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon1 = UIImageView(frame: CGRect(x:40, y:3, width:30,height:30));
        } else {
            icon1 = UIImageView(frame: CGRect(x:20, y:3, width:30,height:30));
        }
        icon1.isUserInteractionEnabled = true
        icon1.image = UIImage(systemName: "gear")
        let icon1Tapped = UITapGestureRecognizer(target: self, action: #selector(settingsNavigation(_:)))
        icon1.addGestureRecognizer(icon1Tapped)
        bottomView.addSubview(icon1)

        let lbl1 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl1.frame = CGRect(x: 10, y: 30, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl1.frame = CGRect(x: 10, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl1.frame = CGRect(x: 10, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl1.frame = CGRect(x: 30, y: 20, width: 100, height: 40)

        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl1.frame = CGRect(x: 30, y: 20, width: 100, height: 40)
        } else {
            lbl1.frame = CGRect(x: 10, y: 20, width: 100, height: 40)
        }
        lbl1.textColor = UIColor.black
        lbl1.font = UIFont(name: "Arial", size: 14)
        lbl1.text = "Settings";
        bottomView.addSubview(lbl1)

        var icon2 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon2 = UIImageView(frame: CGRect(x:80, y:10, width:40,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon2 = UIImageView(frame: CGRect(x:90, y:3, width:40,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon2 = UIImageView(frame: CGRect(x:80, y:3, width:40,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon2 = UIImageView(frame: CGRect(x:105, y:3, width:45,height:30));

        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon2 = UIImageView(frame: CGRect(x:110, y:3, width:45,height:30));
        } else {
            icon2 = UIImageView(frame: CGRect(x:80, y:3, width:40,height:30));
        }
        icon2.isUserInteractionEnabled = true
        icon2.image = UIImage(systemName: "person.3.fill")
        let icon2Tapped = UITapGestureRecognizer(target: self, action: #selector(nationalsNavigation(_:)))
        icon2.addGestureRecognizer(icon2Tapped)
        bottomView.addSubview(icon2)
        
        let lbl2 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl2.frame = CGRect(x: 70, y: 31, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl2.frame = CGRect(x: 80, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl2.frame = CGRect(x: 70, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl2.frame = CGRect(x: 95, y: 20, width: 100, height: 40)

        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl2.frame = CGRect(x: 100, y: 20, width: 100, height: 40)
        } else {
            lbl2.frame = CGRect(x: 70, y: 20, width: 100, height: 40)
        }
        lbl2.textColor = UIColor.black
        lbl2.font = UIFont(name: "Arial", size: 14)
        lbl2.text = "Nationals";
        bottomView.addSubview(lbl2)

        var icon3 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon3 = UIImageView(frame: CGRect(x:140, y:10, width:35,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon3 = UIImageView(frame: CGRect(x:160, y:3, width:35,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon3 = UIImageView(frame: CGRect(x:140, y:3, width:35,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon3 = UIImageView(frame: CGRect(x:170, y:3, width:35,height:30));

        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon3 = UIImageView(frame: CGRect(x:180, y:3, width:35,height:30));
        } else {
            icon3 = UIImageView(frame: CGRect(x:140, y:3, width:35,height:30));
        }
        icon3.isUserInteractionEnabled = true
        icon3.image = UIImage(named: "tbb")
        let icon3Tapped = UITapGestureRecognizer(target: self, action: #selector(TBBNavigation(_:)))
        icon3.addGestureRecognizer(icon3Tapped)
        bottomView.addSubview(icon3)
        
        let lbl3 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl3.frame = CGRect(x: 140, y: 31, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl3.frame = CGRect(x: 160, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl3.frame = CGRect(x: 140, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl3.frame = CGRect(x: 170, y: 20, width: 100, height: 40)

        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl3.frame = CGRect(x: 180, y: 20, width: 100, height: 40)
        } else {
            lbl3.frame = CGRect(x: 140, y: 20, width: 100, height: 40)
        }
        lbl3.textColor = UIColor.black
        lbl3.font = UIFont(name: "Arial", size: 14)
        lbl3.text = "TBB";
        bottomView.addSubview(lbl3)

        var icon4 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon4 = UIImageView(frame: CGRect(x:190, y:10, width:35,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon4 = UIImageView(frame: CGRect(x:210, y:3, width:35,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon4 = UIImageView(frame: CGRect(x:190, y:3, width:35,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon4 = UIImageView(frame: CGRect(x:210, y:3, width:35,height:30));

        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon4 = UIImageView(frame: CGRect(x:220, y:3, width:35,height:30));
        } else {
            icon4 = UIImageView(frame: CGRect(x:190, y:3, width:35,height:30));
        }
        icon4.isUserInteractionEnabled = true
        icon4.image = UIImage(named: "tbs")
        let icon4Tapped = UITapGestureRecognizer(target: self, action: #selector(TBSNavigation(_:)))
        icon4.addGestureRecognizer(icon4Tapped)
        bottomView.addSubview(icon4)

        let lbl4 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl4.frame = CGRect(x: 190, y: 31, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl4.frame = CGRect(x: 210, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl4.frame = CGRect(x: 190, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl4.frame = CGRect(x: 210, y: 20, width: 100, height: 40)

        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl4.frame = CGRect(x: 220, y: 20, width: 100, height: 40)
        } else {
            lbl4.frame = CGRect(x: 190, y: 20, width: 100, height: 40)
        }
        lbl4.textColor = UIColor.black
        lbl4.font = UIFont(name: "Arial", size: 14)
        lbl4.text = "TBS";
        bottomView.addSubview(lbl4)
        
        var icon5 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon5 = UIImageView(frame: CGRect(x:240, y:10, width:40,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon5 = UIImageView(frame: CGRect(x:265, y:3, width:40,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon5 = UIImageView(frame: CGRect(x:240, y:3, width:40,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon5 = UIImageView(frame: CGRect(x:255, y:3, width:40,height:30));
        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon5 = UIImageView(frame: CGRect(x:270, y:3, width:40,height:30));
        } else {
            icon5 = UIImageView(frame: CGRect(x:240, y:3, width:40,height:30));
        }
        icon5.isUserInteractionEnabled = true
        icon5.image = UIImage(systemName: "rectangle.split.3x3.fill")
        let icon5Tapped = UITapGestureRecognizer(target: self, action: #selector(satelitesNavigation(_:)))
        icon5.addGestureRecognizer(icon5Tapped)
        bottomView.addSubview(icon5)
        
        let lbl5 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl5.frame = CGRect(x: 230, y: 31, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl5.frame = CGRect(x: 260, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl5.frame = CGRect(x: 230, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl5.frame = CGRect(x: 255, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl5.frame = CGRect(x: 270, y: 20, width: 100, height: 40)
        } else {
            lbl5.frame = CGRect(x: 230, y: 20, width: 100, height: 40)
        }
        lbl5.textColor = UIColor.black
        lbl5.font = UIFont(name: "Arial", size: 14)
        lbl5.text = "Satelites";
        bottomView.addSubview(lbl5)

        var icon6 = UIImageView()
        if (iosVersion == "iPhone 8") {
            icon6 = UIImageView(frame: CGRect(x:310, y:10, width:30,height:30));
        } else if (iosVersion == "iPhone 8 Plus") {
            icon6 = UIImageView(frame: CGRect(x:350, y:3, width:30,height:30));
        } else if (iosVersion == "iPhone 11 Pro") {
            icon6 = UIImageView(frame: CGRect(x:310, y:3, width:30,height:30));
        } else if (iosVersion == "iPhone 11 Pro Max") {
            icon6 = UIImageView(frame: CGRect(x:340, y:3, width:30,height:30));
        } else if (iosVersion == "iPhone 12 Pro Max") {
            icon6 = UIImageView(frame: CGRect(x:350, y:3, width:30,height:30));
        } else {
            icon6 = UIImageView(frame: CGRect(x:310, y:3, width:30,height:30));
        }
        icon6.isUserInteractionEnabled = true
        icon6.image = UIImage(systemName: "checkmark.seal")
        let icon6Tapped = UITapGestureRecognizer(target: self, action: #selector(promotionsNavigation(_:)))
        icon6.addGestureRecognizer(icon6Tapped)
        bottomView.addSubview(icon6)
        
        let lbl6 = UILabel()
        if (iosVersion == "iPhone 8") {
            lbl6.frame = CGRect(x: 290, y: 31, width: 100, height: 40)
        } else if (iosVersion == "iPhone 8 Plus") {
            lbl6.frame = CGRect(x: 330, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro") {
            lbl6.frame = CGRect(x: 290, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            lbl6.frame = CGRect(x: 320, y: 20, width: 100, height: 40)
        } else if (iosVersion == "iPhone 12 Pro Max") {
            lbl6.frame = CGRect(x: 330, y: 20, width: 100, height: 40)
        } else {
            lbl6.frame = CGRect(x: 290, y: 20, width: 100, height: 40)
        }
        lbl6.textColor = UIColor.black
        lbl6.font = UIFont(name: "Arial", size: 14)
        lbl6.text = "Promotions";
        bottomView.addSubview(lbl6)

        //DRAWER MENU
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "line.horizontal.3"),
//            style: .done,
//            target: self,
//            action: #selector(barTapped(_:))
//        )
        menuView = UIView(frame: CGRect(x: -250, y: 0, width: 250, height: self.view.frame.height))
        self.view.addSubview(menuView)
        self.view.bringSubviewToFront(menuView)
        menuTable = UITableView(frame: CGRect(x: 0, y: 0, width: 250, height: self.view.frame.height))
        menuTable.showsVerticalScrollIndicator = false
        menuTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        menuTable.delegate = self
        menuTable.dataSource = self
        menuTable.backgroundColor = .systemTeal
        menuTable.allowsSelection = true
    }
    
    private func setupUI() {
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
    

    override func viewDidAppear(_ animated: Bool) {
        self.showBars()
    }
    
    func showBars() {
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: +(self.topView.bounds.height))
            self.topView.transform = topBarmoveUp
            if (iosVersion == "iPhone 8") {
                topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
            } else {
                topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
            }


        }, completion: { [self](value: Bool) in

            //BOTTOM BAR ICON DOWNWARD
            let moveDown = CGAffineTransform(translationX: 0.0, y: -(self.bottomView.bounds.height))
            self.bottomView.transform = moveDown
            if (iosVersion == "iPhone 8") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            }
        })

    }
    
    func topBar() {
        
        if (iosVersion == "iPhone 8") {
            topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 60)
        } else if (iosVersion == "iPhone 11 Pro") {
            topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
        } else if (iosVersion == "iPhone 11 Pro Max") {
            topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
        } else if (iosVersion == "iPhone 12 Pro Max") {
            topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
        } else {
            topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
        }
        
        topView.backgroundColor = UIColor.systemGray6
        view.addSubview(topView)

        var TopIcon1 = UIImageView()
        if (iosVersion == "iPhone 8") {
            TopIcon1 = UIImageView(frame: CGRect(x:10, y:30, width:50,height:20));
        } else if (iosVersion == "iPhone 11 Pro") {
            TopIcon1 = UIImageView(frame: CGRect(x:10, y:40, width:50,height:20));
        } else if (iosVersion == "iPhone 12 Pro Max") {
            TopIcon1 = UIImageView(frame: CGRect(x:10, y:40, width:50,height:20));
        } else {
            TopIcon1 = UIImageView(frame: CGRect(x:10, y:40, width:50,height:20));
        }
        
        
        TopIcon1.isUserInteractionEnabled = true
        TopIcon1.image = UIImage(named: "pta.png")  ///line.horizontal.3"
        let topIcon1Tapped = UITapGestureRecognizer(target: self, action: #selector(barTapped(_:)))
        TopIcon1.addGestureRecognizer(topIcon1Tapped)
        topView.addSubview(TopIcon1)
        
//        let pta = UIImageView(frame: CGRect(x:120, y:20, width:90,height:35));
//        pta.image = UIImage(named: "pta.png")
//        topView.addSubview(pta)
//
//        let wt = UIImageView(frame: CGRect(x:220, y:20, width:60,height:40));
//        wt.image = UIImage(named: "wt.png")
//        topView.addSubview(wt)
//
//        let kukkiwon = UIImageView(frame: CGRect(x:290, y:20, width:60,height:40));
//        kukkiwon.image = UIImage(named: "kukkiwon.png")
//        topView.addSubview(kukkiwon)


    }
                    
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

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
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
        
        self.swipedLeft()
//        self.hideBars()

        let loginVC = LoginViewController()
        let navloginVC = UINavigationController(rootViewController: loginVC)
        navloginVC.modalPresentationStyle = .custom
        present(navloginVC, animated: true, completion: nil)
    }
    
        
    ///BOTTOM BAR ICONS
    @IBAction func settingsNavigation(_ sender: UITapGestureRecognizer) {
        print("Settings...")
    }

    @IBAction func nationalsNavigation(_ sender: UITapGestureRecognizer) {
        swipedDown()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "nationalsTVC") as! NationalsTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func TBBNavigation(_ sender: UITapGestureRecognizer) {
        hideBars()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbbCVC") as! TBBCollectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func TBSNavigation(_ sender: UITapGestureRecognizer) {
        hideBars()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tbsVC") as! TbsViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
                
//                UIView.animate(withDuration: 3, delay: 0, options: .curveEaseOut) {
//                    let moveright = CGAffineTransform(translationX: -(self.menuView.bounds.width), y: 0.0)
//                    self.menuView.transform = moveright
//
//                } completion: { _ in
//
//                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
//                        let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: -(self.topView.bounds.origin.y))
//                        self.topView.transform = topBarmoveUp
//                        self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
//                    }
//                }
                
                
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

    func hideBars() {
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: -(topView.bounds.origin.y))
            topView.transform = topBarmoveUp

            if (iosVersion == "iPhone 8") {
                topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else {
                topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            }

            
        }, completion: { [self](value: Bool) in

            let moveDown = CGAffineTransform(translationX: 0.0, y: +(self.bottomView.bounds.height))
            self.bottomView.transform = moveDown
            if (iosVersion == "iPhone 8") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 80)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 80)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 80)
            }

        })
    }
    
    //SWIPE GESTURES
    @objc func swipedRight()
    {
        setupMenuview()
        
        ///TOP BAR ICONS
        UIView.animate(withDuration: 0.45, animations: { [self] in

            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: -(self.topView.bounds.origin.y))
            self.topView.transform = topBarmoveUp
            if (iosVersion == "iPhone 8") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 11 Pro Max") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            }
            
        }, completion: { [self](value: Bool) in

            let moveDown = CGAffineTransform(translationX: 0.0, y: +(self.bottomView.bounds.origin.y))
            self.bottomView.transform = moveDown
            if (iosVersion == "iPhone 8") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 80)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 80)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            }

        })

    }

    @objc func swipedLeft()
    {
        
        UIView.animate(withDuration: 0.35, animations: { [self] in
            //SWIPE LEFT
            let moveright = CGAffineTransform(translationX: -(menuView.bounds.width), y: 0.0)
             menuView.transform = moveright

        }, completion: { [self](value: Bool) in
            //TOP BAR ICON UPWARD
            self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: +(self.topView.bounds.origin.y))
            self.topView.transform = topBarmoveUp
            if (iosVersion == "iPhone 8") {
                self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 8 Plus") {
                topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
            } else if (iosVersion == "iPhone 11 Pro") {
                topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
            } else if (iosVersion == "iPhone 11 Pro Max") {
                topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                topView.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.size.width, height: 70)
            } else {
                self.topView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 70)
            }

            //BOTTOM BAR ICON DOWNWARD
            let moveDown = CGAffineTransform(translationX: 0.0, y: -(self.bottomView.bounds.origin.y))
            self.bottomView.transform = moveDown
            if (iosVersion == "iPhone 8") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-60, width: self.view.frame.size.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-60, width: self.view.frame.size.width, height: 80)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-60, width: self.view.frame.size.width, height: 80)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height-60, width: self.view.frame.size.width, height: 60)
            }
        })
    }
    
/**
     //            bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 80)
     if (iosVersion == "iPhone 8") {
     } else if (iosVersion == "iPhone 11 Pro") {
     }

     
     */
    
    @objc func swipedDown()
    {
        
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: -(self.topView.bounds.origin.y))
            self.topView.transform = topBarmoveUp
            if (iosVersion == "iPhone 8") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            }


        }, completion: {(value: Bool) in
            let bottomMoveDown = CGAffineTransform(translationX: 0.0, y: +(self.bottomView.bounds.origin.y))
            self.bottomView.transform = bottomMoveDown
            if (self.iosVersion == "iPhone 8") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            } else if (self.iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            } else if (self.iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 60, width: self.view.frame.size.width, height: 60)
            }
        })
                
    }

    @objc func swipedUp()
    {
        UIView.animate(withDuration: 0.35, animations: { [self] in

            let topBarmoveUp = CGAffineTransform(translationX: 0.0, y: -(self.topView.bounds.origin.y))
            self.topView.transform = topBarmoveUp
            if (iosVersion == "iPhone 8") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            } else if (iosVersion == "iPhone 11 Pro") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 70)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            } else {
                self.topView.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: 60)
            }


        }, completion: { [self](value: Bool) in

            let moveDown = CGAffineTransform(translationX: 0.0, y: +(self.bottomView.bounds.size.height))
            self.bottomView.transform = moveDown
            if (iosVersion == "iPhone 8") {
            } else if (iosVersion == "iPhone 11 Pro") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            } else if (iosVersion == "iPhone 12 Pro Max") {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            } else {
                self.bottomView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: self.view.frame.size.width, height: 60)
            }

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

        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
           DispatchQueue.main.async {
                UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
                self.menuTable.reloadData()

           }
        }

    }
    
}

