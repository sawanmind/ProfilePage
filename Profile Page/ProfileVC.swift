//
//  ViewController.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//

import UIKit

class ProfileVC: UITableViewController {

    var array = [ProfileModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupTableView()
/*
        let image = imageWithGradient(img: UIImage(named: "coverImage"))
       
        tableView.addScalableCover(with:image,maxHeight: 120, completion: { cover  in
            
            
            self.coverImageView.image = #imageLiteral(resourceName: "coverImage")
            cover.addSubview(self.coverImageView)
            self.coverImageView.frame = CGRect(x: 0, y: 0, width: cover.bounds.size.width, height: cover.bounds.size.height)
            
            
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = cover.bounds
            blurEffectView.isUserInteractionEnabled = true
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.coverImageView.addSubview(blurEffectView)
            
            
            self.profileImageView.image = #imageLiteral(resourceName: "coverImage")
            cover.addSubview(self.profileImageView)
            self.profileImageView.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
            self.profileImageView.centerYAnchor.constraint(equalTo: cover.centerYAnchor).isActive = true
            self.profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
            self.profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive  = true
            
            
            self._name.text = "Sawan Kumar"
            cover.addSubview(self._name)
            self._name.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
            self._name.topAnchor.constraint(equalTo: self.profileImageView.bottomAnchor,constant: 15).isActive = true
            self._name.widthAnchor.constraint(equalTo: cover.widthAnchor,constant: -25).isActive  = true
            self._name.heightAnchor.constraint(equalToConstant: 20).isActive  = true
            
            self._email.text = "sawanmind@gmail.com"
            cover.addSubview(self._email)
            self._email.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
            self._email.topAnchor.constraint(equalTo: self._name.bottomAnchor,constant: 8).isActive = true
            self._email.widthAnchor.constraint(equalTo: cover.widthAnchor,constant: -25).isActive  = true
            self._email.heightAnchor.constraint(equalToConstant: 16).isActive  = true
 
            
        })
 */
        
        let contactNumber = ProfileModel(icon: #imageLiteral(resourceName: "phone"), title: NSAttributedString(string: "+91 - 8010153210"))
        
        let address = ProfileModel(icon: #imageLiteral(resourceName: "address"), title: NSAttributedString(string: "Sector 85, Gurugram"))
        
        let DOB = ProfileModel(icon: #imageLiteral(resourceName: "birthday"), title: NSAttributedString(string: "Jan 20, 1991"))
        
        
        let gender = ProfileModel(icon: #imageLiteral(resourceName: "gender"), title: NSAttributedString(string: "Female"))
        
        array.append(contactNumber)
        array.append(gender)
        array.append(DOB)
        array.append(address)
       
    }
    
    
    let profileImageView : UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
        profileImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.isUserInteractionEnabled = true
        return profileImageView
    }()
    
    lazy var coverImageView : UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coverImageView.isUserInteractionEnabled = true
        return coverImageView
    }()
    
    
    let _name : UILabel = {
        let _name = UILabel()
        _name.isUserInteractionEnabled = true
        _name.translatesAutoresizingMaskIntoConstraints = false
        _name.adjustsFontSizeToFitWidth = true
        _name.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.semibold)
        _name.textColor = UIColor.white
        _name.textAlignment = .center
        _name.lineBreakMode = .byWordWrapping
        return _name
    }()
    
    
    
    let _email : UILabel = {
        let _email = UILabel()
        _email.isUserInteractionEnabled = true
        _email.translatesAutoresizingMaskIntoConstraints = false
        _email.adjustsFontSizeToFitWidth = true
        _email.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        _email.textColor = UIColor.white
        _email.textAlignment = .center
        _email.lineBreakMode = .byWordWrapping
        return _email
    }()
    
   


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
      
    }
    
   @objc  func handleEdit(sender: UIBarButtonItem){
     let new = UINavigationController(rootViewController: ProfileEditModeVC())
    self.navigationController?.navigationBar.reset()
    navigationController?.navigationBar.shadowImage = UIImage()
    self.present(new, animated: false, completion: nil)
    self.navigationController?.navigationBar.updateAlpha(0)
}
    
 
    
    fileprivate func setupTableView() {
        self.tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "cell")
        self.navigationController?.navigationBar.updateAlpha(0)
        let navigationBar = navigationController?.navigationBar
        navigationBar?.attachToScrollView(tableView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(handleEdit))
        tableView.showsVerticalScrollIndicator = false
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.insetsContentViewsToSafeArea = true
        tableView.separatorStyle = .none
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileCell
        cell?.iconView.setImage(array[indexPath.row].icon, for: .normal)
        cell?.title.attributedText = array[indexPath.row].title
        cell?.title.isEnabled = false
        return cell!
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

