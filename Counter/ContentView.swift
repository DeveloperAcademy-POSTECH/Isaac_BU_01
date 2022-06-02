//
//  ContentView.swift
//  Counter
//
//  Created by devisaac on 2022/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                Stepper("Current Count: \(count)", value: $count)
                NavigationLink(
                    destination: WordListView(count: $count),
                    label: {
                        Text("Generate")
                    }
                )
            }
            .padding()
            .navigationTitle("Counter App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
