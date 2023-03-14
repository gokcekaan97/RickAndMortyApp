//
//  ApiRequest.swift
//  RickAndMortyApp
//
//  Created by kaan gokcek on 13.03.2023.
//

import Foundation

final class ApiRequest {
  private struct Constants {
     static let baseUrl = "https://rickandmortyapi.com/api"
  }
  private let endpoint: ApiEndpoint
  static let characterListRequest = ApiRequest(endpoint: .character)
  private let queryParameters: [URLQueryItem]
  private var urlString: String{
    var string = Constants.baseUrl
    string += endpoint.rawValue
    if !queryParameters.isEmpty{
      string += "/?"
      let parameters = queryParameters.compactMap({
        guard let value = $0.value else { return nil }
        return "\($0.name)=\(value)"
      }).joined(separator: "&")
    string += parameters
    }
    return string
  }
  public var url: URL?{
    return URL(string: urlString)
  }
  public init(endpoint: ApiEndpoint, queryParameters: [URLQueryItem] = []) {
    self.endpoint = endpoint
    self.queryParameters = queryParameters
  }
}
