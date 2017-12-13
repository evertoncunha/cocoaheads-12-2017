//
//  HomeViewModel.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import Foundation

class HomeViewModel {
  
  enum AccountSource {
    case facebook
    case twitter
    case google
  }
  
  struct Account {
    let username: String
    let source: AccountSource
  }
  
  var worker = HomeWorker()
  
  var account: Account
  
  init(account: Account) {
    self.account = account
  }
  
  // MARK: - Routes
  
//  func routeToSomewhere(source: HomeViewController) {
//  }
  
}
