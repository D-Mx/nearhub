//
//  URLSessionExtension.swift
//  nearhub
//
//  Created by Anselmo Torres on 2/4/17.
//  Copyright © 2017 Anselmo Torres. All rights reserved.
//

import Alamofire
import UIKit

extension UIImageView {
    
    func downloadedFrom(_ link: String, contentMode mode: UIViewContentMode = .scaleAspectFit, completion: @escaping ((UIImage?) -> Void)) {
        Alamofire.request(link).responseData { response in
            
            var image: UIImage?
            
            if let data = response.result.value, let responseImage = UIImage(data: data) {
                image = responseImage
                self.image = responseImage
            }
            
            completion(image)
        }
    }
}


