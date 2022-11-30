//
//  AnalyticsProvider.swift
//  SobokSobok
//
//  Created by taekki on 2022/11/30.
//

import Foundation

typealias AnalyticsEventParameters = [String: Any?]
typealias AnalyticsEventUserProperties = [String: String?]

protocol AnalyticsEvent {
    var name: String { get }
    var parameters: AnalyticsEventParameters { get }
    var userProperties: AnalyticsEventUserProperties { get }
}

protocol AnalyticsProvider {
    var name: String { get }
    
    func logEvent(
        _ event: AnalyticsEvent,
        _ parameters: [String: Any],
        _ userProperties: [String: String])
    
    func setUserId(_ userId: String?)
}

enum Analytics {
    private static var providers: [AnalyticsProvider] = []
    
    static func register(_ providers: [AnalyticsProvider]) {
        for provider in providers {
            Self.providers.append(provider)
        }
    }
    
    static func log(_ event: AnalyticsEvent) {
        let parameters: [String: Any] = event.parameters
            .reduce(into: [:], { $0[$1.key] = $1.value })
        let userProperties: [String: String] = event.userProperties
            .reduce(into: [:], { $0[$1.key] = $1.value })
        for provider in Self.providers {
            provider.logEvent(event, parameters, userProperties)
        }
    }
    
    static func setUserId(_ userId: String?) {
        for provider in Self.providers {
            provider.setUserId(userId)
        }
    }
}

extension AppDelegate {
    
    func registerAnalyticsProvider() {
        Analytics.register([
            FirebaseAnalyticsProvider()
        ])
    }
}
