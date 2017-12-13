//
//  LoginWithTwitterRxPOPViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension LoginWithTwitterRxPOPViewController: LoadsData {
  
  var viewsToHide: [UIView?]? { return [loginButton] }
  
  var viewForSpinner: UIView? { return view }
  
  func willLoadData() {
    view.spinner.color = UIColor.gray // view.spinner is a UIView Extension
  }
  
  func handle(error: Error?) {
    // handle error
  }
  
  func handle(data: LoginWithTwitterWorker.TwitterAccount) {
    // handle success
    self.viewModel.twitter.value = data
  }
  
  func loadedData() throws -> LoginWithTwitterWorker.TwitterAccount {
    sleep(3)
    let result = try self.viewModel.worker.loginOnTwitter(username: "username", password: "password")
    return result
  }
}

class LoginWithTwitterRxPOPViewController: UIViewController
{
  // MARK: - Properties
  
  var viewModel: LoginWithTwitterRxPOPViewModel
  
  let loginButton = UIButton(type: .custom)
  
  let disposeBag = DisposeBag() // IMPORTANTE!
  
  // MARK: - Object lifecycle
  
  init(viewModel: LoginWithTwitterRxPOPViewModel) {
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
      
      self?.loadData()
      
    }).disposed(by: disposeBag)
    
    
    viewModel.twitter.asDriver().drive(onNext: { [weak self] (val) in
      
      if val != nil, let _self = self {
        _self.viewModel.routeToHome(source: _self)
      }
      
    }).disposed(by: disposeBag)
  }
  
  func readViewModel() {
    
  }
  
}
