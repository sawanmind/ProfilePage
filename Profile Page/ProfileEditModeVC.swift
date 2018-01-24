//
//  ProfileEditModeVC.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//


import UIKit

class ProfileEditModeVC: UITableViewController , ProfileDelegate, UITextFieldDelegate{
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        let image = imageWithGradient(img: UIImage(named: "coverImage"))
        tableView.addScalableCover(with:image,
                                   name: "Sawan Kumar",
                                   email:  "sawanmind@gmail.com",
                                   maxHeight: 120)
     }
    
    
    @objc  func handleSave(sender: UIBarButtonItem){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @objc  func handleCancel(sender: UIBarButtonItem){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    fileprivate func setupTableView() {
        hideKeyboardWhenTappedAround()
        ScalableCover.isEditingMode = true
        ScalableCover.delegate = self
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
        cell?.delegate = self
        cell?.bgView.layer.borderWidth = 1
        
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
    
    func didTapCameraBtn(){
        let alert = UIAlertController(title : nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { _ in
           self.photoFromLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { _ in
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
    
    

    
   
    
    func didTapOnCell<T>(cell: T, type: ImageType) {
        if type == ImageType.coverImage {
            didTapCameraBtn()
        } else if type == ImageType.profileImage {
            didTapCameraBtn()
        } else  if type == ImageType.cell {
            guard let cell = cell as? ProfileCell else {return}
            
            if cell.title.isEditing {
                cell.bgView.backgroundColor = UIColor.red
            } else {
                cell.bgView.backgroundColor = UIColor.clear
            }
        } else {}
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
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
//        myImageView.contentMode = .scaleAspectFit //3
//        myImageView.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         dismiss(animated: true, completion: nil)
    }
    
    
}







