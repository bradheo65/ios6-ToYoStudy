//
//  ImageCacheManager.swift
//  Cache_Sample
//
//  Created by Derrick kim on 2022/07/22.
//

import UIKit

class ImageCacheManager {
    static var shared = NSCache<NSString, UIImage>()
    private init() {}
}

extension UIImageView {
    func setImageUrl(_ url: String) {
        DispatchQueue.global(qos: .background).async {

            /// cache할 객체의 key값을 string으로 생성
            let cachedKey = NSString(string: url)

            /// cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
            
            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
                print("캐시된 데이터 발견 : \(cachedImage)")
                DispatchQueue.main.async {
                    self.image = cachedImage
                }
                return
            }

            guard let url = URL(string: url) else { return }
            URLSession.shared.dataTask(with: url) { (data, result, error) in
                guard error == nil else {
                    DispatchQueue.main.async { [weak self] in
                        self?.image = UIImage()
                    }
                    return
                }

                DispatchQueue.main.async { [weak self] in
                    if let data = data, let image = UIImage(data: data) {
                        print("캐시 중 : \(image)")
                        /// 캐싱
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self?.image = image
                    }
                }
            }.resume()
        }
    }
}
