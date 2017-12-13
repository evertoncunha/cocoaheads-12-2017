//
//  LoginWithTwitterViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit

class LoginWithTwitterViewController: UIViewController
{
  
  // MARK: - Properties
  
  var viewModel: LoginWithTwitterViewModel
  
  // MARK: - Object lifecycle
  
  init(viewModel: LoginWithTwitterViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    fatalError("\(#file) \(#function) not implemented")
  }
  
  // MARK: - View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    createSubviews()
    createConstraints()
    createBinds()
    readViewModel()
  }
  
  // MARK: - Setup functions
  
  func createSubviews() {
    
  }
  
  func createConstraints() {
    
  }
  
  func createBinds() {
    // Rx or KVO
  }
  
  func readViewModel() {
    
  }
  
  // MARK: - Actions
  
  @objc func tappedLogin() {
    
    DispatchQueue.global(qos: .background).async {
      
      do {
        
        let result = try self.viewModel.worker.loginOnTwitter(username: "username", password: "password")
        
        self.viewModel.twitter = result
        
        DispatchQueue.main.async {
          self.viewModel.routeToHome(source: self)
        }
        
      }
      catch {
        // ...
      }
    }
    
  }
}

