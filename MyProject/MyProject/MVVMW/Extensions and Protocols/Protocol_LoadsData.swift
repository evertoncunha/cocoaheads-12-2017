//
//  Protocol_LoadsData.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright © 2017 EPC. All rights reserved.
//

import UIKit

protocol LoadsData {
  
  associatedtype T
  
  var viewsToHide: [UIView?]? { get }
  
  var viewForSpinner: UIView? { get }
  
  func willLoadData()
  
  func handle(error: Error?)
  
  func handle(data: T)
  
  func loadedData() throws -> T
  
  func loadData()
  
}

extension LoadsData where Self: NSObject {
  
  var usesAppSpinner: Bool { return false }
  
  func willLoadData() {
    
  }
  
  func loadData() {
    
    _ = viewsToHide?.map { $0?.isHidden = true }
    
    viewForSpinner?.spinner.startAnimating() // view.spinner is a UIView Extension
    
    willLoadData()
    
    DispatchQueue.global(qos: .background).async { [weak self] in
      
      var data: Any?
      
      var error: Error? = nil
      
      guard let myself = self else { return }
      
      do {
        data = try myself.loadedData()
      } catch let err {
        error = err
      }
      
      DispatchQueue.main.async { [weak self, data, error] in
        
        guard let myself = self else {
          return
        }
        
        _ = myself.viewsToHide?.map { $0?.isHidden = false }
        
        myself.viewForSpinner?.spinner.stopAnimating()
        
        if error != nil {
          myself.handle(error: error!)
        } else {
          if let d = data as? T {
            myself.handle(data: d)
          } else {
            myself.handle(error: NSError(domain: "Unknown error", code: -1, userInfo: nil))
          }
          
        }
      }
    }
  }
}
