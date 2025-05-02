//
//  RegisterViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/27/25.
//

import UIKit

class RegisterViewController: UIViewController {

    private var bgView = UIView()
    private let txtFirstname = UITextField()
    private let txtLastname = UITextField()
    private let txtEmail = UITextField()
    private let txtMobile = UITextField()
    private let txtUsername = UITextField()
    private let txtPassword = UITextField()
    private let txtConfirmPassword = UITextField()
    private let alertView = UIView()
    private let alertMessage = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        let lblTitle = UILabel(frame: CGRect(x: 35, y: 60, width: 300, height: 50))
        lblTitle.text = "User Registration"
        lblTitle.font = UIFont(name: "arial", size: 24)
        lblTitle.textColor = UIColor.white
        self.view.addSubview(lblTitle)

        let lblsubTitle = UILabel(frame: CGRect(x: 35, y: 85, width: 300, height: 50))
        lblsubTitle.text = "Already have an account?"
        lblsubTitle.font = UIFont(name: "arial", size: 18)
        lblsubTitle.textColor = UIColor.white
        self.view.addSubview(lblsubTitle)

        ///SIGNIN BUTTON LINK ATTRIBUTES
        let signinAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.underlineStyle: 1,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19),
        NSAttributedString.Key.foregroundColor: UIColor.systemBlue
        ]
        ///SIGN-IN BUTTON LINK
        let attributedString = NSMutableAttributedString(string: "Sign-in", attributes: signinAttributes)
        let btnSignin = UIButton(frame: CGRect(x: 230, y: 85, width: 100, height: 50))
        btnSignin.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        btnSignin.addTarget(self, action: #selector(signinNow(_:)), for: .touchUpInside)
        self.view.addSubview(btnSignin)
        
        txtFirstname.frame = CGRect(x: 35, y: 160, width: 300, height: 40)
        txtFirstname.backgroundColor = UIColor.white
        txtFirstname.placeholder = " enter your First Name"
        txtFirstname.layer.cornerRadius = 10.0
        txtFirstname.layer.borderWidth = 1
        txtFirstname.textAlignment = NSTextAlignment.left
        txtFirstname.layer.borderColor = UIColor.systemGray.cgColor
        txtFirstname.autocapitalizationType = .none
        let spacerView1 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtFirstname.leftViewMode = UITextField.ViewMode.always
        txtFirstname.leftView = spacerView1
        self.view.addSubview(txtFirstname)
        
        txtLastname.frame = CGRect(x: 35, y: 210, width: 300, height: 40)
        txtLastname.backgroundColor = UIColor.white
        txtLastname.placeholder = " enter your Last Name"
        txtLastname.layer.cornerRadius = 10.0
        txtLastname.layer.borderWidth = 1
        txtLastname.autocapitalizationType = .none
        txtLastname.layer.borderColor = UIColor.systemGray.cgColor

        let spacerView2 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtLastname.leftViewMode = UITextField.ViewMode.always
        txtLastname.leftView = spacerView2

        self.view.addSubview(txtLastname)

        txtEmail.frame = CGRect(x: 35, y: 260, width: 300, height: 40)
        txtEmail.backgroundColor = UIColor.white
        txtEmail.placeholder = " enter your Email Address"
        txtEmail.layer.cornerRadius = 10.0
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor.systemGray.cgColor
        txtEmail.autocapitalizationType = .none

        let spacerView3 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtEmail.leftViewMode = UITextField.ViewMode.always
        txtEmail.leftView = spacerView3

        self.view.addSubview(txtEmail)

        txtMobile.frame = CGRect(x: 35, y: 310, width: 300, height: 40)
        txtMobile.backgroundColor = UIColor.white
        txtMobile.placeholder = " enter your Mobile No."
        txtMobile.layer.cornerRadius = 10.0
        txtMobile.layer.borderWidth = 1
        txtMobile.layer.borderColor = UIColor.systemGray.cgColor
        txtMobile.autocapitalizationType = .none

        let spacerView4 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtMobile.leftViewMode = UITextField.ViewMode.always
        txtMobile.leftView = spacerView4

        self.view.addSubview(txtMobile)

        txtUsername.frame = CGRect(x: 35, y: 360, width: 300, height: 40)
        txtUsername.backgroundColor = UIColor.white
        txtUsername.placeholder = " enter your Username"
        txtUsername.layer.cornerRadius = 10.0
        txtUsername.layer.borderWidth = 1
        txtUsername.layer.borderColor = UIColor.systemGray.cgColor
        txtUsername.autocapitalizationType = .none

        let spacerView5 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtUsername.leftViewMode = UITextField.ViewMode.always
        txtUsername.leftView = spacerView5

        self.view.addSubview(txtUsername)

        txtPassword.frame = CGRect(x: 35, y: 410, width: 300, height: 40)
        txtPassword.backgroundColor = UIColor.white
        txtPassword.placeholder = " enter your Password"
        txtPassword.layer.cornerRadius = 10.0
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.systemGray.cgColor
        txtPassword.autocapitalizationType = .none
        txtPassword.isSecureTextEntry = true
        let spacerView6 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtPassword.leftViewMode = UITextField.ViewMode.always
        txtPassword.leftView = spacerView6

        self.view.addSubview(txtPassword)

        txtConfirmPassword.frame = CGRect(x: 35, y: 460, width: 300, height: 40)
        txtConfirmPassword.backgroundColor = UIColor.white
        txtConfirmPassword.placeholder = " enter your Confirm Password"
        txtConfirmPassword.layer.cornerRadius = 10.0
        txtConfirmPassword.layer.borderWidth = 1
        txtConfirmPassword.layer.borderColor = UIColor.systemGray.cgColor
        txtConfirmPassword.autocapitalizationType = .none
        txtPassword.isSecureTextEntry = true
        let spacerView7 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtConfirmPassword.leftViewMode = UITextField.ViewMode.always
        txtConfirmPassword.leftView = spacerView7
        self.view.addSubview(txtConfirmPassword)
        
        ///SAVE BUTTON ICON
        let signinIcon = UIImageView.init(frame: CGRect.init(x: 50, y: 8, width: 30, height: 30))
        signinIcon.image = UIImage.init(systemName: "hand.draw")
        signinIcon.tintColor = .white

        ///SAVE BUTTON
        let btnSave = UIButton(frame: CGRect(x: 40, y: 510, width: 300, height: 40))
        btnSave.setTitle("Create Account", for: .normal)
        btnSave.layer.cornerRadius = 10
        btnSave.backgroundColor = UIColor.orange
        btnSave.setTitleColor(.white, for: .normal)
        btnSave.titleLabel?.font = UIFont(name: "arial", size: 19)
        btnSave.addTarget(self, action: #selector(registerNow(_:)), for: .touchUpInside)
        self.view.addSubview(btnSave)
        btnSave.addSubview(signinIcon)
    }
    
    @objc func alertMessage(msg: String) {
        alertMessage.text = ""
        alertView.frame = CGRect(x: 40, y: 800, width: 300, height: 200)
        alertView.backgroundColor = UIColor.systemRed
        alertView.layer.cornerRadius = 10
        self.view.addSubview(alertView)

        let alertSubview = UIView(frame: CGRect(x: 0, y: 1, width: 300, height: 40))
        alertSubview.backgroundColor = UIColor.black
        alertSubview.clipsToBounds = true;
        alertSubview.layer.cornerRadius = 10
        alertSubview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        alertView.addSubview(alertSubview)

        let alertTitle = UILabel(frame: CGRect(x: 0, y: 7, width: 290, height: 30))
        alertTitle.backgroundColor = UIColor.clear
        alertTitle.textColor = UIColor.white
        alertTitle.text = "Alert Message"
        alertTitle.textAlignment = NSTextAlignment.center
        alertTitle.font = UIFont(name: "arial", size: 24)
        alertTitle.clipsToBounds = true;
        alertView.addSubview(alertTitle)
        
        let alertIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 5, width: 30, height: 30))
        alertIcon.image = UIImage.init(systemName: "exclamationmark.triangle")
        alertIcon.tintColor = .white
        alertView.addSubview(alertIcon)

        let alertClose = UIImageView.init(frame: CGRect.init(x: 265, y: 5, width: 30, height: 30))
        alertClose.isUserInteractionEnabled = true
        alertClose.image = UIImage.init(systemName: "multiply.square")
        alertClose.tintColor = .white
        let alertCloseTapped = UITapGestureRecognizer(target: self, action: #selector(alertCloeNavigation(_:)))
        alertClose.addGestureRecognizer(alertCloseTapped)
        alertView.addSubview(alertClose)
        
        alertMessage.frame = CGRect(x: 10, y: 80, width: alertView.frame.width-20, height: alertView.frame.height-10)
        alertMessage.text = msg
        alertMessage.numberOfLines = 2
        alertMessage.textColor = UIColor.white
        alertMessage.font = UIFont(name: "arial", size: 20)
        alertMessage.lineBreakMode = .byWordWrapping
        alertMessage.sizeToFit()
        alertMessage.textAlignment = .center
        alertView.addSubview(alertMessage)
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let moveUp = CGAffineTransform(translationX: 0.0, y: -(alertView.bounds.height))
            alertView.transform = moveUp
            alertView.frame = CGRect(x: 40, y: 500, width: 300, height: 200)
        })
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

    @objc func signinNow(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func alertCloeNavigation(_ sender: UITapGestureRecognizer) {
        alertView.frame = CGRect(x: 40, y: 500, width: 300, height: 200)
        UIView.animate(withDuration: 0.35, animations: { [self] in
            let moveUp = CGAffineTransform(translationX: 0.0, y: +(self.alertView.bounds.height))
            self.alertView.transform = moveUp
        })
    }
    
    @objc func registerNow(_ sender: UIButton) {
        if (txtFirstname.text?.isEmpty == true) {
            txtFirstname.layer.borderWidth = 3
            txtFirstname.layer.borderColor = UIColor.red.cgColor
            txtFirstname.becomeFirstResponder()
            alertMessage(msg: "Please enter your First Name, empty is not allowed.")
            return
        } else if (txtLastname.text?.isEmpty == true) {
            txtFirstname.layer.borderColor = UIColor.clear.cgColor
            txtLastname.layer.borderWidth = 3
            txtLastname.layer.borderColor = UIColor.red.cgColor
            txtFirstname.resignFirstResponder()
            txtLastname.becomeFirstResponder()
            alertMessage(msg: "Please enter your Last Name, empty is not allowed.")
            return
        } else if (txtEmail.text?.isEmpty == true) {
            txtLastname.layer.borderColor = UIColor.clear.cgColor
            txtEmail.layer.borderWidth = 3
            txtEmail.layer.borderColor = UIColor.red.cgColor
            txtLastname.resignFirstResponder()
            txtEmail.becomeFirstResponder()
            alertMessage(msg: "Please enter your Email Address, empty is not allowed.")
            return
        } else if (txtMobile.text?.isEmpty == true) {
            txtEmail.layer.borderColor = UIColor.clear.cgColor
            txtMobile.layer.borderWidth = 3
            txtMobile.layer.borderColor = UIColor.red.cgColor
            txtEmail.resignFirstResponder()
            txtMobile.becomeFirstResponder()
            alertMessage(msg: "Please enter your Mobile No., empty is not allowed.")
            return
        } else if (txtUsername.text?.isEmpty == true) {
            txtMobile.layer.borderColor = UIColor.clear.cgColor
            txtUsername.layer.borderWidth = 3
            txtUsername.layer.borderColor = UIColor.red.cgColor
            txtMobile.resignFirstResponder()
            txtUsername.becomeFirstResponder()
            alertMessage(msg: "Please enter your Username, empty is not allowed.")
            return
        } else if (txtPassword.text?.isEmpty == true) {
            txtUsername.layer.borderColor = UIColor.clear.cgColor
            txtPassword.layer.borderWidth = 3
            txtPassword.layer.borderColor = UIColor.red.cgColor
            txtUsername.resignFirstResponder()
            txtPassword.becomeFirstResponder()
            alertMessage(msg: "Please enter your Password, empty is not allowed.")
            return
        } else if (txtConfirmPassword.text?.isEmpty == true) {
            txtPassword.layer.borderColor = UIColor.clear.cgColor
            txtConfirmPassword.layer.borderWidth = 3
            txtConfirmPassword.layer.borderColor = UIColor.red.cgColor
            txtPassword.resignFirstResponder()
            txtConfirmPassword.becomeFirstResponder()
            alertMessage(msg: "Please enter Password Confirmation..")
            return
        }
        
        if (txtPassword.text != txtConfirmPassword.text) {
            txtPassword.layer.borderWidth = 3
            txtPassword.layer.borderColor = UIColor.red.cgColor
            txtConfirmPassword.layer.borderWidth = 3
            txtConfirmPassword.layer.borderColor = UIColor.red.cgColor
            txtPassword.resignFirstResponder()
            txtConfirmPassword.becomeFirstResponder()
            alertMessage(msg: "Password does not matched, please try again.")
            return
        } else {
            txtPassword.layer.borderColor = UIColor.clear.cgColor
            txtConfirmPassword.layer.borderColor = UIColor.clear.cgColor
        }
        
        signinPost()
    }

    @objc func signinPost() {
        let url = URL(string: "http://127.0.0.1:9000/user/register")
        let body = RegistrationModel(firstname: txtFirstname.text!, lastname: txtLastname.text!, email: txtEmail.text!, mobile: txtMobile.text!, username: txtUsername.text!, password: txtPassword.text!)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        request.cachePolicy = .reloadIgnoringCacheData
    
        URLSession.shared.dataTask(with: request) {(data, response, error)  in
            
            guard let data = data, error == nil else {
                return
            }

            if let signupResponse = try? JSONDecoder().decode(RegistrationResponse.self, from: data ) {
                DispatchQueue.main.async {
                    if (signupResponse.statuscode != nil) {
                        self.alertMessage(msg: signupResponse.message!)
                    } else {
                        self.alertMessage(msg: signupResponse.message!)
                    }
                }
            }
        
        }.resume()



    }
    
    func setGradientBackground() {
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
         self.bgView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 35))
         let gradientLayer:CAGradientLayer = CAGradientLayer()
         gradientLayer.frame.size = self.view.frame.size
         gradientLayer.colors = [UIColor.orange.cgColor,UIColor.yellow.withAlphaComponent(1).cgColor]
        self.bgView.layer.addSublayer(gradientLayer)
        self.view.addSubview(self.bgView)
    }

    
}
