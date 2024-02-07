//
//  ContentView.swift
//  AsyncDNSResolverDemoIOS
//
//  Created by Alex on 07/02/2024.
//

import SwiftUI

struct ContentView: View {
    var resolver = Resolver.shared

    var body: some View {
        VStack {
            Text("www.google.com")
            Text("has the next IPs:")
            Text(resolver.ips.joined(separator: ", "))
        }
        .padding()
        .onAppear {
            Task {
                await resolver.resolve("www.google.com")
            }
        }
    }
}

#Preview {
    ContentView()
}
