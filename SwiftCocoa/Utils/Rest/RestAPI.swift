//
//  RestAPI.swift
//  SwiftCocoa
//
//  Created by admin on 2017/7/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation


typealias Successed = ((Any?) -> Void)
typealias Failured = ((Error?) -> Void)
typealias Completed = ((URLResponse, URL?, Error?) -> Void)


class RestAPI {
    
    static let config = Config()
    
    //get网络请求接口(PHP)
    class func sendGETRequest(request: String, params:[String : Any], success:@escaping Successed,failure:@escaping Failured) {
        RestClient.sharedInstance.get(config.phpApi + request, parameters: params, progress: nil, success: { (task, responseObject) in
            success(responseObject)
        }) { (task, error) in
            failure(error)
        }
    }
    //post网络请求接口(PHP)
    class func sendPostRequest(request: String, params:[String : Any], success:@escaping Successed,failure:@escaping Failured) {
        RestClient.sharedInstance.post(config.phpApi + request, parameters: params, progress: nil, success: { (task, responseObject) in
            success(responseObject)
        }) { (task, error) in
            failure(error)
        }
    }
    //get网络请求接口(JAVA)
    class func sendGETJavaRequest(request: String, params:[String : Any], success:@escaping Successed,failure:@escaping Failured) {
        RestClient.sharedInstance.get(config.javaApi + request, parameters: params, progress: nil, success: { (task, responseObject) in
            success(responseObject)
        }) { (task, error) in
            failure(error)
        }
    }
    //post网络请求接口(JAVA)
    class func sendPostJavaRequest(request: String, params:[String : Any], success:@escaping Successed,failure:@escaping Failured) {
        RestClient.sharedInstance.post(config.javaApi + request, parameters: params, progress: nil, success: { (task, responseObject) in
            success(responseObject)
        }) { (task, error) in
            failure(error)
        }
    }
    //文件上传网络请求接口
    class func sendPostUpload(request:String, params:[String : String], fileName:String, fileData:Data, success:@escaping Successed,failure:@escaping Failured) {
        RestClient.sharedInstance.post(request, parameters: params, constructingBodyWith: { (formData) in
            formData.appendPart(withFileData: fileData, name: "file", fileName: fileName, mimeType: "image/png")
        }, progress: nil, success: { (task, responseObject) in
            success(responseObject)
        }) { (task, error) in
            failure(error)
        }
    }
    //图片下载请求接口
    class func sendDown(request:String, fileName:String ,complete:@escaping Completed) {
        let requestUrl = URLRequest(url: URL(string: request)!)
        let downTask = RestDown.sharedInstance.downloadTask(with: requestUrl, progress: nil, destination: { (url, urlResponse) -> URL in
            let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as NSString
            let imageFilePath = documentsDirectory.appendingPathComponent("\(fileName).png")
            return NSURL(fileURLWithPath: imageFilePath) as URL
        }) { (urlResponse, url, error) in
            complete(urlResponse, url, error)
        }
        downTask.resume()
    }
    
    
}

