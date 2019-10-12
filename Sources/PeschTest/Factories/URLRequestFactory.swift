//
//  URLRequestFactory.swift
//  PeschCore
//
//  Created by Eugène Peschard on 10/10/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

import Foundation

public class URLRequestFactory {
    public static func makeRandomURLRequest(withToken: String? = nil) -> URLRequest {
        let url = URL(string: StringFactory.createRandomURLWeb())!
        var request = URLRequest(url: url)
        if let token = withToken {
            let headerToken = "Bearer " + token
            request.addValue(headerToken, forHTTPHeaderField: "Authorization")
        }
        return request
    }

}
