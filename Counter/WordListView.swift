//
//  WordListView.swift
//  Counter
//
//  Created by devisaac on 2022/05/23.
//

import SwiftUI

struct WordListView: View {
    @Binding var count:Int
    @State var words:[String] = []
    var body: some View {
        VStack {
            Stepper("Count \(count)", value: $count)
            
            Button("Generate", action: {
                Task {
                    do {
                        let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(count)")
                        let (data, _) = try await URLSession.shared.data(from: url!)
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode([String].self, from: data)
                        words = decoded
                    } catch {
                        
                    }
                }
            })
            List {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
        .padding()
        .navigationTitle("\(count) random words")
        .task {
            do {
                let url = URL(string: "https://random-word-api.herokuapp.com/word?number=\(count)")
                let (data, _) = try await URLSession.shared.data(from: url!)
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([String].self, from: data)
                words = decoded
            } catch {
                
            }
        }
    }
}

struct WordListView_Previews: PreviewProvider {
    static var previews: some View {
        WordListView(count: .constant(5))
    }
}
