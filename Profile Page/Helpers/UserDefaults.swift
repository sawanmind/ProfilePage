//
//  UserDefaults.swift
//  Project Starter
//
//  Created by iOS Developer on 1/3/18.
//  Copyright © 2018 sawanmind. All rights reserved.
//

import UIKit




extension UserDefaults {
    
    static func getUserToken() -> String? {
        
        return UserDefaults.standard.value(forKey: "ptoken") as? String
    }
    
    static func saveUserToken(token:String) {
        UserDefaults.standard.set(token, forKey: "ptoken")
        UserDefaults.standard.synchronize()
    }
    
    static func removeUserToken() {
        UserDefaults.standard.removeObject(forKey: "ptoken")
        UserDefaults.standard.synchronize()
    }
    
    
    static func getrequestID() -> String? {
        
        return UserDefaults.standard.value(forKey: "requestid") as? String
    }
    
    static func saverequestID(id:String) {
        UserDefaults.standard.set(id, forKey: "requestid")
        UserDefaults.standard.synchronize()
    }
    
    static func removerequestID() {
        UserDefaults.standard.removeObject(forKey: "requestid")
        UserDefaults.standard.synchronize()
    }
    
    
    static func getUserMobileNumber() -> String? {
        
        return UserDefaults.standard.value(forKey: "mobileno") as? String
    }
    
    static func saveUserMobileNumber(MobileNumber:String) {
        UserDefaults.standard.set(MobileNumber, forKey: "mobileno")
        UserDefaults.standard.synchronize()
    }
    
    
    
    
    static func removeUserMobileNumber() {
        UserDefaults.standard.removeObject(forKey: "mobileno")
        UserDefaults.standard.synchronize()
    }
    
    
    static func getUserName() -> String? {
        
        return UserDefaults.standard.value(forKey: "name") as? String
    }
    
    static func saveUserName(Name:String) {
        UserDefaults.standard.set(Name, forKey: "name")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func removeUserName() {
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func getDeviceToken() -> Data? {
        
        return UserDefaults.standard.value(forKey: "DeviceToken") as? Data
    }
    
    static func saveDeviceToken(token:Data) {
        UserDefaults.standard.set(token, forKey: "DeviceToken")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func removeDeviceToken() {
        UserDefaults.standard.removeObject(forKey: "DeviceToken")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func getVerificationID() -> String? {
        
        return UserDefaults.standard.value(forKey: "Verification ID") as? String
    }
    
    static func saveVerificationID(VerificationID:String) {
        UserDefaults.standard.set(VerificationID, forKey: "Verification ID")
        UserDefaults.standard.synchronize()
    }
    
    
    
    static func removeVerificationID() {
        UserDefaults.standard.removeObject(forKey: "Verification ID")
        UserDefaults.standard.synchronize()
    }
}


