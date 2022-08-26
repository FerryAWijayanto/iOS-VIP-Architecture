//
//  Extentions+UIImageView.swift
//  VIP Arch
//
//  Created by Ferry Adi Wijayanto on 17/08/22.
//

import Foundation
import UIKit

fileprivate let cache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func load(image name: String) {
        let cacheKey = NSString(string: name)
        
        if let imageCache = cache.object(forKey: cacheKey)  {
            self.image = imageCache
            return
        }
        guard let url = URL(string: name) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                return
            }
            
            guard let image = UIImage(data: data) else { return }
            cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }
}
