//
//  MoviesRestFulAPI.swift
//
//  Created by Jyoti on 29/01/18.
//

import UIKit

public class MoviesRestFulAPI: NSObject {
    
    public class func fetchMovieListWith(reqInfo :FetchMoviesReqInfo, completionHandler:@escaping (_ isSuccess :Bool, _ response :[String:Any]?, _ error:Error?) -> ()) {
        
        var dictionary = [String:Any]()
        dictionary[ApiKeys.apiKey] = API_KEY
        dictionary[ApiKeys.language] = reqInfo.language
        dictionary[ApiKeys.page] = reqInfo.page
        
        let request:URLRequest = RequestHelper.getMoviesAPIRequest(relativePath: API.Endpoint.nowPlaying, dictionary: dictionary)
        
        ServiceManager.shared.makeHttpHandShakeRequest(request: request) { (success, response, error) in
            
            completionHandler(success,response,error)
        }
    }
    
    public class func getConfigurations(completionHandler:@escaping (_ isSuccess :Bool, _ response :[String:Any]?, _ error:Error?) -> ()) {
        
        var dictionary = [String:Any]()
        dictionary[ApiKeys.apiKey] = API_KEY
        
        let request:URLRequest = RequestHelper.getAPIRequest(relativePath: API.Endpoint.configuration, dictionary: dictionary)
        
        ServiceManager.shared.makeHttpHandShakeRequest(request: request) { (success, response, error) in
            
            completionHandler(success,response,error)
        }
    }
}
