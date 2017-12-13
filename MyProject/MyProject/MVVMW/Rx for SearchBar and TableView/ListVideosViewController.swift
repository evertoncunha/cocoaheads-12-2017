//
//  ListVideosViewController.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ListVideosViewController: UIViewController
{
  
  // MARK: - Properties
  
  var viewModel: ListVideosViewModel
  
  let searchBar = UISearchBar()
  
  let tableView = UITableView()
  
  let disposeBag = DisposeBag()
  
  // MARK: - Object lifecycle
  
  init(viewModel: ListVideosViewModel) {
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
    
    searchBar.rx.text
      .orEmpty // Make it non-optional
      .debounce(0.3, scheduler: MainScheduler.instance) // Wait 0.5 for changes.
      .distinctUntilChanged() // ignore same values
      .subscribe(onNext: { (text) in
        // ...
      }).disposed(by: disposeBag)
    
    
    // pod 'RxDataSources'
    viewModel.videos.asObservable().bind(to: tableView.rx.items(cellIdentifier: "cell")) { (index, video, cell) in
      cell.textLabel?.text = video.title
      }.disposed(by: disposeBag)
    
    
    tableView.rx.itemSelected.asDriver().drive(onNext: { (indexPath) in
      // ...
    }).disposed(by: disposeBag)
    
  }
  
  func readViewModel() {
    
  }
  
  // MARK: -
  
}

