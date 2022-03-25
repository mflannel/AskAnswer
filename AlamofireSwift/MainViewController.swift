//
//  ViewController.swift
//  AlamofireSwift
//
//  Created by Никита Комаров on 01.02.2022.
//

import UIKit
import Alamofire
import Lottie

class MainViewController: UIViewController
{
    let wizardCast = AnimationView()
    let wizardAwait = AnimationView()
    let bang = AnimationView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBang()
    }
    
    //MARK: - Аутлеты
    @IBOutlet weak var Says: UILabel!
    @IBOutlet weak var Author: UILabel!
    @IBOutlet weak var Quote: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton)
    {
        if wizardAwait.isAnimationPlaying { wizardAwait.removeFromSuperview() }
        setupAnimation()
        getInspired(Author, Quote)                      
        Says.isHidden = false
    }
    
    private func playWizardAwait() {
        wizardAwait.animation = Animation.named("LittleWizard3")
        wizardAwait.frame = CGRect(x: view.center.x - 250, y: view.center.y - 250, width: view.frame.size.width , height: 500)
        wizardAwait.backgroundColor = .white
        wizardAwait.contentMode = .scaleAspectFill
        wizardAwait.loopMode = .loop
        wizardAwait.play()
        wizardAwait.center = view.center
        view.addSubview(wizardAwait)
    }
    
    private func playBang() {
        bang.animation = Animation.named("Bang")
        bang.frame = CGRect(x: view.center.x - 250, y: view.center.y - 250, width: view.frame.size.width , height: 500)
        bang.backgroundColor = .white
        bang.contentMode = .scaleAspectFill
        bang.loopMode = .playOnce
        bang.play(completion: { played in if played {
            self.bang.removeFromSuperview()
            self.playWizardAwait()}})
        bang.center = view.center
        view.addSubview(bang)

    }
    
    private func setupAnimation() {
        
        wizardCast.animation = Animation.named("LittleWizard1")
        wizardCast.frame = CGRect(x: view.center.x - 250, y: view.center.y - 250, width: view.frame.size.width , height: 500)
        wizardCast.backgroundColor = .white
        wizardCast.contentMode = .scaleAspectFill
        wizardCast.loopMode = .playOnce
        wizardCast.center = view.center
        
        wizardCast.play(completion: { played in if played
            { self.bang.play(completion:
                { played in if played
                    {   self.bang.removeFromSuperview() }
                })
            }
                self.wizardCast.removeFromSuperview()
        })
        view.addSubview(wizardCast)
    }
    
}

