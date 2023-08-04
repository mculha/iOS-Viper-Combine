//
//  BaseMoyaProvider.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import Moya
import Alamofire


//to log http responses
public func JSONFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

final class BaseMoyaProvider<Target: TargetType>: MoyaProvider<Target> {
    
    override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                  requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                  stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                  callbackQueue: DispatchQueue? = nil,
                  session: Session = BaseAlamofireSession.instance,
//                  plugins: [PluginType] = [],
                  plugins: [PluginType] = [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONFormatter), logOptions: .verbose))],
                  trackInflights: Bool = false) {
        super.init(endpointClosure: endpointClosure,
                   requestClosure: { endpoint, closure in
            var request = try! endpoint.urlRequest()
            request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
            closure(.success(request))
        },
                   stubClosure: stubClosure,
                   callbackQueue: callbackQueue,
                   session: session,
                   plugins: plugins,
                   trackInflights: trackInflights)
    }
    
}


private final class BaseAlamofireSession: Alamofire.Session {
    
    static let instance: BaseAlamofireSession = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 90 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 90 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return BaseAlamofireSession(configuration: configuration)
    }()
    
}
