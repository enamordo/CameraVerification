import SwiftUI
import AVFoundation

struct MinimumCameraPreviewView: View {
    private let captureSession = AVCaptureSession()
    
    var body: some View {
        VStack {
            PreviewViewUIView(captureSession: captureSession)
            Button("プレビュー開始") {
                print("start preview!")
                let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
                let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!)
                captureSession.addInput(videoDeviceInput!)
                captureSession.addOutput(AVCapturePhotoOutput())
                DispatchQueue.global(qos: .background).async { captureSession.startRunning() }
            }
        }
    }
}

// preview用画面のためにUIViewを継承してオーバーライド
class PreviewView: UIView {
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}

// PreviewViewをUIViewからSwiftUI用Viewに変換
struct PreviewViewUIView: UIViewRepresentable {
    let captureSession: AVCaptureSession
    func makeUIView(context: Context) ->  PreviewView {
        let previewView = PreviewView()
        previewView.videoPreviewLayer.session = captureSession
        return previewView
    }
    func updateUIView(_ uiView:  PreviewView, context: Context) {
    }
}

#Preview {
    MinimumCameraPreviewView()
}
