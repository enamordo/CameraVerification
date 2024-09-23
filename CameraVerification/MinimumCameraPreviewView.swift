import SwiftUI
import AVFoundation

/*
 
 検証用の構造体
 最小の実装で、カメラを用意しプレビュー画面を表示する
 正しさや、本来実装すべき処理は全て省略
 
 */
struct MinimumCameraPreviewView: View {
    // ①セッション変数を宣言
    private let captureSession = AVCaptureSession()
    
    var body: some View {
        VStack {
            PreviewViewUIView(captureSession: captureSession)
                .onAppear(perform: {
                    // デバイス変数にカメラを設定
                    let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
                    // デバイスインプット変数に、デバイス変数を設定
                    let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!)
                    // ②セッションにデバイスインプットを追加
                    captureSession.addInput(videoDeviceInput!)
                    // ③セッションにデバイスアウトプットを追加
                    captureSession.addOutput(AVCapturePhotoOutput())
                    // ④セッションの開始
                    DispatchQueue.global(qos: .background).async {
                        captureSession.startRunning()
                    }
                })
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
