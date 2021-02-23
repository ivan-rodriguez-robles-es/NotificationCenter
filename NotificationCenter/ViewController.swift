//
//  ViewController.swift
//  NotificationCenter
//
//  Created by ivk on 13/10/2020.
//  Copyright © 2020 irr. All rights reserved.
//
protocol ObserverProtocol {
    var id: Int { get }
    var notificationId: String { get }
    var action: ((Any) -> ()) { get }
    func update<T>(with newValue: T)
}

protocol ObservableProtocol {
    
    associatedtype T
    
    var value: T { get set }
    var observers: [ObserverProtocol] { get set }
    
    func addObserver (_ observer: ObserverProtocol)
    func removeObserver (_ observer: ObserverProtocol)
    func notifyAllObservers (with newValue: T)
    func notifyAllObservers (with newValue: T, notificationId: String)
}

class Observable<T> : ObservableProtocol {
    
    private var _value : T! = nil
    private var _observers : [ObserverProtocol] = []
    
    var value: T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(with: newValue)
        }
    }
    
    var observers: [ObserverProtocol] {
        get { return self._observers }
        set { self._observers = newValue}
    }
    
    func addObserver(_ observer: ObserverProtocol) {
        observers.append(observer)
    }
    
    func removeObserver (_ observer: ObserverProtocol) {
        observers = observers.filter({ $0.id != observer.id })
    }
    
    func notifyAllObservers (with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
    func notifyAllObservers (with newValue: T, notificationId: String) {
        for observer in observers {
            print ("notificationId = \(notificationId)")
            print ("observer.notificationId = \(observer.notificationId)")
            if (notificationId == observer.notificationId){
                observer.update(with: newValue)
                observer.action(newValue)
            }
                
        }
    }
}

class Observer: ObserverProtocol {
    
    private var _id: Int = 0
    private var _observer: Any
    private var _notificationId: String
    private var _action: ((Any) -> ())
    var id: Int {
        get {
            return self._id
        }
    }
    var notificationId: String {
        get { return self._notificationId}
    }
    
    var action: (((Any) -> ())) {
        get { return self._action }
    }
    
    init (id: Int, observer: Any, notificationId: String, action:  @escaping ((Any) -> ())){
        self._id = id
        self._observer = observer
        self._notificationId = notificationId
        self._action = action
        print ("\(type(of: observer)) is an observer for \(self._notificationId)")
    }
    
    func update<T>(with newValue: T) {
        print ("heysss, observer #\(self.id) updated with new value : \(newValue)")
    }
}

class observationCenter{
    
    static let instance = observationCenter()
    let observable = Observable<String>()
    
    private init (){
        //observer = Observable<String>()
    }
    
    public func addObserver (id: Int, observer: Any, notificationId: String, action: @escaping (Any) -> ()) {
        let observer = Observer(id: id,
                                observer: observer,
                                notificationId: notificationId,
                                action: action)
        
        observable.addObserver(observer)
    }
    
    public func post (value: String){
        observable.value = value
    }
    public func post (value: String, notificationID: String){
        //observable.value = value
        observable.notifyAllObservers (with: value, notificationId: notificationID)
    }
    
}
class mamain{
    
    func executeThis () {
//        let obs1 = Observer(id: 1, observer: self, notificationId: "pepe")
//        let obs2 = Observer(id: 2, observer: self, notificationId: "pepito")
//        let obsv = Observable<String>()
//        obsv.addObserver(obs1)
//        obsv.addObserver(obs2)
//        
//        obsv.value = "Hello world" // post
//        obsv.removeObserver(obs1)
//        obsv.value = "Obs1 removed, yey" // post

    }

}
let main = mamain()



