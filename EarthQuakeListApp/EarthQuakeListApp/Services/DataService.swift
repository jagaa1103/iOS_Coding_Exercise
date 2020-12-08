//
//  DataService.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation


class DataService {
    
    func fetchEarthQuakeData(completion: @escaping ([Feature]?) -> Void) {
        if NetworkService.shared.isConnected {
            fromServer() { result in
                completion(result)
            }
        } else {
            let result = fromCache()
            completion(result)
        }
    }
    
    func fromServer(completion: @escaping ([Feature]?) -> Void) {
        let urlString = Constants.getFormattedURL()
        print(urlString)
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
               if let err = error {
                   print(err.localizedDescription)
                   completion(nil)
                   return
               }
               if let d = data {
                   self.saveDataInUserDefaults(data: d)
                   let features = self.parseData(data: d)
                   completion(features)
               }else {
                   print("!!! No data fetched !!!")
                   completion(nil)
               }
           }
           session.resume()
    }
    
    func fromCache() -> [Feature]? {
        if let data = getDataFromUserDefaults() {
            return parseData(data: data)
        }
        return nil
    }
    
    
    func parseData(data: Data) -> [Feature]? {
        do {
            let decodedData = try JSONDecoder().decode(Response.self, from: data)
            return decodedData.features
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    func saveDataInUserDefaults(data: Data) {
        UserDefaults.standard.set(data, forKey: "lastData")
    }
    
    func getDataFromUserDefaults() -> Data? {
        if let data = UserDefaults.standard.object(forKey: "lastData") as? Data {
            return data
        }
        return nil
    }
}
