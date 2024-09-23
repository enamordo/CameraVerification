import SwiftUI

struct CameraView: View {
    private static let barHeightFactor = 0.15
    
    var body: some View {
        
        NavigationStack {
            GeometryReader { geometry in
                VStack {
                    
                    topView()
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                    
                    Color.white
                        .frame(height: geometry.size.height * (1 - (Self.barHeightFactor * 2)))
                    
                    bottomView()
                        .frame(height: geometry.size.height * Self.barHeightFactor)
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
    private func topView() -> some View {
        ZStack(alignment: .center) {
            Color.black
            HStack {
                Button {
                    // FIXME: flash
                } label: {
                    Label("Switch Camera", systemImage: "bolt.circle")
                        .font(.system(size: 35, weight: .thin))
                        .foregroundColor(.white)
                    Label("Switch Camera", systemImage: "bolt.slash.circle")
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
    }
    
    private func bottomView() -> some View {
        ZStack {
            Color.black
            HStack(spacing: 60) {
                
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
                        .font(.system(size: 25, weight: .light))
                        .foregroundColor(.white)
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
