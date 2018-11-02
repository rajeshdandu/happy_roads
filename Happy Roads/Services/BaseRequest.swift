//
//  BaseRequest.swift
//  Happy Roads
//
//  Created by Saikumar on 29/10/18.
//  Copyright © 2018 Saikumar. All rights reserved.
//

import UIKit
import Alamofire

class BaseRequest: Environment {

    func JSONPostService(requestType: RequestType, parameters: [String:Any], onSucess: @escaping (Any)->(), onFailure: @escaping (String)->()) {
        
        let requestURL = getBaseURL()+requestType.rawValue+"?"+"apiKey="+getAPIKey()+"&apiVer="+getAPIVersion()
        print("URL for \(requestType.rawValue): \(requestURL)")
        
        Alamofire.request(requestURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData { (response) in
            
            if let data = response.data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print("Response for \(requestType.rawValue): \(json)")
                    onSucess(json)
                } catch {
                    onFailure(error.localizedDescription)
                }
            } else {
                onFailure("Nill Data from : \(requestType.rawValue)")
            }
        }
    }
    
}
