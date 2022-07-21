//
//  File.swift
//  
//
//  Created by Yago Teixeira on 07/07/22.
//

import Foundation

public protocol MovieRepository {

    func popular(completion: @escaping ([Movie]) -> Void)
//    func latest(completion: @escaping ([Movie]) -> Void)
    func topRated(completion: @escaping ([Movie]) -> Void)
    func upcoming(completion: @escaping ([Movie]) -> Void)
}
