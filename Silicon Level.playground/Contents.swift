// Created By Harshdeep Kahlon
// from Scranton, PA
// March, 2019

import UIKit
import PlaygroundSupport

/*:
 # Silicon Level
 ### This playground explores the building blocks of Apple's A12 Bionic system on a chip (SoC).
 
 > For the past few years, Apple's iPhone and iPad lineup were powered by a custom A-series SoC. While they were already efficient and powerful from the start, recent iterations have significantly increased performance and efficiency while adding new features such as the neural engine. We will be looking at the A12 Bionic, which offers unprecedented capability in its class.
  */

let navigationController = UINavigationController(rootViewController: IntroViewController())

navigationController.view.frame.size = CGSize(width: 500, height: 700)
navigationController.view.clipsToBounds = true
navigationController.navigationBar.barStyle = .blackTranslucent
navigationController.navigationBar.tintColor = .white

PlaygroundPage.current.liveView = navigationController.view
