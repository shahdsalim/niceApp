//
//  AppDelegate.swift
//  lmne
//
//  Created by Mac on 9/18/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import FirebaseMessaging
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let gcmMessageIDKey = "gcm.message_id"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        Messaging.messaging().shouldEstablishDirectChannel = true
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()

        return true
    }
    var applicationStateString: String {
      if UIApplication.shared.applicationState == .active {
        return "active"
      } else if UIApplication.shared.applicationState == .background {
        return "background"
      }else {
        return "inactive"
      }
    }
    
    func requestNotificationAuthorization(application: UIApplication) {
      if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as! UNUserNotificationCenterDelegate
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {_, _ in })
      } else {
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        application.registerUserNotificationSettings(settings)
      }
    }
        // [START receive_message]
        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
          // If you are receiving a notification message while your app is in the background,
          // this callback will not be fired till the user taps on the notification launching the application.
          // TODO: Handle data of notification
          // With swizzling disabled you must let Messaging know about the message, for Analytics
          // Messaging.messaging().appDidReceiveMessage(userInfo)
          // Print message ID.
          if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
          }
    //
    //      // Print full message.
            print(userInfo)
        }

        func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                         fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
          // If you are receiving a notification message while your app is in the background,
          // this callback will not be fired till the user taps on the notification launching the application.
          // TODO: Handle data of notification
          // With swizzling disabled you must let Messaging know about the message, for Analytics
          // Messaging.messaging().appDidReceiveMessage(userInfo)
          // Print message ID.
          if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
          }
    //
    //
    //      // Print full message.
          print(userInfo)
            var urlshare : (Any)?
            var array : [AnyHashable: Any]?
            if let i = array?.firstIndex(where: { $0.key == AnyHashable("notificationType")}) {
                urlshare = array?[i]
                print(urlshare)
            }
    //
    ////        if array?.contains(where: {$0.key == AnyHashable("notificationType")}) ?? AnyHashable("") as! Bool {
    ////           // it exists, do something
    ////            urlshare = array?.k
    ////        } else {
    ////           //item could not be found
    ////        }
    //
    ////          array
    ////              .flatMap{$0}
    ////              .forEach { (anyPerson: notification) in
    ////
    ////                  if anyPerson.key == "url_key" {
    ////                      //Do what you need
    ////                    guard  let url = anyPerson.value else {return}
    ////
    ////                      urlshare = "https://miad.mobikul.com/\(url)"
    ////                      print(urlshare)
    ////                  }
    ////        }
    //
    ////هان التوجه للواجهات
    //
          completionHandler(UIBackgroundFetchResult.newData)
        }
//        func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//          print("Unable to register for remote notifications: \(error.localizedDescription)")
//        }

        // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
        // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
        // the FCM registration token.
        func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
          print("APNs token retrieved: \(deviceToken)")

          // With swizzling disabled you must set the APNs token here.
          // Messaging.messaging().apnsToken = deviceToken
        }


        func applicationWillResignActive(_ application: UIApplication) {
            // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
            // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        }

        func applicationDidEnterBackground(_ application: UIApplication) {
            var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)
            bgTask = application.beginBackgroundTask(expirationHandler: {
                application.endBackgroundTask(bgTask)
                bgTask = UIBackgroundTaskIdentifier.invalid
            })

    //        var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0)
    //        bgTask = application.beginBackgroundTask(expirationHandler: { application.endBackgroundTask(bgTask)
    //            bgTask = UIBackgroundTaskIdentifier.invalid })
            // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
            // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }

    // Print full message.
    print(userInfo)

    // Change this to your preferred presentation option
    completionHandler([])
  }
//heeeeeeeeere
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    // Print message ID.
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID: \(messageID)")
    }
    var smth2: [AnyHashable: Any]?  = nil
    smth2 = userInfo.filter { $0.key == AnyHashable("notificationType")}
    print(smth2?.values as Any)
    let result_string = "\(smth2?.values.first)"


    // Print full message.
    print(result_string)

    completionHandler()
  }
}
// [END ios_10_message_handling]

extension AppDelegate: MessagingDelegate{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        debugPrint("FCM Token: \(fcmToken)")
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        debugPrint(remoteMessage.appData)
    }
}
