//
//  ViewController.swift
//  AlamofireSwift
//
//  Created by Никита Комаров on 01.02.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK: - Аутлеты
    @IBOutlet weak var Says: UILabel!                   //Says label
    @IBOutlet weak var Author: UILabel!                 //Author label
    @IBOutlet weak var Quote: UILabel!                  //Quote label
    @IBAction func buttonPressed(_ sender: UIButton)    //Ask button
    {
        getInspired(Author, Quote)                      //Request quote
        Says.isHidden = false                           //Make 'Says' label visible
    }
}

