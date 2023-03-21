import Foundation
import UIKit
import SnapKit
import AddThen
import CoreEngine

class MainViewController: BaseViewController {
    var mapView = MTMapView()
    var core = MainCore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        bind()
    }
    
    private func initView() {
        view.add(mapView) {
            $0.delegate = self
            $0.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
    }
    
    private func bind() {
        core.$state.map(\.dusts)
            .sink { dusts in
                print("❤️ \(dusts.first?.longitude)")
            }
            .store(in: &subscription)
        
        core.getDustAction()
        

    }
}


extension MainViewController: MTMapViewDelegate {
    
}
