//
//  AppDelegateExtension.swift
//  Project Starter
//
//  Created by Developer on 1/6/18.
//  Copyright © 2018 sawanmind. All rights reserved.
//

import UIKit

extension  UIResponder {
   
    public func setupNavigationApperance() {
        let navApperance = UINavigationBar.appearance()
        navApperance.tintColor = UIColor.white
        navApperance.shadowImage = UIImage()
        navApperance.isTranslucent = false
        navApperance.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.black]
        UIApplication.shared.statusBarStyle = .lightContent
    }
}


extension UIViewController {
    public func didTapShare(_ sender: UIBarButtonItem){
        let activityViewController = UIActivityViewController(activityItems: [], applicationActivities: nil)
        activityViewController.popoverPresentationController?.barButtonItem = sender
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

func imageWithGradient(img:UIImage!) -> UIImage {
    
    UIGraphicsBeginImageContext(img.size)
    let context = UIGraphicsGetCurrentContext()
    
    img.draw(at: CGPoint(x: 0, y: 0))
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let locations:[CGFloat] = [0.0, 1.0]
    
    let bottom = UIColor.black.withAlphaComponent(1).cgColor
    let top = UIColor.black.withAlphaComponent(0).cgColor
    
    let colors = [top, bottom] as CFArray
    
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: locations)
    
    let startPoint = CGPoint(x: img.size.width/2, y:  img.size.height/3)
    let endPoint = CGPoint(x: img.size.width/2, y: img.size.height)
    
    context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
    return image!
}


extension UIView {
    
    func applyGradient(topColor:UIColor, bottomColor:UIColor, startPoint:CGPoint, endPoint:CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame.size = self.frame.size
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors =
            [topColor.cgColor,bottomColor.withAlphaComponent(1).cgColor]
        
        self.layer.addSublayer(gradientLayer)
    }
    
    
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

func applyGaussianBlur(image:UIImage,imageView:UIImageView) -> UIImage {
    var currentImage: UIImage = UIImage()
    var context: CIContext = CIContext()
    var currentFilter: CIFilter = CIFilter()
    var ProcessedImage: UIImage = UIImage()
    
    
    context = CIContext()
    currentFilter = CIFilter(name: "CIGaussianBlur")!
    currentImage = image
    
    let beginImage = CIImage(image: currentImage)
    currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
    imageView.image?.draw(at: .zero, blendMode: .normal, alpha: 0.5)
    
    
    let inputKeys = currentFilter.inputKeys
    
    if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(1, forKey: kCIInputIntensityKey) }
    if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(1 * 10, forKey: kCIInputRadiusKey) }
    if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(1 * 10, forKey: kCIInputScaleKey) }
    if inputKeys.contains(kCIInputCenterKey) { currentFilter.setValue(CIVector(x: currentImage.size.width , y: currentImage.size.height), forKey: kCIInputCenterKey) }
    
    if let cgimg = context.createCGImage(currentFilter.outputImage!, from: currentFilter.outputImage!.extent) {
        let processedImage = UIImage(cgImage: cgimg)
        ProcessedImage = processedImage
    }
    return ProcessedImage
}
