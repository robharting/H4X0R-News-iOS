//
//  DetailView.swift
//  H4X0R-News-iOS
//
//  Created by Harting, R.P.G. (Rob) on 24/09/2024.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        Webview(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}

// create webview from UIKit
struct Webview: UIViewRepresentable {
   
    let  urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    
}
