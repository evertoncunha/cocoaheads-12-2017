//
//  LoginWithTwitterRxViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginWithTwitterRxViewController: UIViewController
{
  
  // MARK: - Properties
  
  var viewModel: LoginWithTwitterRxViewModel
  
  let loginButton = UIButton(type: .custom)
  
  let disposeBag = DisposeBag() // IMPORTANTE!
  
  // MARK: - Object lifecycle
  
  init(viewModel: LoginWithTwitterRxViewModel) {
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
    
    loginButton.rx.tap.asDriver().drive(onNext: { [weak self] (_) in
      
      self?.tappedLogin()
      
    }).disposed(by: disposeBag)
    
    
    viewModel.twitter.asDriver().drive(onNext: { [weak self] (val) in
      
      if val != nil, let _self = self {
        _self.viewModel.routeToHome(source: _self)
      }
      
    }).disposed(by: disposeBag)
  }
  
  func readViewModel() {
    
  }
  
  // MARK: -
  
  func tappedLogin() {
    DispatchQueue.global(qos: .background).async {
      
      do {
        let result = try self.viewModel.worker.loginOnTwitter(username: "username", password: "password")
        self.viewModel.twitter.value = result
      }
      catch {
        // ...
      }
    }
  }
}

