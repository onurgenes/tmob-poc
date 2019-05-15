//
//  Base.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 15.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

class BaseVC<VM: BaseVMProtocol, V: UIView, C: Coordinator>: UIViewController {
    weak var coordinator: C?
    let baseView = V()
    override func loadView() { view = baseView }
    var viewModel = VM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self as? VM.OutputProtocol
    }
}

extension BaseVC: BaseVMOutputProtocol { }

protocol BaseVMOutputProtocol: AnyObject { }

protocol BaseVMProtocol: AnyObject {
    associatedtype OutputProtocol
    var delegate: OutputProtocol? { get set }
    
    init()
}


