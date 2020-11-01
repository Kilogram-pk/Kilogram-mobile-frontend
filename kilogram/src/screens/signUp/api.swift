//
//  api.swift
//  kilogram
//
//  Created by Apple on 01/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Networking

let baseUrl: String = "https://hasnat.tk/api"
let networking = Networking(baseURL: baseUrl)

func callApi(url: String, params: [String: Any], handler: @escaping (Int) -> Void){
    networking.post(url, parameters: params) { result in
          switch result {
          case .success (let response):
            handler.self(response.statusCode)
          case .failure(let response):
              handler.self(response.statusCode)
          }
      }
}
