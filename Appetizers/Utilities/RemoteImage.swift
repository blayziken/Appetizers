//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Blaze on 19/12/2023.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(urlString: String) {
        NetworkManager.shared.downloadImage(urlString: urlString) { uiImage in
            guard let uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("no-image").resizable()
    }
}


struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(urlString: urlString)
            }
    }
}
