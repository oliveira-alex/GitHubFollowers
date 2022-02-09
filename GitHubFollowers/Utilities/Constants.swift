//
//  Constants.swift
//  GitHubFollowers
//
//  Created by Alex Oliveira on 07/02/2022.
//

import UIKit

enum SFSymbols {
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName: "folder")
    static let gists = UIImage(systemName: "text.alignleft")
    static let followers = UIImage(systemName: "heart")
    static let following = UIImage(systemName: "person.2")
}

enum Images {
    static let placeholder = UIImage(named: "avatar-placeholder")
    static let ghLogo = UIImage(named: "gh-logo")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
}

enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale

    static let isiPhoneSE            = (idiom == .phone) && (ScreenSize.maxLength == 568)
    static let isiPhone8Standard     = (idiom == .phone) && (ScreenSize.maxLength == 667) && (nativeScale == scale)
    static let isiPhone8Zoomed       = (idiom == .phone) && (ScreenSize.maxLength == 667) && (nativeScale > scale)
    static let isiPhone8PlusStandard = (idiom == .phone) && (ScreenSize.maxLength == 736)
    static let isiPhone8PlusZoomed   = (idiom == .phone) && (ScreenSize.maxLength == 736) && (nativeScale < scale)
    static let isiPhoneX             = (idiom == .phone) && (ScreenSize.maxLength == 812)
    static let isiPhoneXsMaxAndXr    = (idiom == .phone) && (ScreenSize.maxLength == 896)
    static let isiPad                = (idiom == .pad) && (ScreenSize.maxLength >= 1024)

    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
