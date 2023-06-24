//
//  RandomUserViewModel.swift
//  CombineWithAlamofire
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import Foundation
import Alamofire
import Combine

final class RandomUserViewModel: ObservableObject {
    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap { $0.value }
            .map { $0.results }
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("error: \(error.localizedDescription)")
                case .finished:
                    print("finish")
                }
            } receiveValue: { receivedValue in
                print("받은 값: \(receivedValue.count)")
                self.randomUsers = receivedValue
            }
            .store(in: &subscriptions)
    }
}
