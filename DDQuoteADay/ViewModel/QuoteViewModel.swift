//
//  QuoteViewModel.swift
//  DDQuoteADay
//
//  Created by joe on 8/31/25.
//

import Foundation

class QuoteViewModel: ObservableObject {
    @Published var quoteModel: QuoteModel = .defaultQuote()
    
    func getRandomQuote() {
        getQuote(urlString: "https://api.quotable.io/random")
    }
    
    func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        // send get request from quote API
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // try to get data and any error information
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            // called only if error is not nil
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("data was nil")
                return
            }
            
            do {
                let newQuoteModel = try jsonDecoder.decode(QuoteModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.quoteModel = newQuoteModel
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
