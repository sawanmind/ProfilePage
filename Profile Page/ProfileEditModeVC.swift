//
//  ProfileEditModeVC.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//


import UIKit

class ProfileEditModeVC: UITableViewController, UITextFieldDelegate{
    
    enum ImageType {
        case cover
        case profile
    }
   
    var type: ImageType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
  
        let image = imageWithGradient(img: UIImage(named: "coverImage"))
        tableView.addScalableCover(with:image,maxHeight: 120, completion: { cover in
                                    
      
            
            self.coverImageView.image = #imageLiteral(resourceName: "coverImage")
            cover.addSubview(self.coverImageView)
            self.coverImageView.frame = CGRect(x: 0, y: 0, width: cover.bounds.size.width, height: cover.bounds.size.height)
    
            
            
          
            self.coverBlurEffectView.frame = cover.bounds
            self.coverImageView.addSubview(self.coverBlurEffectView)
            
            
            self.profileImageView.image = #imageLiteral(resourceName: "coverImage")
            cover.addSubview(self.profileImageView)
            self.profileImageView.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
            self.profileImageView.centerYAnchor.constraint(equalTo: cover.centerYAnchor).isActive = true
            self.profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
            self.profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive  = true
            
            
        
          
            cover.addSubview(self.cover_iconView)
            self.cover_iconView.trailingAnchor.constraint(equalTo: cover.trailingAnchor,constant: -20).isActive = true
            self.cover_iconView.centerYAnchor.constraint(equalTo: cover.centerYAnchor).isActive = true
            self.cover_iconView.widthAnchor.constraint(equalToConstant: 22).isActive  = true
            self.cover_iconView.heightAnchor.constraint(equalToConstant: 22).isActive  = true
            
            
           
            self.profileBlurEffectView.frame = cover.bounds
            self.profileImageView.addSubview(self.profileBlurEffectView)
            
            
            
            self.profileImageView.addSubview(self.profile_iconView)
            self.profile_iconView.centerXAnchor.constraint(equalTo: self.profileImageView.centerXAnchor).isActive = true
            self.profile_iconView.centerYAnchor.constraint(equalTo: self.profileImageView.centerYAnchor).isActive = true
            self.profile_iconView.widthAnchor.constraint(equalToConstant: 22).isActive  = true
            self.profile_iconView.heightAnchor.constraint(equalToConstant: 22).isActive  = true
            
         })
        
       
     }
    
    
    
    
    lazy var profileBlurEffectView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfile))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        blurEffectView.addGestureRecognizer(tap)
        return blurEffectView
    }()
    
    lazy var profileImageView : UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
        profileImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfile))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        profileImageView.addGestureRecognizer(tap)
        return profileImageView
    }()
    
    
    lazy var coverBlurEffectView : UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCover))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        blurEffectView.addGestureRecognizer(tap)
        return blurEffectView
    }()
    
    lazy var coverImageView : UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coverImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCover))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        coverImageView.addGestureRecognizer(tap)
        return coverImageView
    }()
    
    


    
     lazy var cover_iconView : UIButton = {
        let cover_iconView = UIButton()
        cover_iconView.isUserInteractionEnabled = true
        cover_iconView.imageView?.contentMode = .scaleAspectFit
        cover_iconView.translatesAutoresizingMaskIntoConstraints = false
        cover_iconView.tintColor = UIColor(white: 0.90, alpha: 1)
        cover_iconView.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCover))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        cover_iconView.addGestureRecognizer(tap)
        return cover_iconView
    }()
    
    
    lazy var profile_iconView : UIButton = {
        let profile_iconView = UIButton()
        profile_iconView.isUserInteractionEnabled = true
        profile_iconView.imageView?.contentMode = .scaleAspectFit
        profile_iconView.translatesAutoresizingMaskIntoConstraints = false
        profile_iconView.tintColor = UIColor(white: 0.90, alpha: 1)
        profile_iconView.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapProfile))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        profile_iconView.addGestureRecognizer(tap)
        return profile_iconView
    }()

    
    @objc  func handleSave(sender: UIBarButtonItem){
        debugPrint(
        "Cover Image:\(coverImageView.image ?? nil)",
        "Profile Image:\(profileImageView.image ?? nil)"
        )
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @objc  func handleCancel(sender: UIBarButtonItem){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    fileprivate func setupTableView() {
        hideKeyboardWhenTappedAround()
       
        self.tableView = UITableView(frame: tableView.frame, style: .plain)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "cell")
        self.navigationController?.navigationBar.updateAlpha(0)
        let navigationBar = navigationController?.navigationBar
        navigationBar?.attachToScrollView(tableView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        tableView.showsVerticalScrollIndicator = false
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.insetsContentViewsToSafeArea = true
        tableView.separatorStyle = .none
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileCell
       
    
        
        switch indexPath.section {
        case 0:
            cell?.iconView.setImage(#imageLiteral(resourceName: "name"), for: .normal)
            cell?.title.placeholder = "Full Name"
        case 1:
            cell?.iconView.setImage(#imageLiteral(resourceName: "phone"), for: .normal)
            cell?.title.placeholder = "Phone Number"
        case 2:
            cell?.iconView.setImage(#imageLiteral(resourceName: "email"), for: .normal)
            cell?.title.placeholder = "Email Address"
        case 3:
            cell?.iconView.setImage(#imageLiteral(resourceName: "gender"), for: .normal)
            cell?.title.placeholder = "Gender"
        case 4:
            cell?.iconView.setImage(#imageLiteral(resourceName: "birthday"), for: .normal)
            cell?.title.placeholder = "Birthday"
        case 5:
            cell?.iconView.setImage(#imageLiteral(resourceName: "address"), for: .normal)
            cell?.title.placeholder = "Address"
        default:
            print(123)
        }
       
        return cell!
    }
    
  @objc  func didTapProfile(){
        let alert = UIAlertController(title : "Tap to Choose Profile Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { _ in
            self.type = ImageType.profile
           self.photoFromLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { _ in
            self.type = ImageType.profile
            self.photoFromCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc  func didTapCover(){
        let alert = UIAlertController(title : "Tap to Choose Cover Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { _ in
            self.type = ImageType.cover
            self.photoFromLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { _ in
            self.type = ImageType.cover
            self.photoFromCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func photoFromLibrary() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    func photoFromCamera() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)!
        present(picker, animated: true, completion: nil)
    }
    
    
    
    func setupDatePicker(){
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        // cell.title.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    
    @objc   func datePickerValueChanged(sender: UIDatePicker) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeStyle = DateFormatter.Style.none
            print(dateFormatter.string(from: sender.date))
    }
    
    
    
}



extension ProfileEditModeVC:  UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 120  + 5
        } else {
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
       
        if type == ImageType.profile {
            profileImageView.image = chosenImage
            if profileImageView.image != nil {
                profileBlurEffectView.isHidden = true
                profile_iconView.isHidden = true
            } else {
                profileBlurEffectView.isHidden = true
                profile_iconView.isHidden = false
            }
        } else if  type == ImageType.cover {
            coverImageView.image = chosenImage
            if coverImageView.image != nil {
                coverBlurEffectView.isHidden = true
                cover_iconView.isHidden = true
            } else {
                coverBlurEffectView.isHidden = true
                cover_iconView.isHidden = false
            }
        }
       
        dismiss(animated:true, completion: nil)
    }
   
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }
    
    
    
}







