//
//  ViewController.swift
//  DeffieHelmanKeyExchange
//
//  Created by Arafat on 12/12/2017.
//  Copyright © 2017 AK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // params to key generation
        let g = "10" // generator
        let p = "12312312" // prime
        let serverPublicKey = "221340931254645017156584097818327210615226061583293792331543321170847431969431826660978618442621486106117681874169217526423260346408191179319253956582029636424921560330607175026940351375112030613383576741556463113183015659340314937087" // server public key, to create crypto key
        
        //// generate Client DH Keys
        let secDHKeys = DHKeyExchangeManager.generateDHExchangeKeys(generator: g, primeNumber: p) // return object "DHKey"
        
        // print private & public key
        print("GeneratorDHKey: \(g)\n\n")
        print("PrimeNumberDHKey: \(p)\n\n")
        print("ClientPrivteDHKey: \(secDHKeys.privateKey!)\n\n")
        print("ClientPublicDHKey: \(secDHKeys.privateKey!)\n\n")
        
        
        //generate crypto shared key
        let cryptoDHKey = DHKeyExchangeManager.generateDHCryptoKey(privateDHKey: secDHKeys.privateKey!, serverPublicDHKey: serverPublicKey, primeNumber: p)
        
        print("CryptoSharedDHKey: \(cryptoDHKey)\n\n")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

