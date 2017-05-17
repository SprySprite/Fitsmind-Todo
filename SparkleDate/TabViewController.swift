//
//  TabViewController.swift
//  SparkleDate
//
//  Created by Edward Kwon on 5/16/17.
//  Copyright © 2017 Spry Sprite LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import NSObject_Rx
import Action

class TabViewController: UIViewController, BindableType {
  
  @IBOutlet var itemOneButton: UITabBarItem!
  @IBOutlet var itemTwoButton: UITabBarItem!
  @IBOutlet var buttonPress: UIButton!

  var viewModel: TabViewModel!
  
  func bindViewModel() {
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
}
