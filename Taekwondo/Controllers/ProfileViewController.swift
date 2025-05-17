//
//  ProfileViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 4/30/25.
//

import UIKit
import UniformTypeIdentifiers

enum CameraError: Error
{
    case NoCamera
    case NoPhoto
}

let supportedTypes: [UTType] = [UTType.png, UTType.jpeg]

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIDocumentPickerDelegate {

    private let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)

    private var strUserID = String()
    private var token = String()
    private let userPic = UIImageView()
    private let uiLblTitle = UILabel()
    private let cameraIcon = UIImageView()
    private let picker = UIImagePickerController()

    
    private let txtFirstName = UITextField()
    private let txtLastName = UITextField()
    private let txtEmailadd = UITextField()
    private let txtMobileno = UITextField()
    
    private let lblFirstname = UILabel()
    private let lblLastname = UILabel()
    private let lblEmailadd = UILabel()
    private let lblMobileno = UILabel()
    
    private let btnUpdateProfile = UIButton()

    private let chkChangePwd = UISwitch()
    private let lblChangePwd = UILabel()
    private let changePwdView = UIView()
    
    private let newPassword = UITextField()
    private let confirmPassword = UITextField()
    private let btnChangePwd = UIButton()
    
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = UIColor.systemTeal
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private var bodyView: UIView = {
        let v = UIScrollView()
        return v
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIScroll()
        
        let userDefaults = UserDefaults.standard
        strUserID = userDefaults.string(forKey: "USERID")!
        token = userDefaults.string(forKey: "TOKEN")!
        loadProfile(userId: strUserID, token: token)

        self.view.backgroundColor = UIColor.systemTeal
        changePwdView.isHidden = true
        userPic.frame = CGRect(x: (self.view.frame.width/3)-30, y: 40, width: self.view.frame.width/2.5, height: 150)
        userPic.image = UIImage(systemName: "person")
        userPic.layer.cornerRadius = 20
        userPic.clipsToBounds = true
        self.bodyView.addSubview(userPic)
        
        cameraIcon.frame = CGRect(x: (self.view.frame.width/3)+130, y: 150, width: 40, height: 35)
        cameraIcon.image = UIImage(systemName: "camera")
        cameraIcon.image?.withRenderingMode(.alwaysOriginal)
        cameraIcon.isUserInteractionEnabled = true
        cameraIcon.tintColor = .black
        let cameraTapped = UITapGestureRecognizer(target: self, action: #selector(cameraTapped(_:)))
        cameraIcon.addGestureRecognizer(cameraTapped)

        self.bodyView.addSubview(cameraIcon)
        
        uiLblTitle.frame = CGRect(x: (self.view.frame.width/3), y: 190, width: 300, height: 40)
        uiLblTitle.text = "User Profile"
        uiLblTitle.textColor = .white
        uiLblTitle.font = UIFont.init(name: "arial", size: 24)
        self.bodyView.addSubview(uiLblTitle)

        
        txtFirstName.frame = CGRect(x: (self.view.frame.width/3)-60, y: 250, width: (self.view.frame.width/2)+50, height: 40)
        txtFirstName.backgroundColor = .white
        txtFirstName.textAlignment = .center
        self.bodyView.addSubview(txtFirstName)

        lblFirstname.frame = CGRect(x: (self.view.frame.width/3)-60, y: 285, width: (self.view.frame.width/2)+50, height: 40)
        lblFirstname.text = "First Name"
        lblFirstname.textColor = .white
        lblFirstname.textAlignment = .center
        self.bodyView.addSubview(lblFirstname)

        
        txtLastName.frame = CGRect(x: (self.view.frame.width/3)-60, y: 330, width: (self.view.frame.width/2)+50, height: 40)
        txtLastName.backgroundColor = .white
        txtLastName.textAlignment = .center
        self.bodyView.addSubview(txtLastName)

        lblLastname.frame = CGRect(x: (self.view.frame.width/3)-60, y: 365, width: (self.view.frame.width/2)+50, height: 40)
        lblLastname.text = "Last Name"
        lblLastname.textColor = .white
        lblLastname.textAlignment = .center
        self.bodyView.addSubview(lblLastname)

        txtEmailadd.frame = CGRect(x: (self.view.frame.width/3)-60, y: 410, width: (self.view.frame.width/2)+50, height: 40)
        txtEmailadd.backgroundColor = .white
        txtEmailadd.textAlignment = .center
        txtEmailadd.isEnabled = false
        self.bodyView.addSubview(txtEmailadd)

        lblEmailadd.frame = CGRect(x: (self.view.frame.width/3)-60, y: 445, width: (self.view.frame.width/2)+50, height: 40)
        lblEmailadd.text = "Email Address"
        lblEmailadd.textColor = .white
        lblEmailadd.textAlignment = .center
        self.bodyView.addSubview(lblEmailadd)

        txtMobileno.frame = CGRect(x: (self.view.frame.width/3)-60, y: 490, width: (self.view.frame.width/2)+50, height: 40)
        txtMobileno.backgroundColor = .white
        txtMobileno.textAlignment = .center
        self.bodyView.addSubview(txtMobileno)

        lblMobileno.frame = CGRect(x: (self.view.frame.width/3)-60, y: 520, width: (self.view.frame.width/2)+50, height: 40)
        lblMobileno.text = "Mobile No"
        lblMobileno.textColor = .white
        lblMobileno.textAlignment = .center
        self.bodyView.addSubview(lblMobileno)
        
        btnUpdateProfile.frame =  CGRect(x: (self.view.frame.width/3)-60, y: 560, width: (self.view.frame.width/2)+50, height: 40)
        btnUpdateProfile.setTitle("update profile", for: .normal)
        btnUpdateProfile.setTitleColor(.white, for: .normal)
        btnUpdateProfile.backgroundColor = .blue
        btnUpdateProfile.layer.cornerRadius = 20
        btnUpdateProfile.clipsToBounds = true
        btnUpdateProfile.addTarget(self, action: #selector(didUpdateprofileTapped), for: .touchUpInside)
        self.bodyView.addSubview(btnUpdateProfile)
        
        ///CHANGE PASSWORD

        chkChangePwd.frame = CGRect(x: (self.view.frame.width/3)-60, y: 615, width: (self.view.frame.width/2)+50, height: 40)
        self.bodyView.addSubview(chkChangePwd)
        chkChangePwd.setOn(false, animated: false)
        chkChangePwd.addTarget(self, action: #selector(checkboxPwd(_:)), for: .valueChanged)
        lblChangePwd.frame = CGRect(x: (self.view.frame.width/3), y: 610, width: (self.view.frame.width/2)+50, height: 40)
        lblChangePwd.text = "Change your password?"
        lblChangePwd.textColor = .white
        self.bodyView.addSubview(lblChangePwd)
        
        changePwdView.frame = CGRect(x: 50, y: 680, width: 340, height: 200)
        changePwdView.backgroundColor = .systemTeal
        self.bodyView.addSubview(changePwdView)
        
        newPassword.frame = CGRect(x: 10, y: 10, width: 250, height: 40)
        newPassword.placeholder = "enter your new Password"
        newPassword.textAlignment = .center
        newPassword.backgroundColor = .white
        newPassword.isSecureTextEntry = true
        changePwdView.addSubview(newPassword)

        confirmPassword.frame = CGRect(x: 10, y: 60, width: 250, height: 40)
        confirmPassword.placeholder = "confirm your new password"
        confirmPassword.textAlignment = .center
        confirmPassword.backgroundColor = .white
        confirmPassword.isSecureTextEntry = true
        changePwdView.addSubview(confirmPassword)
        
        btnChangePwd.frame = CGRect(x: 30, y: 110, width: 200, height: 40)
        btnChangePwd.setTitle("change password", for: .normal)
        btnChangePwd.setTitleColor(.white, for: .normal)
        btnChangePwd.backgroundColor = .blue
        btnChangePwd.layer.cornerRadius = 20
        btnChangePwd.clipsToBounds = true
        btnChangePwd.addTarget(self, action: #selector(didChangePassword), for: .touchUpInside)
        changePwdView.addSubview(btnChangePwd)
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @objc func cameraTapped(_ sender: UITapGestureRecognizer) throws {
                
        let alertController = UIAlertController(title: "Change Profile Picture", message: "", preferredStyle: .alert)
         alertController.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { _ in

                self.picker.allowsEditing = true
                self.picker.sourceType = .camera
                self.present(self.picker, animated: true)
            
         }))
         alertController.addAction(UIAlertAction(title: "Photo Library", style: UIAlertAction.Style.default, handler: { _ in
            self.picker.allowsEditing = true
            self.picker.delegate = self
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true)
         }))
        alertController.addAction(UIAlertAction(title: "iCloud Photo Album", style: UIAlertAction.Style.default, handler: { _ in
//           self.picker.allowsEditing = true
//           self.picker.delegate = self
//            self.picker.sourceType = .savedPhotosAlbum
//           self.present(self.picker, animated: true)
            
//            let pickerViewController = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
            self.pickerViewController.delegate = self
            self.pickerViewController.allowsMultipleSelection = false
            self.pickerViewController.shouldShowFileExtensions = true
            self.present(self.pickerViewController, animated: true, completion: nil)
            
            
        }))
         alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
             print("cancel")
         }))
         present(alertController, animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.picker.dismiss(animated: true, completion: nil)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
//        self.pickerViewController.dismiss(animated: true, completion: nil)
        guard
              let url = urls.first,
              url.startAccessingSecurityScopedResource()
          else {
                  return
          }
          defer { url.stopAccessingSecurityScopedResource() }
          do {
            
              let data = try Data(contentsOf: url)
              self.userPic.image = UIImage(data: data)
              let strBase64 = convertImageToBase64String(img: self.userPic.image!)
              updatePicture(userId: strUserID, token: token, base64Image: strBase64)

          } catch {
                  print(error)
          }
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[.editedImage] as? UIImage else { return }
//        self.userPic.image = image

        self.picker.dismiss(animated: true, completion: nil)        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        self.userPic.image = image
        
        let strBase64 = convertImageToBase64String(img: self.userPic.image!)
////        self.userPic.image =UIImage(data: Data(base64Encoded: compressdata!)!)
//        let strBase64 = compressdata?
//        print(strBase64)
        
        
        
        updatePicture(userId: strUserID, token: token, base64Image: strBase64)
    }

    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }

    
    @objc func checkboxPwd(_ sender: UISwitch) {
        if (sender.isOn) {
            changePwdView.isHidden = false
        } else {
            changePwdView.isHidden = true
        }
    }
    
    @objc func didUpdateprofileTapped() {
        if (self.txtFirstName.text?.isEmpty == true) {
            let alertController = UIAlertController(title: "Alert Message!", message: "First Name should not be empty!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        } else if (self.txtLastName.text?.isEmpty == true) {
            let alertController = UIAlertController(title: "Alert Message!", message: "Last Name should not be empty!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        } else if (self.txtMobileno.text?.isEmpty == true) {
            let alertController = UIAlertController(title: "Alert Message!", message: "Mobile No. should not be empty!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        updateProfile(userId: strUserID, token: token)
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
    
    @objc func didChangePassword() {
        if (self.newPassword.text?.isEmpty == true) {
            let alertController = UIAlertController(title: "Alert Message!", message: "New Password should not be empty!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        } else if (self.confirmPassword.text?.isEmpty == true) {
            let alertController = UIAlertController(title: "Alert Message!", message: "Confirm Password not be empty!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        if (self.newPassword.text != self.confirmPassword.text) {
            let alertController = UIAlertController(title: "Alert Message!", message: "Password does not matched! please try again.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        changePassword(userId: strUserID, token: token)
    }
    
    func loadProfile(userId: String, token: String) {
        let url = URL(string: "http://127.0.0.1:9000/getuser/\(userId)")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

         URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
            
                if let res = try? JSONDecoder().decode(Profile.self, from: data) {
                  DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                    DispatchQueue.main.async {
                        self.txtFirstName.text = res.firstname!
                        self.txtLastName.text = res.lastname!
                        self.txtEmailadd.text = res.email
                        self.txtMobileno.text = res.mobile
                        self.userPic.image = UIImage(data: Data(base64Encoded: res.userpicture!)!)
                    }
                  }
             }
         }.resume()
    }
    
    func updateProfile(userId: String, token: String) {
        let url = URL(string: "http://127.0.0.1:9000/userupdate/\(userId)")
        let body = Updateprofile(firstname: self.txtFirstName.text!, lastname: self.txtLastName.text!, mobile: self.txtMobileno.text!)
        print(body)
        
            var request = URLRequest(url: url!)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = try? JSONEncoder().encode(body)
            request.cachePolicy = .reloadIgnoringCacheData
        
            URLSession.shared.dataTask(with: request) {(data, response, error)  in

                guard let data = data, error == nil else {
                    return
                }
                
                if let res = try? JSONDecoder().decode(UPdateprofileResponse.self, from: data ) {
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                        DispatchQueue.main.async {
                            if (res.statuscode == "200") {
                                let alertController = UIAlertController(title: "Alert Message!", message: res.message, preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
                                alertController.addAction(okAction)
                                self.present(alertController, animated: true, completion: nil)

                            }
                       }
                }
              }
            }.resume()
        
    }
    
    func changePassword(userId: String, token: String) {
        let url = URL(string: "http://127.0.0.1:9000/updatepwd/\(userId)")
        let body = Changepassword(password: self.newPassword.text!)
        print(body)
        
            var request = URLRequest(url: url!)
            request.httpMethod = "PUT"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = try? JSONEncoder().encode(body)
            request.cachePolicy = .reloadIgnoringCacheData
        
            URLSession.shared.dataTask(with: request) {(data, response, error)  in

                guard let data = data, error == nil else {
                    return
                }
                
                if let res = try? JSONDecoder().decode(ChangepasswordResponse.self, from: data ) {
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Alert Message!", message: res.message, preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                       }
                }
              }
            }.resume()
    }

    func updatePicture(userId: String, token: String, base64Image: String) {
        let url = URL(string: "http://127.0.0.1:9000/updatepicture/\(userId)")
        let body = Updatepicture(userpicture: base64Image)
            var request = URLRequest(url: url!)
            request.httpMethod = "PATCH"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpBody = try? JSONEncoder().encode(body)
        
            URLSession.shared.dataTask(with: request) {(data, response, error)  in

                guard let data = data, error == nil else {
                    return
                }
                
                if let res = try? JSONDecoder().decode(UpdatepictureResponse.self, from: data ) {
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                        DispatchQueue.main.async {
                            let alertController = UIAlertController(title: "Alert Message!", message: res.message, preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default) { _ in}
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                       }
                }
              }
            }.resume()
    }

    
    
}
