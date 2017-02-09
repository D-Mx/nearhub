//
//  RepoService.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/5/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RepositoryService {
    
    static func fetchAllRepositories(completion: @escaping (([Repository]?, Error?) -> Void)) {
        Alamofire.request(APIRouter.repositories).responseJSON { response in
            guard let JSON = response.result.value as? [[String:Any]],
                let repositories = Mapper<Repository>().mapArray(JSONArray: JSON)
                else {
                    completion(nil, response.result.error)
                    return
            }
            
            completion(repositories, nil)
        }
    }
}
