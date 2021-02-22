//
//  LinkService.swift
//  Link (iOS)
//
//  Created by Jacob Strickler on 2/19/21.
//

import LinkPresentation
import UIKit

struct LinkInfo {
    let pageName: String
    let siteName: String
}

final class LinkService {
    
    enum LinkServiceError: Error {
        case noMetadata
        case noHost
    }
    
    static let shared = LinkService()
    
    private init() {}
    
    func getLinkInfo(for url: URL, completion: @escaping (Result<LinkInfo, Error>) -> Void) {
        let metadataProvider = LPMetadataProvider()
        
        metadataProvider.startFetchingMetadata(for: url) { (metadata, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let title = metadata?.title else {
                    completion(.failure(LinkServiceError.noMetadata))
                    return
                }
                
                guard let siteName = metadata?.url?.host else {
                    completion(.failure(LinkServiceError.noHost))
                    return
                }
                
                let linkInfo = LinkInfo(pageName: title, siteName: siteName)
                completion(.success(linkInfo))
            }
        }
    }
}
