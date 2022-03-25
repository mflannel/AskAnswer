//
//  Model.swift
//  AlamofireSwift
//
//  Created by Никита Комаров on 03.02.2022.
//

import Foundation
import Alamofire
import UIKit

//MARK: - zenquotes.io API key
public let key: String = "https://zenquotes.io/api/random/2c5f77b010188fd51ce9bb5444a245a1c16ec4db?option1=value&option2=value"

// MARK: - Структура под респонс
struct Quote: Decodable
{
    var q: String
    var a: String
    var h: String
}

func getInspired(_ label: UILabel, _ label2: UILabel)
{
    AF.request(key).responseDecodable(of: [Quote].self)
    {   response in
        let quote: Quote = response.value![0]
        label.text = quote.a
        label2.text = "\"" + quote.q + "\""
    }
}

