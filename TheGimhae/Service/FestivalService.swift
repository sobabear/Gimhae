import Combine
import Foundation

class FestivalService: BaseService {
    let url = "http://www.gimhae.go.kr/openapi/tour/festival.do"
    
    func getFestivals(page: Int) -> AnyPublisher<FestivalResponse, Error> {
        
        guard let _url = URL(string: url + "?page=\(page)") else { return Fail(error: SimpleError(message: "url not found")).eraseToAnyPublisher()}
        
        return URLSession.shared.dataTaskPublisher(for: _url)
            .tryMap(\.data)
            .tryMap { data in
                do {
                    let _data = try JSONDecoder().decode(FestivalResponse.self, from: data)
                    return _data
                } catch {
                    throw DecodeFailedError(data: data)
                }
            }
            .eraseToAnyPublisher()
    }
}

struct FestivalResponse: Codable {
    var record_count: Int
    var pageunit: Int
    var page_count: Int
    var page: Int
    var results: [Festival]
}

struct Festival: Codable {
    var name: String
    var address: String
    var idx: Int
    var category: String
    var area: String
    var copy: String
    var manage: String
    var phone: String
    var homepage: String
    var fee: String
    var xposition: String
    var yposition: String
    var parking: String
    var images: [String]
    var sdate: String // 시작일
    var edate: String // 종료일
    var undecided: String // 미정 여부
    var opener: String // 주관
}
