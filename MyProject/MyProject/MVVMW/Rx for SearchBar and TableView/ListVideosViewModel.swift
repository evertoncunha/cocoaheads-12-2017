//
//  ListVideosViewModel.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import Foundation
import RxSwift

class ListVideosViewModel {
  
  var worker = ListVideosWorker()
  
  var videos = Variable<[ListVideosWorker.Video]>([])
  
  init() {
    
  }
  
  // MARK: - Routes
  
//  func routeToSomewhere(source: ListVideosViewController) {
//  }
  
}
