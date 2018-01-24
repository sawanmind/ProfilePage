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
    
    
    lazy var  bgView: UIView = {
        let lineView = UIView()
        lineView.isUserInteractionEnabled = true
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.layer.cornerRadius = 22
        lineView.layer.masksToBounds = true
        lineView.layer.borderWidth = 0
        lineView.layer.borderColor = UIColor(white: 0.90, alpha: 1).cgColor
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTextField))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        lineView.addGestureRecognizer(tap)
        lineView.becomeFirstResponder()
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
        
        
        contentView.addSubview(bgView)
        
        bgView.centerXAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerXAnchor).isActive = true
        bgView.centerYAnchor.constraint(equalTo: contentView.layoutMarginsGuide.centerYAnchor).isActive = true
        bgView.widthAnchor.constraint(equalTo: contentView.layoutMarginsGuide.widthAnchor).isActive = true
        bgView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        
        bgView.addSubview(iconView)
        
        iconView.leadingAnchor.constraint(equalTo: bgView.layoutMarginsGuide.leadingAnchor).isActive = true
        iconView.centerYAnchor.constraint(equalTo: bgView.layoutMarginsGuide.centerYAnchor).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 21).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        
     
        bgView.addSubview(title)
        
        title.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant:20).isActive = true
        title.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: bgView.layoutMarginsGuide.trailingAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: bgView.heightAnchor).isActive = true
        
        
    }
    
}




