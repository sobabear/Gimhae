import Foundation
import UIKit
import SnapKit
import AddThen
import CoreEngine

class MainViewController: BaseViewController {
    var mapView = MTMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        view.add(mapView) {
            $0.delegate = self
            $0.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
}


extension MainViewController: MTMapViewDelegate {
    
}
