//
//  DetailView.swift
//  H4X0R
//
//  Created by Mohamad El Bohsaly on 4/4/20.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}
