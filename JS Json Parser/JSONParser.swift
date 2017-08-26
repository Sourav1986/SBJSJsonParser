//
//  JSONParser.swift
//  JS Json Parser
//
//  Created by Sourav Basu Roy on 03/06/17.
//  Copyright © 2017 Sourav Basu Roy. All rights reserved.
//

import UIKit
import JavaScriptCore

class JSONParser: NSObject {
    func parseJSON(jsonString:String) -> Any {
        let jsVM = JSVirtualMachine()
        let context = JSContext(virtualMachine: jsVM)
        
        _ = context?.evaluateScript("var value = function(json){ var obj = JSON.parse(json); return obj; } ")
        let returnElement = context?.objectForKeyedSubscript("value")
        
        let parsedJSON = returnElement?.call(withArguments: [jsonString])
        return parsedJSON?.toObject() as Any

    }
}
