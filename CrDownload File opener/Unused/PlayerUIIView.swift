//
//  PlayerUIView.swift
//  CrDownload File opener
//
//  Created by oluwabajio on 16/04/2023.
//

import SwiftUI

struct PlayerUIIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            PlayerView(url: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")
        }
    }
}

struct PlayerUIIView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerUIIView()
    }
}
