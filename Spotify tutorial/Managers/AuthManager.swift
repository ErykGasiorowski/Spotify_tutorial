//
//  AuthManager.swift
//  Spotify_tutorial
//
//  Created by Eryk Gasiorowski on 13/03/2021.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "e410b1d8d5814e0da587216259a7ef11"
        static let clientSecret = "fa1721b147ab4444b0be238444adc00a"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let redirectURI = "https://iosacademy.io"
        let base = "https://accounts.spotify.com/authorize"
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool? {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool -> Void)) {
        // Get token
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
    
}
