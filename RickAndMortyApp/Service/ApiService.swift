//
//  ApiService.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation
import Alamofire

final class ApiService {
  static let shared = ApiService()
  private init() {
    
  }
  enum ApiServiceError: Error {
    case noData
    case urlNil
    case decodeError
  }
  public func execute<T: Codable>(_ request: ApiRequest,
                                  expecting type: T.Type,
                                  completion: @escaping (Result<T,Error>) -> Void ){
    
    guard let url = request.url else { return completion(.failure(ApiServiceError.urlNil)) }
    
    AF.request(url, method:.get).responseDecodable(of: type.self){response in
      switch response.result {
      case.failure(_):
        completion(.failure(ApiServiceError.noData))
      case.success(let data):
        completion(.success(data))
      }
    }
  }
}

