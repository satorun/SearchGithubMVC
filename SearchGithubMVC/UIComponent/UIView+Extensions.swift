//
//  UIView+Extensions.swift
//  SearchGithubMVC
//
//  Created by satorun on 2018/09/23.
//  Copyright © 2018年 satorun. All rights reserved.
//

import UIKit


protocol Instantiatable {
    associatedtype InstanceType
    static func instantiateFromResource(resourceName: String?, identifier: String?) -> InstanceType!
}

protocol ResourceBundleProvider {
    static var resourceBundle: Bundle { get }
}
extension ResourceBundleProvider {
    static var resourceBundle: Bundle { return Bundle.main }
}

protocol StoryboardInstantiatable: Instantiatable, ResourceBundleProvider where InstanceType == Self {
    static var storyboardName: String { get }
    static var viewControllerIdentifier: String? { get }
}

protocol NibInstantiatable: Instantiatable,ResourceBundleProvider  where InstanceType == Self {
    static var nibName: String { get }
}

extension NibInstantiatable where Self: Identifiable {
    static var nibName: String { return identifier }
}

extension NibInstantiatable {
    static func instantiateFromResource(resourceName: String? = nil, identifier: String? = nil) -> InstanceType! {
        let name = resourceName ?? nibName
        let nib = UINib(nibName: name, bundle: resourceBundle)
        return nib.instantiate(withOwner: nil, options: nil).first as! InstanceType
    }
}
