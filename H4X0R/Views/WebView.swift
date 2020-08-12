//
//  WebView.swift
//  H4X0R
//
//  Created by Mohamad El Bohsaly on 4/4/20.
//

import Foundation
import WebKit
import SwiftUI

/*
    Display web content in windows.
    Implement browser features such as following user-activated links,
    managing back-forward list,
    and managing a history of recently visited pages.
*/

struct WebView: UIViewRepresentable {

    let urlString: String?
    
    //Creates the view object and configures its initial state
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    //Updates the state of the specified view with new information from SwiftUI
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
