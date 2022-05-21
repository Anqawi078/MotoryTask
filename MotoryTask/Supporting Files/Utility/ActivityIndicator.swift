//
//  ActivityIndicator.swift
//  MotoryTask
//
//  Created by khalil anqawi on 21/05/2022.
//

import Foundation
import RxSwift
import RxCocoa

import RappleProgressHUD


public class ActivityIndicator: SharedSequenceConvertibleType {
    public typealias Element = Bool
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let _lock = NSRecursiveLock()
    private let _behavior = BehaviorRelay<Bool>(value: true)
    private let _loading: SharedSequence<SharingStrategy, Bool>
    private let _relay = BehaviorRelay(value: 0)

    let bag = DisposeBag()
    
    public init() {
        _loading = _relay.asDriver()
        .map { $0 > 0 }
            .distinctUntilChanged()

        
        _loading.asObservable().subscribe(onNext: { (status) in
            if status {
                let attributes = RappleActivityIndicatorView.attribute(
                    style: RappleStyle.circle,
                    tintColor: UIColor(named: "AppMainColor") ?? UIColor() ,
                    screenBG:  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) ,
                     thickness: 5 )
                     RappleActivityIndicatorView.startAnimating(attributes: attributes)
                
            }
            else {
                RappleActivityIndicatorView.stopAnimation()
            }
            
            
            }).disposed(by: bag)
    }
    
    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.Element> {

        return Observable.using({ () -> ActivityToken<O.Element> in
            self.increment()
            return ActivityToken(source: source.asObservable(), disposeAction: self.decrement)
        }) { t in
            return t.asObservable()
        }

    }
    

    private func increment() {
        _lock.lock()
        _relay.accept(_relay.value + 1)
        print("_relay \(_relay.value + 1)")

        _lock.unlock()
    }

    private func decrement() {
        _lock.lock()
        _relay.accept(_relay.value - 1)
                print("_relay \(_relay.value - 1)")
        _lock.unlock()
    }

    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, Element> {
        return _loading
    }
    
 
 
}

extension ObservableConvertibleType {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<Element> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}




private struct ActivityToken<E> : ObservableConvertibleType, Disposable {
    private let _source: Observable<E>
    private let _dispose: Cancelable

    init(source: Observable<E>, disposeAction: @escaping () -> Void) {
        _source = source
        _dispose = Disposables.create(with: disposeAction)
    }

    func dispose() {
        _dispose.dispose()
    }

    func asObservable() -> Observable<E> {
        _source
    }
}

