//
//  RNAppMetrica.swift
//  WillBe
//
//  Created by New on 22/07/2019.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation
import YandexMobileMetrica

@objc(RNAppMetrica)
class RNAppMetrica: NSObject {
  private var count = 23;
  
  @objc
  func constantsToExport() -> [AnyHashable: Any]! {
    return ["initCount": 20]
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true;
  }
  
  @objc
  func getCount(_ callback: RCTResponseSenderBlock) {
    callback([count])
  }
  
  @objc
  func decrement(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
    resolve("All good")
  }
  
  @objc
  func activateWithApiKey(_ key: String) {
    let configuration = YMMYandexMetricaConfiguration.init(apiKey: key)
    YMMYandexMetrica.activate(with: configuration!)
  }
  
  @objc
  func activateWithConfig(_ params: [String: Any]) {
    if params["ApiKey"] != nil {
      let configuration = YMMYandexMetricaConfiguration.init(apiKey: params["ApiKey"] as! String)
      
      if params["sessionTimeout"] != nil {
        configuration?.sessionTimeout = params["sessionTimeout"] as! UInt
      }
      
      if params["firstActicationAsUpdate"] != nil {
        configuration?.handleFirstActivationAsUpdate = true
      }
      
      if params["logs"] != nil {
        configuration?.logs = true
      }
      
      YMMYandexMetrica.activate(with: configuration!)
    }
    
  }
  
  @objc
  func reportEvent(_ message: String, parameters params: [NSObject: AnyObject]?) {
    if params != nil {
      YMMYandexMetrica.reportEvent(message, parameters: params, onFailure: nil)
    } else {
      YMMYandexMetrica.reportEvent(message, onFailure: nil)
    }
  }
}
