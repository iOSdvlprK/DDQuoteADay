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
        print("Fetching new quote...")
        getQuote(urlString: "http://api.quotable.io/random")
    }
    
    func getQuote(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError? {
                print("Error: \(error.localizedDescription)")
                print("Error Code: \(error.code)")
                print("Error Domain: \(error.domain)")
                if let underlyingError = error.userInfo[NSUnderlyingErrorKey] as? NSError {
                    print("Underlying Error: \(underlyingError.localizedDescription) (Code: \(underlyingError.code))")
                }
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("HTTP Status Code: \(response.statusCode)")
                if response.statusCode == 429 {
                    print("Rate limit exceeded. Please wait and try again.")
                    return
                }
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            print("Raw Data: \(String(data: data, encoding: .utf8) ?? "Unable to decode data")")
            
            let jsonDecoder = JSONDecoder()
            do {
                let newQuoteModel = try jsonDecoder.decode(QuoteModel.self, from: data)
                
                DispatchQueue.main.async {
                    if self.quoteModel._id != newQuoteModel._id {
                        print("New quote data: \(data)")
                        self.quoteModel = newQuoteModel
                    } else {
                        print("Same quote received, no update")
                    }
                }
            } catch {
                print("Decoding Error: \(error.localizedDescription)")
                print(error)
            }
        }
        task.resume()
    }
}
