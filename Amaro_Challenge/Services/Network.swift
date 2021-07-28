

import Foundation

enum ApiError: LocalizedError {
    case urlAccess(Error)
    case parseError
    case responseError
    
    var errorDescription: String? {
        switch self {
        case .urlAccess(let error):
            return "Error accessing URL:\(error)"
        case .parseError:
            return "Error Parsing Json"
        case .responseError:
            return "Response Error"
        }
    }
    
}

struct Network {
    
    private var url: URL? {
        let urlString = "https://www.mocky.io/v2/59b6a65a0f0000e90471257d"
        guard let url = URL(string: urlString) else {
            return nil
        }
        return url
    }
    
     func request(completion: @escaping (Result< Store, ApiError >) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                completion(.failure(.urlAccess(error)))
            }
            
            if let response = response as? HTTPURLResponse,
               200...299 ~= response.statusCode {
                guard let data = data else { return }
                if let parsedData = parseJson(data: data){
                    completion(.success(parsedData))
                }
                completion(.failure(.parseError))
            }
            completion(.failure(.responseError))
        }
        dataTask.resume()
        
    }
    
    private func parseJson(data: Data) -> Store? {
        let decoder = JSONDecoder()
        do {
            let parsedData = try decoder.decode(Store.self, from: data)
            return parsedData
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
}
