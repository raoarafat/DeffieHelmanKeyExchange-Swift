# DeffieHelmanKeyExchange-Swift
To Generate Public, Private & Crypto Shared Key by using Diffie-Helman Algorithm.
It accepts maximum number of String Integers. 

Just Download and Use.
Example Code:

        // params to key generation
        // generator
        let g = "10" 
        // prime
        let p = "12312312" 
        // server public key, to create crypto key
        let serverPublicKey = "221" 
        
        //// generate Client DH Keys // return object "DHKey"
        let secDHKeys = DHKeyExchangeManager.generateDHExchangeKeys(generator: g, primeNumber: p) 
        
        // print private & public key
        print("GeneratorDHKey: \(g)\n\n")
        print("PrimeNumberDHKey: \(p)\n\n")
        print("ClientPrivteDHKey: \(secDHKeys.privateKey!)\n\n")
        print("ClientPublicDHKey: \(secDHKeys.privateKey!)\n\n")
        
        
        //generate crypto shared key
        let cryptoDHKey = DHKeyExchangeManager.generateDHCryptoKey(privateDHKey: secDHKeys.privateKey!, serverPublicDHKey: serverPublicKey, primeNumber: p)
        
        print("CryptoSharedDHKey: \(cryptoDHKey)\n\n")
