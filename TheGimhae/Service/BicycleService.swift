//
//  BicycleService.swift
//  TheGimhae
//
//  Created by 이용준 on 2023/03/22.
//

import Foundation
import Combine

class BicycleService: Servicable {
    typealias Model = BicycleResponse
    var url = URL(string: "http://smartcity.gimhae.go.kr/smart_tour/dashboard/api/publicData/location/bicycleStation")
}

struct BicycleResponse: Codable {
    var status: String
    var message: String
    var data: [Bicycle]

}
struct Bicycle: Codable {
    var mgtNo: String
    var name: String
    var xCoordinate: String
    var yCoordinate: String
    var addr: String
}
