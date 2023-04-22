import SwiftUI
import MobileVLCKit
import PhotosUI
import AVKit



struct ContentView: View {
    
    private let mediaPlayer = VLCMediaPlayer()
    @State private var selectedItem: PhotosPickerItem?
       @State private var loadState = LoadState.unknown
    
    @State var goToPlayer: Bool = false
    
    enum LoadState {
            case unknown, loading, loaded(Movie), failed
        }

    
    var body: some View {
        
        
        NavigationView {
            VStack {
                
                
                VStack {
                    
                    
                    PhotosPicker("Select movie", selection: $selectedItem, matching: .videos)
                    
                    switch loadState {
                    case .unknown:
                        EmptyView()
                    case .loading:
                        ProgressView()
                    case .loaded(let movie):
                        //                                   VideoPlayer(player: AVPlayer(url: movie.url))
                        //                                       .scaledToFit()
                        //                                       .frame(width: 300, height: 300)
                        
                        
                        //                                       PlayerView(url: movie.url.absoluteString).scaledToFit()
                        //                                           .frame(width: .infinity, height: 500)
                      one()
                        NavigationLink(destination: MyPlayerView(url:movie.url.absoluteString), isActive: self.$goToPlayer) {
                            EmptyView()
                        }
                        
                        
                    case .failed:
                        Text("Import failed")
                    }
                }
                .onChange(of: selectedItem) { _ in
                    Task {
                        do {
                            loadState = .loading
                            
                            if let movie = try await selectedItem?.loadTransferable(type: Movie.self) {
                                loadState = .loaded(movie)
                            } else {
                                loadState = .failed
                            }
                        } catch {
                            loadState = .failed
                        }
                    }
                    
                    
                    
                    
                    
                }
            }
        }
    }
    
    func one() -> some View {
       
        return Text("Opening File..").onAppear(){
            self.goToPlayer = true
        }
       }
}




struct Movie: Transferable {
    let url: URL

    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .movie) { movie in
            SentTransferredFile(movie.url)
        } importing: { received in
            let copy = URL.documentsDirectory.appending(path: "movie.mp4")

            if FileManager.default.fileExists(atPath: copy.path()) {
                try FileManager.default.removeItem(at: copy)
            }

            try FileManager.default.copyItem(at: received.file, to: copy)
            return Self.init(url: copy)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    
    }
}
