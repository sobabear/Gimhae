
import Foundation
import Combine

class WIFIService: Servicable {
    typealias Model = WIFIResponse
    var url = URL(string: "http://smartcity.gimhae.go.kr/smart_tour/dashboard/api/publicData/location/ap")
}

struct WIFIResponse: Codable {
    var status: String
    var message: String
    var data: [WIFI]
}

struct WIFI: Codable {
    var mgtNo: String
    var name: String
    var xCoordinate: String
    var yCoordinate: String
    var addr: String
}
