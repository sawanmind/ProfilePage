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

        let image = imageWithGradient(img: UIImage(named: "coverImage"))
        tableView.addScalableCover(with:image,
                                   name: "Sawan Kumar",
                                   email:  "sawanmind@gmail.com",
                                   maxHeight: 120)

        
        let contactNumber = ProfileModel(icon: #imageLiteral(resourceName: "phone"), title: NSAttributedString(string: "+91 - 8010153210"))
        
        let address = ProfileModel(icon: #imageLiteral(resourceName: "address"), title: NSAttributedString(string: "Sector 85, Gurugram"))
        
        let DOB = ProfileModel(icon: #imageLiteral(resourceName: "birthday"), title: NSAttributedString(string: "Jan 20, 1991"))
        
        
        let gender = ProfileModel(icon: #imageLiteral(resourceName: "gender"), title: NSAttributedString(string: "Female"))
        
        array.append(contactNumber)
        array.append(gender)
        array.append(DOB)
        array.append(address)
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        ScalableCover.isEditingMode = false
    }
    
   @objc  func handleEdit(sender: UIBarButtonItem){
     let new = UINavigationController(rootViewController: ProfileEditModeVC())
    self.navigationController?.navigationBar.reset()
    navigationController?.navigationBar.shadowImage = UIImage()
    self.present(new, animated: false, completion: nil)
    self.navigationController?.navigationBar.updateAlpha(0)
}
    
 
    
    fileprivate func setupTableView() {
        self.tableView = UITableView(frame: tableView.frame, style: .plain)
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
        
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileCell
        cell?.iconView.setImage(array[indexPath.section].icon, for: .normal)
        cell?.title.attributedText = array[indexPath.section].title
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

