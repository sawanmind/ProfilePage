//
//  ProfileCell.swift
//  Profile Page
//
//  Created by iOS Developer on 1/24/18.
//  Copyright © 2018 Genysis. All rights reserved.
//

import UIKit



class ProfileCell: UITableViewCell {
    
    var delegate : ProfileDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTextField))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        contentView.addGestureRecognizer(tap)
        setupsliderimage()
    }
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var  iconView: UIButton = {
        let lineView = UIButton()
        lineView.isUserInteractionEnabled = true
        lineView.imageView?.contentMode = .scaleAspectFit
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.tintColor = UIColor(white: 0.70, alpha: 1)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTextField))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        lineView.addGestureRecognizer(tap)
        return lineView
    }()
    
    

    
    lazy var title: UITextField = {
        let lineView = UITextField()
        lineView.isUserInteractionEnabled = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.adjustsFontForContentSizeCategory = true
        lineView.adjustsFontSizeToFitWidth = true
        lineView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        lineView.textColor = UIColor().colorFromHexString("222222")
        lineView.textAlignment = .left
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTextField))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        lineView.addGestureRecognizer(tap)
        lineView.becomeFirstResponder()
       
        return lineView
    }()
    
    
    @objc fileprivate func handleTextField(){
        delegate?.didTapOnCell(cell: self, type: .cell)
    }
    
    
    private  func setupsliderimage(){
        
   
       addSubview(iconView)
        
        iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        
     
        addSubview(title)
        
        title.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant:20).isActive = true
        title.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20).isActive = true
        title.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
    }
    
}




