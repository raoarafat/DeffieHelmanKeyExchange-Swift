//
//  KeyExchange.swift
//  FinClusion
//
//  Created by MSP Hitect on 09/12/2017.
//  Copyright © 2017 mesiniaga. All rights reserved.
//

import Foundation
import BigInt

class DHKeyExchangeManager: NSObject {
    
    private static func generateDHKey(base: String, power: String, modulus : String) -> BigInt{
        
        
        let g = BigInt(base)
        let privateKey = BigInt(power)
        let p = BigInt(modulus )

        // pow mod formula to get key
        let key = g!.power(privateKey!, modulus: p!)
        
        return key
        
        
    }
    
    private static func getDHPrivateRandomNumberKey() -> String {
        
        var privateDHKey = ""
        
        // generate random keys
        for _ in 1...30 {
            
            privateDHKey += String(Int(arc4random_uniform(UInt32(42949672)) + UInt32(10)))
            
        }
        
        return privateDHKey
    }
    
    static func generateDHExchangeKeys(generator: String, primeNumber : String) -> DHKey {
        
        let privateDHKey = getDHPrivateRandomNumberKey()
        let publicKey = String(generateDHKey(base: generator, power: privateDHKey, modulus: primeNumber))
        
        let dhKeys = DHKey(privateKey: privateDHKey, publicKey: publicKey)
        
        return dhKeys
    }
    
    static func generateDHCryptoKey(privateDHKey: String, serverPublicDHKey: String, primeNumber : String) -> String {
        
        let cryptoKey = String(generateDHKey(base: serverPublicDHKey, power: privateDHKey, modulus: primeNumber))
        return cryptoKey
    }
    
}

struct DHKey {
    
    var privateKey: String?
    var publicKey: String?

    init(privateKey: String, publicKey: String) {
        
        self.privateKey = privateKey
        self.publicKey = publicKey
        
    }
}
