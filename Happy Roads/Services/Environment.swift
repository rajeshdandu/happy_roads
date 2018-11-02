//
//  Environment.swift
//  Happy Roads
//
//  Created by Saikumar on 29/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit

class Environment: NSObject {
    
    func getBaseURL() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "API Address") as? String ?? "")"
    }
    
    func getAPIKey() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "API Key") as? String ?? ""
    }
    
    func getAPIVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "API Version") as? String ?? ""
    }
    
    func getbaseCitrusURL() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Citrus URL") as? String ?? "")"
    }
    
    func getImageURL() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Image URL") as? String ?? "")"
    }
    
    func getImageUrlWithoutHandler() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Image URL without handler") as? String ?? "")"
    }
    
    func getImageUrlWithHandler() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Image URL with handler") as? String ?? "")"
    }
    
    func getImageUploadUrl() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Image upload URL") as? String ?? "")"
    }
    
    func getImageWeatherUrl() -> String {
        return "http://\(Bundle.main.object(forInfoDictionaryKey: "Image wether URL") as? String ?? "")"
    }
    
    
}
