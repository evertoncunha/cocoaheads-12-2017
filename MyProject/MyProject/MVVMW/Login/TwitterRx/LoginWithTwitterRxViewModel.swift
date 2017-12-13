//
//  LoginWithTwitterRxViewModel.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import Foundation
import RxSwift

class LoginWithTwitterRxViewModel {
  
  var worker = LoginWithTwitterWorker()
  
  var twitter = Variable<LoginWithTwitterWorker.TwitterAccount?>(nil)
  
  init() {
    
  }
  
  // MARK: - Routes
  
  func routeToHome(source: LoginWithTwitterRxViewController) {
    
    if let twitter = twitter.value { // <- .value
      
      let account = HomeViewModel.Account(username: twitter.username, source: .twitter)
      
      let viewModel = HomeViewModel(account: account)
      
      let homeViewController = HomeViewController(viewModel: viewModel)
      
      source.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
  }
}
