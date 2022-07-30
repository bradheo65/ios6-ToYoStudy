//
//  ViewController.swift
//  NSCacheDemo
//
//  Created by 이원빈 on 2022/07/24.
//

import UIKit


class ViewController: UIViewController {
    
    lazy var mainView = MainView(frame: view.bounds)
    
    
    
    override func loadView() {
        super.loadView()
        view.addSubview(mainView)
        mainView.backgroundColor = .systemBackground
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.upperButton.addTarget(self, action: #selector(retrieveFirstImage), for: .touchUpInside)
        mainView.lowerButton.addTarget(self, action: #selector(retrieveSecondImage), for: .touchUpInside)
        mainView.resetButton.addTarget(self, action: #selector(resetImage), for: .touchUpInside)
        mainView.clearCacheButton.addTarget(self, action: #selector(clearCache), for: .touchUpInside)
        
    }
    
    @objc func retrieveFirstImage() {
        DispatchQueue.main.async {
            self.mainView.activitiIndicator.startAnimating()
            self.mainView.upperImageView.setImageUrlInNSCache("https://wallpaperaccess.com/download/europe-4k-1369012") {
                self.mainView.activitiIndicator.stopAnimating()
            }
        }
    }
//    @objc func retrieveFirstImage() {
//        DispatchQueue.main.async {
//
//            self.mainView.upperImageView.setImageUrlInURLCache(URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")!)
//        }
//    }
    
    @objc func retrieveSecondImage() {
        DispatchQueue.main.async {
            self.mainView.activitiIndicator.startAnimating()
            self.mainView.lowerImageView.setImageUrlInNSCache("https://wallpaperaccess.com/download/europe-4k-1318341") {
                self.mainView.activitiIndicator.stopAnimating()
            }
        }
    }
    
//    @objc func retrieveSecondImage() {
//        DispatchQueue.main.async {
//
//            self.mainView.lowerImageView.setImageUrlInURLCache(URL(string: "https://wallpaperaccess.com/download/europe-4k-1318341")!)
//        }
//    }
    
    @objc func resetImage() {
        mainView.upperImageView.image = nil
        mainView.lowerImageView.image = nil
    }
    
    @objc func clearCache() {
        ImageCacheManager.shared.removeAllObjects()
    }
//
//    @objc func clearCache() {
//        ImageURLCacheManager.cache.removeAllCachedResponses()
//    }
}

class ImageCacheManager {
    static let shared = NSCache<NSString, UIImage>()
    private init() {}
}

class ImageURLCacheManager {
    static let cache = URLCache.shared
    private init() {}
}

extension UIImageView {
    //MARK: - NSCache
    func setImageUrlInNSCache(_ url: String, completion: (() -> Void)?) {
        DispatchQueue.global(qos: .background).async {
            let cachedKey = NSString(string: url)
            if let cachedImage = ImageCacheManager.shared.object(forKey: cachedKey) {
                print("캐시된 데이터가 있습니다.")
                DispatchQueue.main.async {
                    self.image = cachedImage
                    if let completion = completion { // 타이밍
                        completion()
                    }
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
                        
                        ImageCacheManager.shared.setObject(image, forKey: cachedKey)
                        print("새로운 이미지를 받아왔습니다.")
                        self?.image = image
                        if let completion = completion { // 타이밍
                            completion()
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    //MARK: - URLCache
    func setImageUrlInURLCache(_ imageURL: URL) {
        let cache = ImageURLCacheManager.cache
        DispatchQueue.global(qos: .background).async {
            let request = URLRequest(url: imageURL)
            
            if cache.cachedResponse(for: request) != nil {
                print("캐시된 데이터가 있습니다.")
                self.loadImageFromCache(imageURL: imageURL)
            } else {
                print("새로운 이미지를 받아왔습니다.")
                self.downloadImage(imageURL: imageURL)
            }
        }
    }
    
    func downloadImage(imageURL: URL) {
        let request = URLRequest(url: imageURL)
        DispatchQueue.global().async {
            let dataTask = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let data = data {
                    let cachedData = CachedURLResponse(response: response!, data: data)
                    ImageURLCacheManager.cache.storeCachedResponse(cachedData, for: request) // 캐시저장
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data) // 이미지 표시
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func loadImageFromCache(imageURL: URL) {
        let request = URLRequest(url: imageURL)
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = ImageURLCacheManager.cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}


// NSCache 와  URLCache 비교결과
/*
 --NSCache--
 한번 다운로드 받아놓으면 그 다음 캐시된 데이터를 불러올 때는 속도가 빠르다.
 앱을 껏다 키면 캐시정보가 사라짐. ()
 ==URLCache==
 한번 다운로드 받아놓으면 캐시된 데이터 불러올 때 속도 보통이다. (NSCache의 데이터로딩 속도가 더 빠름)
 앱을 껏다 켜도 캐시정보가 유지되어 있다. (on-Disk 방식으로 저장? )
*/
