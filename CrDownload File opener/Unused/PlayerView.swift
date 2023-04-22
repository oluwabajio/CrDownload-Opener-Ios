import Foundation
import SwiftUI
import UIKit
import MobileVLCKit


struct PlayerView: UIViewRepresentable {
    public var url: String
    let mediaPlayer = VLCMediaPlayer()
    func makeUIView(context: Context) -> UIView {
        
        let controller = UIView()
        mediaPlayer.drawable = controller
        let uri = URL(string: self.url)
        let media = VLCMedia(url: uri!)
        mediaPlayer.media = media
        mediaPlayer.play()
        return controller
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
}
