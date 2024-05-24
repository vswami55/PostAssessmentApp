//
//  PostsViewModel.swift
//  AssessmentApp
//
//  Created by Virender Swami on 24/05/24.
//

import Foundation
import Combine

class PostsViewModel {
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    private var currentPage = 1

    @Published var posts: [Post] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    // MARK: - Public Methods For Fetch Posts
    func fetchPosts() {
        guard !isLoading else { return }
        guard currentPage <= Constants.API.maxPageLimit else { return }
        
        isLoading = true

        let url = Constants.API.postsURL(page: currentPage, limit: 20)

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { newPosts in
                self.posts.append(contentsOf: newPosts)
                self.currentPage += 1
            })
            .store(in: &cancellables)
    }
    
    func shouldFetchMoreData(currentIndex: Int) -> Bool {
        return currentIndex == posts.count - 1
    }
}
