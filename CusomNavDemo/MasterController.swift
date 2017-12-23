//
//  ViewController.swift
//  CusomNavDemo
//
//  Created by David on 23/12/2017.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class MasterController: UIViewController {
    
    lazy var navSegmentedControl: UISegmentedControl = {
        let segmentCon = UISegmentedControl()
        segmentCon.translatesAutoresizingMaskIntoConstraints = false
        segmentCon.insertSegment(withTitle: "Blue", at: 0, animated: false)
        segmentCon.insertSegment(withTitle: "Red", at: 1, animated: false)
        segmentCon.selectedSegmentIndex = 0
        segmentCon.addTarget(self, action: #selector(didChangeSelection), for: .valueChanged)
        return segmentCon
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var redVC: ChildRedController = {
        let child = ChildRedController()
        addAsChildVC(childController: child)
        return child
    }()
    
    lazy var blueVC: ChildBlueController = {
        let child = ChildBlueController()
        addAsChildVC(childController: child)
        return child
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        blueVC.view.isHidden = false
    }
    
    @objc private func didChangeSelection(_ sender: UISegmentedControl) {
        blueVC.view.isHidden = sender.selectedSegmentIndex == 1
        redVC.view.isHidden = sender.selectedSegmentIndex == 0
    }

    private func setupViews() {
        
        let screenHeight = UIScreen.main.bounds.height
        
        view.addSubview(containerView)
        
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.addSubview(navSegmentedControl)
        
        navSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: screenHeight / -2.5).isActive = true
        navSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func addAsChildVC(childController: UIViewController) {
        self.addChildViewController(childController)
        containerView.addSubview(childController.view)
        childController.view.frame = containerView.frame
        childController.didMove(toParentViewController: self)
    }
    
    private func removeAsChildVC(childController: UIViewController) {
        childController.willMove(toParentViewController: nil)
        childController.view.removeFromSuperview()
        childController.removeFromParentViewController()
    }

}














