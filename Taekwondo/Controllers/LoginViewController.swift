//
//  LoginViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/1/25.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginDialog = UIView()
    private let txtEmailId = UITextField()
    private let forgotDialog = UIView()
    private let txtUsrname = UITextField()
    private let txtPword = UITextField()
    private var statusCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear

        loginDialog.frame = CGRect(x: 60, y: 150, width: 250, height: 350)
        loginDialog.backgroundColor = UIColor.purple
        loginDialog.layer.cornerRadius = 20
        self.view.addSubview(loginDialog)
        
        let loginTitle = UILabel(frame: CGRect(x: 0, y: 1, width: 250, height: 50))
        loginTitle.backgroundColor = UIColor.black
        loginTitle.clipsToBounds = true
        loginTitle.layer.cornerRadius = 20
        loginTitle.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
        loginTitle.text = "    Signin"
        loginTitle.textColor = UIColor.white
        loginTitle.font = UIFont(name: "arial", size: 22)
        loginTitle.textAlignment = .left
        loginDialog.addSubview(loginTitle)
        
        let loginIcon = UIImageView(frame: CGRect(x: 210, y: 10, width: 30, height: 30))
        loginIcon.image = UIImage(systemName: "multiply.square")
        loginIcon.tintColor = UIColor.white
        loginIcon.isUserInteractionEnabled = true
        let loginTapped = UITapGestureRecognizer(target: self, action: #selector(loginClosedTapped))
        loginIcon.addGestureRecognizer(loginTapped)
        loginDialog.addSubview(loginIcon)
        
        txtUsrname.frame = CGRect(x: 25, y: 90, width: 200, height: 40)
        txtUsrname.backgroundColor = UIColor.white
        txtUsrname.layer.cornerRadius = 10
        txtUsrname.placeholder = "enter your Username"
        txtUsrname.autocapitalizationType = .none
        let spacerView1 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtUsrname.leftViewMode = UITextField.ViewMode.always
        txtUsrname.leftView = spacerView1
        txtUsrname.becomeFirstResponder()
        loginDialog.addSubview(txtUsrname)
        
        txtPword.frame = CGRect(x: 25, y: 140, width: 200, height: 40)
        txtPword.backgroundColor = UIColor.white
        txtPword.layer.cornerRadius = 10
        txtPword.placeholder = "enter your Password"
        txtPword.autocapitalizationType = .none
        txtPword.isSecureTextEntry = true
        let spacerView2 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        txtPword.leftViewMode = UITextField.ViewMode.always
        txtPword.leftView = spacerView2
        loginDialog.addSubview(txtPword)
        
        let loginBtn = UIButton(frame: CGRect(x: 25, y: 190, width: 200, height: 40))
        loginBtn.setTitle("signin now", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = UIColor.blue
        loginBtn.layer.cornerRadius = 10
        loginBtn.addTarget(self, action: #selector(submitLogin(_:)), for: .touchUpInside)
        loginDialog.addSubview(loginBtn)

        ///LOGIN BUTTON ICON
        let signinIcon = UIImageView.init(frame: CGRect.init(x: 10, y: 8, width: 30, height: 30))
        signinIcon.image = UIImage.init(systemName: "hand.draw")
        signinIcon.tintColor = .white
        loginBtn.addSubview(signinIcon)
        
        let forgotAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.underlineStyle: 1,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 19),
        NSAttributedString.Key.foregroundColor: UIColor.cyan]
        let attributedString = NSMutableAttributedString(string: "Forgot password?", attributes: forgotAttributes)
        let btnForgot = UIButton(frame: CGRect(x: 5, y: 300, width: 200, height: 40))
        btnForgot.setAttributedTitle(NSAttributedString(attributedString: attributedString), for: .normal)
        btnForgot.addTarget(self, action: #selector(forgotPassword(_:)), for: .touchUpInside)
        loginDialog.addSubview(btnForgot)

        loginDialog.frame = CGRect(x: 60, y: -150, width: 250, height: 350)

        UIView.animate(withDuration: 0.35, animations: { [loginDialog] in
            let moveDown = CGAffineTransform(translationX: 0.0, y: +(loginDialog.bounds.height))
            loginDialog.transform = moveDown
            loginDialog.frame = CGRect(x: 60, y: 150, width: 250, height: 350)
        })
        
    }
    ///END viewDidLoad


    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    @IBAction func submitLogin(_ sender: UIButton) {
        if (self.txtUsrname.text?.isEmpty == true) {
            txtUsrname.layer.borderWidth = 3
            txtUsrname.layer.borderColor = UIColor.cyan.cgColor
            return
        }
        
        if (self.txtPword.text?.isEmpty == true) {
            txtUsrname.layer.borderColor = UIColor.clear.cgColor
            txtPword.layer.borderWidth = 3
            txtPword.layer.borderColor = UIColor.cyan.cgColor
            return
        }
        txtPword.layer.borderColor = UIColor.clear.cgColor
        self.txtUsrname.isEnabled = false
        self.txtPword.isEnabled = false;
        postLogin()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if (self.statusCode == "200") {
                self.dismiss(animated: true, completion: nil)
                UserDefaults.standard.set(true, forKey: "IsUserLoggedIn")
            } else {
                self.txtUsrname.isEnabled = true
                self.txtPword.isEnabled = true;
            }
        }
     }
    
    @objc func loginClosedTapped(_ sender: UITapGestureRecognizer) {
            UIView.animate(withDuration: 0.35, animations: { [self] in
                let moveUp = CGAffineTransform(translationX: 0.0, y: -(self.loginDialog.bounds.height))
                self.loginDialog.transform = moveUp
            })
            dismiss(animated: true, completion: nil)
        }
        
    @objc func forgotPassword(_ sender: UITapGestureRecognizer) {
            ///REMOVE LOGIN VIEW
            self.loginDialog.removeFromSuperview()
            
            ///DISPLAY FORGOT PASSWORD VIEW
            forgotDialog.frame = CGRect(x: 60, y: -200, width: 250, height: 200)
            forgotDialog.backgroundColor = UIColor.orange
            forgotDialog.layer.cornerRadius = 20
            self.view.addSubview(forgotDialog)
            
            let forgotTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
            forgotTitle.backgroundColor = UIColor.darkGray
            forgotTitle.clipsToBounds = true
            forgotTitle.layer.cornerRadius = 20
            forgotTitle.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively
            forgotTitle.text = "  Forgot Password"
            forgotTitle.textColor = UIColor.white
            forgotTitle.font = UIFont(name: "arial", size: 18)
            forgotTitle.textAlignment = .left
            forgotDialog.addSubview(forgotTitle)
            
            let forgotIcon = UIImageView(frame: CGRect(x: 210, y: 10, width: 30, height: 30))
            forgotIcon.image = UIImage(systemName: "multiply.square")
            forgotIcon.tintColor = UIColor.white
            forgotIcon.isUserInteractionEnabled = true
            let forgotsTapped = UITapGestureRecognizer(target: self, action: #selector(forgotIconCloseNavigation(_ :)))
            forgotIcon.addGestureRecognizer(forgotsTapped)
            forgotDialog.addSubview(forgotIcon)

            txtEmailId.frame = CGRect(x: 25, y: 80, width: 200, height: 40)
            txtEmailId.backgroundColor = UIColor.white
            txtEmailId.layer.cornerRadius = 10
            txtEmailId.placeholder = "enter registered Email ID"
            txtEmailId.autocapitalizationType = .none
            txtEmailId.font = UIFont(name: "arial", size: 14)
            let spacerView1 = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
            txtEmailId.leftViewMode = UITextField.ViewMode.always
            txtEmailId.leftView = spacerView1
            forgotDialog.addSubview(txtEmailId)

            let forgotBtn = UIButton(frame: CGRect(x: 50, y: 130, width: 150, height: 40))
            forgotBtn.setTitle("submit", for: .normal)
            forgotBtn.setTitleColor(.white, for: .normal)
            forgotBtn.backgroundColor = UIColor.darkGray
            forgotBtn.layer.cornerRadius = 10
//            forgotBtn.addTarget(self, action: #selector(submitforgotPassword(_:)), for: .touchUpInside)
            forgotDialog.addSubview(forgotBtn)
            
            UIView.animate(withDuration: 0.35, animations: { [forgotDialog] in
                let moveDown = CGAffineTransform(translationX: 0.0, y: +(forgotDialog.bounds.height))
                forgotDialog.transform = moveDown
                forgotDialog.frame = CGRect(x: 60, y: 200, width: 250, height: 200)
            })
        }
        
        func submitforgotPassword(_ sender: UIButton) {
            let emailReg: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            let validateEmail: NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailReg)
            if (validateEmail.evaluate(with: self.txtEmailId.text!) == false) {
                self.txtEmailId.layer.borderWidth = 3
                self.txtEmailId.layer.borderColor = UIColor.cyan.cgColor
                ///ALERT MESSAGE
                let alertController = UIAlertController(title: "Alert Message!", message: "please enter valid Email ID", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return
            }

            self.txtEmailId.layer.borderColor = UIColor.clear.cgColor
            self.txtEmailId.isEnabled = false
            postForgot()
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                if (self.statusCode == "200") {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.txtEmailId.isEnabled = true
                }
            }
        }
        
    @objc func forgotIconCloseNavigation(_ sender: UIButton) {
            UIView.animate(withDuration: 0.35, animations: { [self] in
                let moveDown = CGAffineTransform(translationX: 0.0, y: -(forgotDialog.bounds.height))
                self.forgotDialog.transform = moveDown
                forgotDialog.frame = CGRect(x: 60, y: -200, width: 250, height: 200)
                dismiss(animated: true, completion: nil)

            })
        }
        
        func postLogin() {
            let url = URL(string: "http://127.0.0.1:9000/user/login")
            let body = LoginModel(username: txtUsrname.text! , password: txtPword.text!)
                var request = URLRequest(url: url!)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONEncoder().encode(body)
                request.cachePolicy = .reloadIgnoringCacheData
            
                URLSession.shared.dataTask(with: request) {(data, response, error)  in

                    guard let data = data, error == nil else {
                        return
                    }
                    
                    if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data ) {
                        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                            DispatchQueue.main.async {
                                let alertController = UIAlertController(title: "Alert Message!", message: loginResponse.message, preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
                                alertController.addAction(okAction)
                                self.present(alertController, animated: true, completion: nil)
                                if (loginResponse.statuscode == "200") {
                                    self.statusCode = loginResponse.statuscode!
                                    UserDefaults.standard.set(false, forKey: "IsUserLoggedIn")
                                    UserDefaults.standard.set(loginResponse.id, forKey: "USERID")
                                    UserDefaults.standard.set(loginResponse.fullname, forKey: "USERNAME")
                                    UserDefaults.standard.set(loginResponse.token, forKey: "TOKEN")
                                    UserDefaults.standard.set(loginResponse.userpicture, forKey: "USERPIC")
                                }
                             }
                           }
                    }
                }.resume()
        }
        
        func postForgot() {
            let url = URL(string: "http://127.0.0.1:9000/forgot")
            let body = ForgotModel(email: txtEmailId.text!)
                var request = URLRequest(url: url!)
                request.httpMethod = "POST"
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONEncoder().encode(body)
                request.cachePolicy = .reloadIgnoringCacheData
            
                URLSession.shared.dataTask(with: request) {(data, response, error)  in

                    guard let data = data, error == nil else {
                        return
                    }
                    
                    if let forgotResponse = try? JSONDecoder().decode(ForgotResponse.self, from: data ) {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Alert Message!", message: forgotResponse.message, preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                                //action
                            }
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                            if (forgotResponse.statuscode == "200") {
                                self.statusCode = forgotResponse.statuscode
                            }
                        }
                    }
                }.resume()

        }


}

