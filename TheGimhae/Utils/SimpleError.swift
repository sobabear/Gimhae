
import Foundation

struct SimpleError: Error {
    var message: String
}


struct DecodeFailedError: Error {
    var json: String
    
    init(data: Data) {
        self.json = String(data: data, encoding: .utf8) ?? ""
    }
}
