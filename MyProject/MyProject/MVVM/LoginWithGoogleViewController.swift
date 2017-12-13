//
//  LoginWithGoogleViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit

class LoginWithGoogleViewController: UIViewController
{
  
  // MARK: - Properties
  
  var viewModel: LoginWithGoogleViewModel
  
  // MARK: - Object lifecycle
  
  init(viewModel: LoginWithGoogleViewModel) {
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
  }
  
  @objc func tappedLogin() {
    /*
    Google.request(email, password, callback: { [weak self] (response, error) in
     if let error = error {
       // ...
     }
     else if let response = response {
       // ...
     }
     else {
       // ...
     }
    })
   */
  }
  
  // MARK: -
  
}

