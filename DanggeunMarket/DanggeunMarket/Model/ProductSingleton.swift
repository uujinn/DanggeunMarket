//
//  ProductSingleton.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/22.
//

import Foundation
import UIKit

struct productInfo{
    var id: String
    var productImage: UIImage
    var productTitle: String = ""
    var price: Int = 0
    var location: String = ""
    var info: String = ""
    var date: String = ""

}

class product {
    static let shared = product()
    var productArray:[productInfo] = [
        productInfo(id: "화이팅", productImage: UIImage(named: "kal.jpg")! , productTitle: "칼하트 후드집업" , price: 40000, location: "당산동", info: "사이즈는 XL입니다. 상태는 최상입니다.", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "야니", productImage: UIImage(named: "tumb.jpg")! , productTitle: "스타벅스 텀블러 (미사용)" , price: 50000, location: "여의도동", info: "스타벅스 미니 콜라보 투고 텀블러입니다.", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "민", productImage: UIImage(named: "xs.jpeg")! , productTitle: "아이폰 XS 64GB 스페이스 그레이 팔아요" , price: 320000, location: "양평동", info: "연락주세요.", date: "21년 9월 20일 2시 25분 55초"),
        productInfo(id: "도비", productImage: UIImage(named: "ably.jpg")! , productTitle: "에이블리 얇은 크롭 가디건" , price: 7000, location: "구로구", info: "여름 옷 정리하려고 팔아요! 원가 14800원입니다!", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "영화보러갈꺼야", productImage: UIImage(named: "key.jpg")! , productTitle: "로지텍 블루투스 키보드 k480" , price: 20000, location: "동작구 신대방제1동", info: "이틀사용했고 이상없습니다", date: "21년 9월 20일 2시 20분 41초")
    ]
    
}


//        init?(string: String){
//            let df = DateFormatter()
//            let date = Date()
//            df.dateStyle = .medium
//            df.timeStyle = .medium
//            df.locale = Locale(identifier: "ko_KR")
//            df.dateFormat = "YY년 M월 d일 h시 mm분 ss초"
//            print(df.string(from: date))
//        }
