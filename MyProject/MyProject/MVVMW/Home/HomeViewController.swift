//
//  HomeViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
  
  // MARK: - Properties
  
  var viewModel: HomeViewModel
  
  // MARK: - Object lifecycle
  
  init(viewModel: HomeViewModel) {
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
    
  }
  
  func readViewModel() {
    
  }
  
  // MARK: -
  
}

