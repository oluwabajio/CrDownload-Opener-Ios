import Foundation
import SwiftUI
import UIKit
import MobileVLCKit

struct VlcPlayerDemo: UIViewRepresentable{
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VlcPlayerDemo>) {
    }

    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero)
    }
}

class PlayerUIView: UIView, VLCMediaPlayerDelegate {
  private let mediaPlayer = VLCMediaPlayer()

  override init(frame: CGRect) {
    super.init(frame: frame)

    let url = URL(string: "rtsp://xxxxx")!//replace your resource here

    mediaPlayer.media = VLCMedia(url: url)
    mediaPlayer.delegate = self
    mediaPlayer.drawable = self
    mediaPlayer.play()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }
}

struct VlcPlayerDemo_Previews: PreviewProvider {
    static var previews: some View {
        VlcPlayerDemo()
    }
}
