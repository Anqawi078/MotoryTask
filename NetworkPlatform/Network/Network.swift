//
//  Network.swift
//  NetworkPlatform
//
//  Created by khalil anqawi on 20/05/2022.
//

import Foundation
import Alamofire
import Domain
import RxAlamofire
import RxSwift
import KeychainSwift
import Alamofire

final class Network<T: Decodable> {
    private let endPoint: String
    private let scheduler: ConcurrentDispatchQueueScheduler
    
    init(_ endPoint: String) {
        
        self.endPoint = endPoint
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
        
    }
    
    func getItems(_ path: String) -> Observable<T> {
           
        let absolutePath = "\(endPoint)/\(path)"
           print("======= Model Type : \(T.self) =======")
           print("======= URL =======")
           print(absolutePath)
           print("======= Start request =======")
           
           
        
           return Observable.create { observer -> Disposable in
               
               
               RxAlamofire
                   .request(.get, absolutePath)
                .observe(on :self.scheduler)
                   .responseData()
                   .expectingObject(ofType:T.self)
                   .subscribe(onNext: { apiResult in
                       switch apiResult{
                       case let .success(result):
                           observer.onNext(result)
                           observer.onCompleted()
                           break
                           
                       case let .failure(apiErrorMessage) :
                           print(apiErrorMessage)
                           observer.onError(apiErrorMessage)
                           break
                       }
                   },onError:{ err in
                       observer.onError(err)
                       
                   })
           }
       }
}

enum ApiResult<Value, Error>{
    case success(Value)
    case failure(Error)

    init(value: Value){
        self = .success(value)
    }

    init(error: Error){
       self = .failure(error)
    }
}


extension Observable where Element == (HTTPURLResponse, Data){
fileprivate func expectingObject<T : Decodable>(ofType type: T.Type) -> Observable<ApiResult<T, Error>>{
    return self.map{ (httpURLResponse, data) -> ApiResult<T, Error> in

        if(httpURLResponse.statusCode >= 200 && httpURLResponse.statusCode < 300)
        {
                do {
             data.printData()
             let object = try JSONDecoder().decode(type, from: data)
                       
                return .success(object)

                } catch {
                   do {
                       let object = try JSONDecoder().decode(ErrorResponse.self, from: data)
               object.errorCode = httpURLResponse.statusCode
                          return .failure(object)
                   }
                   catch {
                       data.printData()
                       print(error)
                       #if DEBUG
                       return .failure(ErrorResponse(message: "can not convert Api response to model Error Code\(httpURLResponse.statusCode)", status: "false", errorCode: httpURLResponse.statusCode, data: nil))
                       #else
                       return .failure(ErrorResponse(message: "something went wrong please try again", status: "false", errorCode: httpURLResponse.statusCode, data: nil))
                       #endif
                   }

                   
                }

        }
        else
        {
            do {
               data.printData()
                       let object = try JSONDecoder().decode(ErrorResponse.self, from: data)
               object.errorCode = httpURLResponse.statusCode
                          return .failure(object)

                        } catch {
                           data.printData()
                           print(error)
                           #if DEBUG
                           return .failure(ErrorResponse(message: "can not convert Api response to model Error Code\(httpURLResponse.statusCode)", status: "false", errorCode: httpURLResponse.statusCode, data: nil))
                           #else
                           return .failure(ErrorResponse(message: "something went wrong please try again", status: "false", errorCode: httpURLResponse.statusCode, data: nil))
                           #endif
                         }

         }
  }
}}


public class ErrorResponse: Codable , Error {
   public let message : String?
   public let status : String?
   public var errorCode : Int?
   public let data : String?

   init(message: String?, status: String? , errorCode : Int? , data : String?) {
       self.message = message
       self.status = status
       self.errorCode = errorCode
       self.data = data
   }
}
