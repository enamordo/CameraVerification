import SwiftUI

struct CameraView: View {
    private static let barHeightFactor = 0.15
    @State private var useFlash = false
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geometry in
                
                
                
                // topview
                VStack {
                    ZStack(alignment: .center) {
                        Color.black
                        HStack {
                            Button {
                                // FIXME: flash
                                useFlash.toggle()
                            } label: {
                                Label("Switch Camera", systemImage: useFlash ? "bolt.circle" : "bolt.slash.circle")
                                    .font(.system(size: 35, weight: .thin))
                                    .foregroundColor(.white)
                            }
                            .padding()
                            Spacer()
                            NavigationLink {
                                // リンク先
                                AbcView()
                            } label: {
                                Label {
                                    Text("BackToHome")
                                } icon: {
                                    Label("", systemImage: "xmark")
                                        .font(.system(size: 25, weight: .bold))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            
                        }
                        //        .buttonStyle(.plain)
                        .labelStyle(.iconOnly)
                    }
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                    
//                    MinimumCameraView()
                    
//                        .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                    
//                    
//                    Color.white
//                        .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
//                    
                    Spacer()
                    
                    // 記録カテゴリー選択部
                    ZStack {
                        Color.black
                        HStack(spacing: 75) {
                            Button(action: {
                                
                            }, label: {
                                Text("動画")
                            })
                            Button(action: {
                                
                            }, label: {
                                Text("写真")
                            })
                            Button(action: {
                                
                            }, label: {
                                Text("音声")
                            })
                        }
                    }
                    .foregroundColor(.orange)
                    .background(Color.black)
                    .frame(height: geometry.size.height * 0.05)
                    
                    bottomView()
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                    
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
    private func bottomView() -> some View {
        ZStack {
            Color.black
            HStack(alignment:.top ,spacing: 60) {
                NavigationLink {
                    AbcView()
                } label: {
                    Label {
                        Text("Gallery")
                    } icon: {
                        folderView()
                    }
                }
                
                Button {
                    // action
                } label: {
                    Label {
                        Text("Take Photo")
                    } icon: {
                        ZStack {
                            Circle()
                                .strokeBorder(.white, lineWidth: 3)
                                .frame(width: 62, height: 62)
                            Circle()
                                .fill(.white)
                                .frame(width: 50, height: 50)
                        }
                    }
                }
                
                Button {
                    // action
                } label: {
                    Label("Switch Camera", systemImage: "arrow.triangle.2.circlepath")
                        .font(.system(size: 25, weight: .bold))
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            //        .buttonStyle(.plain)
            .labelStyle(.iconOnly)
            .padding()
        }
    }
    
    private func folderView() -> some View {
        VStack() {
            Label("", systemImage: "folder")
                .font(.system(size: 35, weight: .medium))
                .foregroundColor(.white)
            Text("一時保存")
                .foregroundStyle(.white)
                .font(.headline)
        }
    }
    
    private func circleView() -> some View {
        Circle().frame(width:40, height: 40)
    }
    
    struct AbcView: View {
        var body: some View {
            Text("abc")
                .foregroundStyle(.red)
                .font(.headline)
        }
    }
}

#Preview {
    CameraView()
}
