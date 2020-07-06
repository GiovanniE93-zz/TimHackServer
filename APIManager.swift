//
//  APIManager.swift
//  TimHackServer
//
//  Created by Giovanni Erpete on 04/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//

import Foundation

var token : String = "oC4zzjjuy0dUl5KPrkb7GfV4UfGVy4K6"

public class APIManager : NSObject, URLSessionDelegate {
    
    static let singleton = APIManager()
    
    static func getSingleton() -> APIManager {
        return .singleton
    }
    
    private override init() {
        super.init()
    }
    
    var airQualityData : AirQualityData?
    
    public func getData(latitude: Double, longitude: Double) {
        
        var request = URLRequest(url: URL(string: "https://hackathon.tim.it/airquality/latest?latitude=\(latitude)&longitude=\(longitude)")!)
        request.addValue(token, forHTTPHeaderField: "apikey")
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: .main) { (response, data, error) in
            
            if let err = error {
                print("[getData] error: \(err)")
            }
            
            print("[getData] data: \(data! as NSData)")
            self.readJSON(data: data!)
        }
        
    }
    
    func readJSON (data: Data) {
        
        do {
            let decoder = JSONDecoder()
            let pollutionDate = try decoder.decode(AirQualityData.self, from: data)
            
            airQualityData = pollutionDate
            print("[readJSON] airQualityData: \(airQualityData!)")
            
        }catch {
            print("[ReadJSON] error! \(error)")
        }
        
    }
    
}
