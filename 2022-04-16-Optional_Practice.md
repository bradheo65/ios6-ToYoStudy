//var budget: Int = 2000
//var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

//MARK: 실험 - 1
/// Optional binding 
//for number in 0..<productsList.count {
//    if let item = productsList[number] {
//        print("\(number)번 상품은 \(item)입니다.")
//    }
//}

/// Unforced Optional
//for (index, item) in productsList.enumerated() {
//    print("\(index)번 상품은 \(item)입니다.")
//}

//MARK: 실험 - 2

/// Optional Binding
///
final class User {
    private var budget: Int = 2000
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    public func buy(productNumber : Int)  {
        do {
            guard let item = productsList[productNumber] else {
                print("판매된 상품입니다..")
                return 
            }
            budget -= 1000
            print("\(item)을 판매하였습니다.")
            productsList[productNumber] = nil
            printAll()
        } catch {
            print("존재하지 않는 상품입니다..")
        }
    }
    
    private func printAll() {
        productsList.forEach { item in
            print("재고 - \(item ?? "X")")
        }
        print("예산 \(budget)")
    }
}

let user = User()
user.buy(productNumber: 0)

// throws - throw
// do - try - catch
// try, try?, try!
// Result type (enum, related value, generic을 알고 있는 경우)


