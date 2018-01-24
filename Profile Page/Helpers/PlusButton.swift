//
//  PlusMinus.swift
//  Live Vaastu
//
//  Created by Sawkan Team on 11/24/17.
//  Copyright © 2017 Sawkan Team. All rights reserved.
//


import UIKit

class PlusButton: UIButton {
    
    var  fillColor:UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        
        drawSign()
        
    }
    
    
    func drawSign() {
        drawHorizontalDash()
        drawVerticalDash()
    }
    
    
    func drawHorizontalDash(){
        let plusHeight : CGFloat = 3.0
        
        let plusWidth : CGFloat = min(bounds.width, bounds.height) * 0.6
        let plusPath = UIBezierPath()
        
        
        plusPath.lineWidth  = plusHeight
        plusPath.move(to: CGPoint(x:bounds.width/2 - plusWidth/2, y: bounds.height/2))
        plusPath.addLine(to: CGPoint(x:bounds.width/2 + plusWidth/2, y: bounds.height/2))
        UIColor.black.setStroke()
        plusPath.stroke()
        
    }
    
    
    
    func drawVerticalDash(){
        
        let plusHeight : CGFloat = 3.0
        
        let plusWidth : CGFloat = min(bounds.width, bounds.height) * 0.6
        let plusPath = UIBezierPath()
        
        
        plusPath.lineWidth  = plusHeight
        plusPath.move(to: CGPoint(x:bounds.width/2  + 0.5, y: bounds.height/2 - plusWidth/2 + 0.5))
        plusPath.addLine(to: CGPoint(x:bounds.width/2 + 0.5, y: bounds.height/2 + plusWidth/2 + 0.5))
        UIColor.black.setStroke()
        plusPath.stroke()
    }
    
    
}


