//
//  APIRouter.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/5/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    public static let baseURLPath: String = "https://api.github.com"
    //static let authenticationToken = "Basic YWNjXzQyYjMwOGFkNmZjYjdmNjo0NWEyNGI2N2E3YjExNWRiOTcxYTI3YjI1ZTQ4NjdiOQ"
    
    case repositories
    case repository(Repository)
    
    var method: HTTPMethod {
        switch self {
        case .repositories, .repository:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "/repositories"
        case .repository(let repo):
            return "/repos/\(repo.owner.name)/\(repo.name)"
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        default:
            return [:]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        
        let url = try APIRouter.baseURLPath.asURL()
        
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        //request.setValue(APIRouter.authenticationToken, forHTTPHeaderField: "Authorization")
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

