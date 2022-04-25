//
//  StoryboardInstantiable.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import UIKit

public protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype T
    static var storyboardFileName: String { get }
    static func instantiateViewController(_ bundle: Bundle?) -> T
}

public extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = storyboardFileName
        let storyboard = UIStoryboard(name: fileName, bundle: bundle)
        
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? Self else {
            
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
        }
        return vc
    }
}
