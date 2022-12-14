//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Mustafa Adnan Tatlıcı on 25.11.2022.
//

import Foundation


struct Constants {
    static let API_KEY = "cbb357e59c952cbca6cfac2ad3e833f7"
    static let baseURL = "https://api.themoviedb.org"
}


enum APIError: Error {
     case failedTogetData
    
}



class APICaller {
    static let shared = APICaller()
    
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else  {
                return
            }
            
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
      
        task.resume()
        
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { Data, _, error in
            guard let data = Data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
            
        task.resume()
    }
   
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void )  {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { Data, _, error in
            guard let data = Data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
        
    }
    
    
    func getPopular (completion: @escaping (Result<[Title], Error>) -> Void )  {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { Data, _, error in
            guard let data = Data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
        
    }
    
    
    func getTopRated (completion: @escaping (Result<[Title], Error>) -> Void )  {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { Data, _, error in
            guard let data = Data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
        
    }
    
    
}

