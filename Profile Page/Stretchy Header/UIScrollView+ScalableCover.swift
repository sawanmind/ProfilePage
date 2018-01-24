

import Foundation
import UIKit
import ObjectiveC


let kContentOffset = "contentOffset"

enum ImageType {
    case coverImage
    case profileImage
    case cell
}

open class ScalableCover: UIImageView {
     static var delegate: ProfileDelegate?
    
    static var isEditingMode: Bool = false
    fileprivate var maxHeight: CGFloat!
    fileprivate var scrollView: UIScrollView! {
        didSet {
            scrollView.addObserver(self, forKeyPath: kContentOffset, options: .new, context: nil)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func removeFromSuperview() {
        scrollView.removeObserver(self, forKeyPath: kContentOffset)
        super.removeFromSuperview()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if scrollView.contentOffset.y < 0 {
            let offset = -scrollView.contentOffset.y
            
            self.frame = CGRect(x: 0, y: -offset, width: scrollView.bounds.size.width, height: maxHeight + offset)
        } else {
            
            self.frame = CGRect(x: 0, y: 0, width: scrollView.bounds.size.width, height: maxHeight)
        }
    }
    
    open override func observeValue(forKeyPath _: String?, of _: Any?, change _: [NSKeyValueChangeKey: Any]?, context _: UnsafeMutableRawPointer?) {
        setNeedsLayout()
    }
}





extension UIScrollView {
    
  
    private struct AssociatedKeys {
        static var kScalableCover = "scalableCover"
    }
    
    private var scalableCover: ScalableCover? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.kScalableCover, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.kScalableCover) as? ScalableCover
        }
    }
    
    public func addScalableCover(with image: UIImage,name:String,email:String, maxHeight: CGFloat = 200) {
        let cover = ScalableCover(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: maxHeight))
        cover.backgroundColor = UIColor.clear
        cover.image = image
        cover.contentMode = .scaleAspectFill
        cover.maxHeight = maxHeight
        cover.scrollView = self
        cover.isUserInteractionEnabled = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = cover.bounds
        blurEffectView.isUserInteractionEnabled = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cover.addSubview(blurEffectView)
       
   
        profileImageView.image = #imageLiteral(resourceName: "coverImage")
        cover.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: cover.centerYAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive  = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100).isActive  = true
    

        _name.text = name
         cover.addSubview(_name)
        _name.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
        _name.topAnchor.constraint(equalTo: profileImageView.bottomAnchor,constant: 15).isActive = true
        _name.widthAnchor.constraint(equalTo: cover.widthAnchor,constant: -25).isActive  = true
        _name.heightAnchor.constraint(equalToConstant: 20).isActive  = true
        
        _email.text = email
        cover.addSubview(_email)
        _email.centerXAnchor.constraint(equalTo: cover.centerXAnchor).isActive = true
        _email.topAnchor.constraint(equalTo: _name.bottomAnchor,constant: 8).isActive = true
        _email.widthAnchor.constraint(equalTo: cover.widthAnchor,constant: -25).isActive  = true
        _email.heightAnchor.constraint(equalToConstant: 16).isActive  = true
        
        
        
        if ScalableCover.isEditingMode == true {
            _email.isHidden = true
            _name.isHidden = true
           
        } else {
            
            _email.isHidden = false
            _name.isHidden = false
        }
        
        
       
        cover_iconView.addTarget(self, action: #selector(didTapcoverImageCamera), for: .touchUpInside)
        cover.addSubview(cover_iconView)
        cover_iconView.trailingAnchor.constraint(equalTo: cover.trailingAnchor,constant: -20).isActive = true
        cover_iconView.bottomAnchor.constraint(equalTo: cover.bottomAnchor,constant: -20).isActive = true
        cover_iconView.widthAnchor.constraint(equalToConstant: 22).isActive  = true
        cover_iconView.heightAnchor.constraint(equalToConstant: 22).isActive  = true
        

        profile_iconView.addTarget(self, action: #selector(didTapprofileImageCamera), for: .touchUpInside)
        
        let profileImageView_blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let profileImageViewblurEffect = UIVisualEffectView(effect: profileImageView_blurEffect)
        profileImageViewblurEffect.frame = cover.bounds
        profileImageViewblurEffect.isUserInteractionEnabled = true
        profileImageViewblurEffect.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      
        if ScalableCover.isEditingMode == true {
            cover_iconView.isHidden = false
            profile_iconView.isHidden = false
            profileImageView.addSubview(profileImageViewblurEffect)
        } else {
            cover_iconView.isHidden = true
            profile_iconView.isHidden = true
            
        }
        
        
        profileImageView.addSubview(profile_iconView)
        profile_iconView.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        profile_iconView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profile_iconView.widthAnchor.constraint(equalToConstant: 22).isActive  = true
        profile_iconView.heightAnchor.constraint(equalToConstant: 22).isActive  = true
        
        
     
        addSubview(cover)
        sendSubview(toBack: cover)
        
        self.scalableCover = cover
        self.contentInset = UIEdgeInsetsMake(maxHeight, 0, 0, 0)
    }
    
    
    @objc fileprivate func didTapcoverImageCamera(sender:UIButton){
        ScalableCover.delegate?.didTapOnCell(cell: sender, type: .coverImage)
    }
    
    @objc fileprivate func didTapprofileImageCamera(sender:UIButton){
        ScalableCover.delegate?.didTapOnCell(cell: sender, type: .profileImage)
    }
    
    
   
    
    public func removeScalableCover() {
        scalableCover?.removeFromSuperview()
        scalableCover = nil
    }
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

let cover_iconView : UIButton = {
    let cover_iconView = UIButton()
    cover_iconView.isUserInteractionEnabled = true
    cover_iconView.imageView?.contentMode = .scaleAspectFit
    cover_iconView.translatesAutoresizingMaskIntoConstraints = false
    cover_iconView.tintColor = UIColor(white: 0.90, alpha: 1)
    cover_iconView.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
    return cover_iconView
}()


let profile_iconView : UIButton = {
    let profile_iconView = UIButton()
    profile_iconView.isUserInteractionEnabled = true
    profile_iconView.imageView?.contentMode = .scaleAspectFit
    profile_iconView.translatesAutoresizingMaskIntoConstraints = false
    profile_iconView.tintColor = UIColor(white: 0.90, alpha: 1)
    profile_iconView.setImage(#imageLiteral(resourceName: "camera"), for: .normal)
    return profile_iconView
}()










