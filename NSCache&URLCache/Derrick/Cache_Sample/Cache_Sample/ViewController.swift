//
//  ViewController.swift
//  Cache_Sample
//
//  Created by Derrick kim on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "pencil")
        return imageView
    }()
    
    private let fitstImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("첫 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .systemGreen
        
        return button
    }()
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "pencil")
        return imageView
    }()
    
    
    private let secondImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("두 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .systemPink
        
        return button
    }()
    
    private let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let imageClearButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("이미지 초기화", for: .normal)
        button.backgroundColor = .blue
        
        return button
    }()
    
    private let clearCacheButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("캐시 비우기", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    private let urlArray: [String] = [
        "europe-4k-1369012",
        "europe-4k-1318341"
    ]
    
    private let urlCache: URLCache = {
        let urlCache = URLCache.shared
        return urlCache
    }()
    
    var urlSession: URLSession?
    var uiImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(topStackView)
        
        view.addSubview(bottomStackView)
        topStackView.addArrangedSubview(firstImageView)
        topStackView.addArrangedSubview(fitstImageButton)
        topStackView.addArrangedSubview(secondImageView)
        topStackView.addArrangedSubview(secondImageButton)
        
        bottomStackView.addArrangedSubview(imageClearButton)
        bottomStackView.addArrangedSubview(clearCacheButton)
        
        fitstImageButton.addTarget(self, action: #selector(firstImageButtonTapped), for: .touchUpInside)
        secondImageButton.addTarget(self, action: #selector(secondImageButtonTapped), for: .touchUpInside)
        imageClearButton.addTarget(self, action: #selector(imageClearButtonTapped), for: .touchUpInside)
        clearCacheButton.addTarget(self, action: #selector(clearCacheButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            bottomStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 10),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        urlSession = URLSession(configuration: .default)
        
    }
    
    @objc func firstImageButtonTapped() {
        let url = URL(string: "https://wallpaperaccess.com/download/\(urlArray[0])")!
        let request = URLRequest(url: url)

        if let cachedResponse = urlCache.cachedResponse(for: request) {
            cachedResponse
            print("캐시된 데이터 발견 : \(request)")
            guard let image = UIImage(data: cachedResponse.data) else { return }
            
            firstImageView.image = image
        } else {
            fetchData(urlRequest: request,imageView: firstImageView)
        }
        // NSCache
//        firstImageView.setImageUrl("https://wallpaperaccess.com/download/\(urlArray[0])")
    }
    
    @objc func secondImageButtonTapped() {
        let url = URL(string: "https://wallpaperaccess.com/download/\(urlArray[1])")!
        let request = URLRequest(url: url)
        
        if let cachedResponse = urlCache.cachedResponse(for: request) {
            
            print("캐시된 데이터 발견 : \(request)")
            guard let image = UIImage(data: cachedResponse.data) else { return }
            
            secondImageView.image = image
        } else {
            fetchData(urlRequest: request,imageView: secondImageView)
        }
        // NSCache
//        secondImageView.setImageUrl("https://wallpaperaccess.com/download/\(urlArray[1])")
    }
    
    @objc func imageClearButtonTapped() {
        firstImageView.image = nil
        secondImageView.image = nil
    }
    
    @objc func clearCacheButtonTapped() {
//        ImageCacheManager.shared.removeAllObjects()
        urlCache.removeAllCachedResponses()
        print("urlCache 제거")
    }
    
    func fetchData(urlRequest: URLRequest, imageView: UIImageView) {
        let task = urlSession?.dataTask(with: urlRequest) { data, response, error in
            
            guard let response = response,
                  let data = data,
                  let image = UIImage(data: data) else { return }
            
            // response 캐시하기
            let cachedUrlResponse = CachedURLResponse(response: response, data: data)
            print("캐시 중 : \(cachedUrlResponse)")
            self.urlCache.storeCachedResponse(cachedUrlResponse, for: urlRequest)
            DispatchQueue.main.async {
                imageView.image = image
            }
        }
        task?.resume()
    }
}

