import Foundation
import Moya

class CalculatorManager {
    private init() {}
    static let shared = CalculatorManager()
    lazy var provider = MoyaProvider<CalculatorAPI>()
    
    func getCalculateResult(calcBodyModel: CalculatorBodyModel, completion: @escaping (Result<CalculatorModel, Error>) -> Void ) {
        provider.request(.calcResult(param: calcBodyModel)) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let calculatorModel = try decoder.decode(CalculatorModel.self, from: data.data)
                    completion(.success(calculatorModel))
                    print(calculatorModel)
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
