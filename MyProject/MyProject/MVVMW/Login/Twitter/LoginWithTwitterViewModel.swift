//
//  LoginWithTwitterViewModel.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit

class LoginWithTwitterViewModel {
  
  var worker = LoginWithTwitterWorker()
  
  var twitter: LoginWithTwitterWorker.TwitterAccount?
  
  init() {
    
  }
  
  // MARK: - Routes
  
  func routeToHome(source: LoginWithTwitterViewController) {
    
    if let twitter = twitter {
      
      let account = HomeViewModel.Account(username: twitter.username, source: .twitter)
      
      let viewModel = HomeViewModel(account: account)
      
      let homeViewController = HomeViewController(viewModel: viewModel)
      
      source.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
  }
  
}
