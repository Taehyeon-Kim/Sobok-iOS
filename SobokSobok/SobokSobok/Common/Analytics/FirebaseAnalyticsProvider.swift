//
//  FirebaseAnalyticsProvider.swift
//  SobokSobok
//
//  Created by taekki on 2022/11/30.
//

import FirebaseAnalytics

final class FirebaseAnalyticsProvider: AnalyticsProvider {
    let name: String = "Firebase"
    
    func logEvent(_ event: AnalyticsEvent, _ parameters: [String : Any], _ userProperties: [String : String]) {
        for userProperty in userProperties {
            FirebaseAnalytics.Analytics.setUserProperty(userProperty.value, forName: userProperty.key)
        }
        
        FirebaseAnalytics.Analytics.logEvent(event.name, parameters: parameters)
    }
    
    func setUserId(_ userId: String?) {
        FirebaseAnalytics.Analytics.setUserID(userId)
    }
}
