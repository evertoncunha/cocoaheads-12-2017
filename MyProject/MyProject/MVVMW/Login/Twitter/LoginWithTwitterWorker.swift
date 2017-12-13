//
//  LoginWithTwitterWorker.swift
//  MyProject
//
//  Created by Everton Cunha on 10/12/17.
//  Copyright (c) 2017 EPC. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation
import Photos

class LoginWithTwitterWorker: NSObject
{
  
  struct TwitterAccount {
    let username: String
  }
  
  func loginOnTwitter(username: String, password: String) throws -> TwitterAccount {
    // ...
    throw NSError(domain: "not implemented", code: 0, userInfo: nil)
  }
}
