//
//  APIManager.swift
//  DirectoryApp
//
//  Created by Pradip on 21/10/22.
//

import Foundation

final class NetworkManager {

 // var employees: [Employee] = []
  private let domainUrlString = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
  
  func fetchEmployeeRecords(completionHandler: @escaping ([Employee]) -> Void) {
    let url = URL(string: domainUrlString + "people")!

    let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
      if let error = error {
        print("Error with fetching employee records: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
          print("Error with the response, unexpected status code: \(String(describing: response))")
        return
      }
        
//        do {
//            let jsonData = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [Any]
//
//            print(jsonData)
//
//
//        } catch {
//            print("An error occurred")
//        }
        
      

      if let data = data,
        let records = try? JSONDecoder().decode([Employee].self, from: data) {
          print(records)
        completionHandler(records)
      }else{
          print("error with json")
      }
   })
    task.resume()
  }

 func fetchRoomOccupancy(completionHandler: @escaping ([Room]) -> Void) {
    let url = URL(string: domainUrlString + "rooms")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if let error = error {
          print("Error with fetching room records: \(error)")
        return
      }
      
      guard let httpResponse = response as? HTTPURLResponse,
        (200...299).contains(httpResponse.statusCode) else {
          print("Unexpected response status code: \(String(describing: response))")
        return
      }

      if let data = data,
        let roomRecords = try? JSONDecoder().decode([Room].self, from: data) {
          completionHandler(roomRecords)
      }
    }
    task.resume()
  }
}
