//
//  ContentView.swift
//  H4X0R
//
//  Created by Mohamad El Bohsaly on 4/4/20.
//

import SwiftUI

struct ContentView: View {
    
    //Subscriber listens to Publisher from Network Manager
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            
            //List view is similar to TableView
            List (networkManager.posts){ post in
                
                //button that triggers a navigation presentation when pressed
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R News")
        }
        
        //viewDidLoad in UIKit - updating UI
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
