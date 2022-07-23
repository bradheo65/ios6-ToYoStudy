//
//  ViewController.swift
//  Cache&NSCache
//
//  Created by 허건 on 2022/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    let firstImageURL = "https://wallpaperaccess.com/download/europe-4k-1369012"
    let secondImageURL = "https://wallpaperaccess.com/download/europe-4k-1318341"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fetchFirstImageButton(_ sender: UIButton) {
        // loadNSCacheFirstImage()
        loadURLCacheFirstImage()
    }
    @IBAction func fetchSecondImageButton(_ sender: UIButton) {
        // loadNSCacheSecondImage()
        loadURLCacheSecondImage()
    }
    
    @IBAction func allImageClearButton(_ sender: UIButton) {
        firstImageView.image = nil
        secondImageView.image = nil
    }
    
    @IBAction func cacheClearButton(_ sender: UIButton) {
        /// NSCache remove
        ImageCacheManager.shared.removeAllObjects()
        
        /// URLCache remove
        cache.removeAllCachedResponses()  // 전체 삭제
        // cache.removeCachedResponse(for: <#T##URLRequest#>)  // 일부분 삭제
    }
    
    func loadNSCacheFirstImage() {
        /// NSCache
        firstImageView.setImageUrl(url: firstImageURL)
    }
    
    func loadNSCacheSecondImage() {
        /// NSCache
        secondImageView.setImageUrl(url: secondImageURL)
    }
    
    func loadURLCacheFirstImage() {
        /// URLCache
        let url = URL(string: firstImageURL)
        
        getImage(imageURL: url!, choiceImageView: firstImageView)
    }
    
    func loadURLCacheSecondImage() {
        /// URLCache
        let url = URL(string: secondImageURL)
        getImage(imageURL: url!, choiceImageView: secondImageView)
    }
    
    let cache = URLCache.shared
    
    func getImage(imageURL: URL, choiceImageView: UIImageView) {
        let request = URLRequest(url: imageURL)
        print("Get URLCache images....")
        
        if (self.cache.cachedResponse(for: request) != nil) {
            return self.loadImageFromCache(imageURL: imageURL, choiceImageView: choiceImageView)
        } else {
            return self.downloadImage(imageURL: imageURL, choiceImageView: choiceImageView)
        }
    }
    
    func downloadImage(imageURL: URL, choiceImageView: UIImageView) {
        let request = URLRequest(url: imageURL)

        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: imageURL) { data, reponse, _ in
                if let data = data {
                    let cachedData = CachedURLResponse(response: reponse!, data: data)
                    self.cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        choiceImageView.image = UIImage(data: data)
                    }
                }
                print("success!!")
            }
            dataTask.resume()
        }
    }
    
    func loadImageFromCache(imageURL: URL, choiceImageView: UIImageView) {
        let request = URLRequest(url: imageURL)

        DispatchQueue.global(qos: .userInitiated).async {
            if let data = self.cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    choiceImageView.image = image
                }
                print("success!!")
            }
        }
    }
}

// 이미지 캐시 구현
class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}

extension UIImageView {
    func setImageUrl(url: String) {
        print("Get NSCache images....")

        DispatchQueue.main.async {
            
            /// cache할 객체의 key값을 string으로 생성
            let cachedKey = NSString(string: url)
            
            /// cache된 이미지가 존재하면 그 이미지를 사용 (API 호출안하는 형태)
            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
                self.image = cachedImage
                print("success!!")
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
                        
                        /// 캐싱
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        self?.image = image
                        print("success!!")
                    }
                }
            }.resume()
        }
    }
}

