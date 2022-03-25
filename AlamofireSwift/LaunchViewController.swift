//
//  LSViewController.swift
//  AlamofireSwift
//
//  Created by Никита Комаров on 25.03.2022.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {

    let animationView = AnimationView()
    var animationPlayed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
    }
    
    private func setupAnimation() {
        animationView.animation = Animation.named("LittleWizard2")
        animationView.frame = CGRect(x: view.center.x - 250, y: view.center.y - 250, width: view.frame.size.width , height: 500)
        animationView.center = view.center
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .playOnce
        animationView.play(completion: { _ in /*played in if played { self.showMainVC() }*/})
        view.addSubview(animationView)
    }
    
    private func showMainVC() {
        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") {
            present(mainVC, animated: true, completion: nil)
        }
    }

}
