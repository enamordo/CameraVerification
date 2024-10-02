import UIKit
import Combine

class MinimumCameraViewModel: ObservableObject {
    
    // MARK: - Model
    @Published var image: UIImage?
    @Published var previewLayer: CALayer?
    
    // MARK: - Repository
    private var minimumCameraService = MinimumCameraService()
    
    // MARK: - Combine
    private var cancellables:Set<AnyCancellable> = Set()

    init() {
        minimumCameraService.image.sink { [weak self] image in
            guard let self else { return }
            self.image = image
        }.store(in: &cancellables)
        
        minimumCameraService.previewLayer.sink { [weak self] previewLayer in
            guard let self else { return }
            self.previewLayer = previewLayer
        }.store(in: &cancellables)
        
        minimumCameraService.prepareSetting()
    }
}

// MARK: - カメラ機能
extension MinimumCameraViewModel {
    /// 写真撮影
    public func takePhoto() { minimumCameraService.takePhoto() }
    /// セッション開始
    public func startSession() { minimumCameraService.startSession() }
    /// セッション終了
    public func endSession() { minimumCameraService.endSession() }
}
