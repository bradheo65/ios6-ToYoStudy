### NSCache와 URLCache의 차이점은 무엇인가요?

1. 구현방식의 차이

2. 저장위치 차이
    - URLCache - on-disk, memory에 저장(default)
    - NSCache - memory

3. 정책
    - URLCache: URLCache.StoragePolicy
    - NSCache: 자동 제거 정책

### 메모리 캐싱과 디스크 캐싱의 차이는 무엇이고, 어떤 장단점이 있을까요?
+ 메모리 캐싱
    + iOS에서 자체적으로 제공해주는 캐시
    + App을 끄면 캐시에 저장된 내용이 사라짐
    + NSCache, URLCache를 통해서 사용 가능
    + 처리속도가 빠르지만 저장 공간이 작다
+ 디스크 캐싱
    + 디스크 캐시는 디스크로부터 읽은 내용을 일부 보존해두는 메모리 영역을 말한다. 나중에 같은 데이터를 읽어야 할 경우가 생기면 실제 디스크에서 읽는 게 아니라 디스크 캐시에서 빠르게 읽어낼 수 있다.이는 메모리에서 읽는 속도가 디스크에서 읽는 속도보다 빠르기 때문이다. 결론적으로 디스크 캐시에 의해 디스크 접근 속도가 향상된다고 할 수 있다.
    + 캐시에 저장할 데이터를 기기 내부에 아카이빙 하는 방식으로 App을 껐다가 켜도 데이터가 사라지지 않고 남아있다
    + FileManager를 통해 사용 가능
    + App을 삭제할 때 캐시에 저장된 데이터를 삭제하게 만들수도 있고, 그렇지 않고 계속 남아있게 만들수도 있다
    + 저장공간은 비교적 크지만, 파일 입출력으로 인해 처리속도가 메모리 캐시보다 느림
(그러나 네트워크 통신을 통해서 다운로드 하는 것 보다는 훨씬 빠름)

### 캐시를 구현할 때 고려해야하는 캐시 운용 정책에는 어떤 것들이 있을까요?
 1) 보안성 (캐시 접근 및 저장 관련)

 2) 데이터 수명

 3) 캐시 교체 정책 (Cache Replacement Policy)

  -. 데이터 사용시간에 따른 교체 (사용시간 작은것 부터..)

  -. LRU, FIFO, LFU 구조에 따라 교체

  -. Random, NUR, Optimal 등등...

 4) 저장하는 시점에 따른 정책

  -. Write Through: 쓰기 요청 시 즉시 저장

  -. Write Back: 쓰기 요청 시 캐시에서만 이뤄지고 바로 저장되지 않고 추후 캐시에서 해당 사항이 끝날때 최종으로 한번에 변경사항 저장

 
### URLRequest에도 캐시 정책을 설정할 수 있으며, 그 정책에 따라 캐싱을 자동으로 하게됩니다. 그렇다면 URLRequest는 기본적으로 어떤 캐시 정책을 가지고 있을까요?
URL을 만들었다면 이제 이를 기반으로 Request를 만들어야 한다. URLRequest에서는 request에 대한 정보만을 기술한다. 실제로 이 정보를 가지고 요청의 결과를 얻기 위해서는 URLSession을 사용해야 한다. 기본적으로 다음과 같은 생성자를 가진다.
```swift
init(url: URL, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeoutInterval: TimeInterval = 60.0)
```
여기서 Cache 정책을 정할 수 있는데, 기본 값은 [NSURLRequest.CachePolicy.useProtocolCachePolicy](https://developer.apple.com/documentation/foundation/nsurlrequest/cachepolicy/useprotocolcachepolicy)이다. 동작을 확인하고 싶다면 [NSURLRequest.CachePolicy](https://developer.apple.com/documentation/foundation/nsurlrequest/cachepolicy)를 참고하자.


### 그런데 위의 실험에서 제시한 이미지 URL을 URLRequest에 담아서 요청을 할 경우, 이미지가 자동으로 캐싱이 되지 않는 것을 확인할 수 있습니다. 그 이유는 무엇일까요?

> 현재 HTTP 및 HTTPS Responses만 캐시됩니다. FTP 및 파일 URL의 경우 정책의 유일한 효과는 Request가 원래 소스에 접근하도록 허용되는지 여부를 결정하는 것입니다


# 참고자료 

[기본캐시운용정책](https://green1229.tistory.com/57)
[URLCache-Policy](https://developer.apple.com/documentation/foundation/urlcache/storagepolicy)
[Jake Yeon 블로그](https://jryoun1.github.io/swift/Cache/)
[URLRequest](https://melod-it.gitbook.io/sagwa/app-frameworks/foundation/url-loading-system/accessing-cached-data)