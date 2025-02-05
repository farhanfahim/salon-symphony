import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseMessaging

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      if #available(iOS 10.0, *) {
               // For iOS 10 display notification (sent via APNS)
               UNUserNotificationCenter.current().delegate = self

               let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
               UNUserNotificationCenter.current().requestAuthorization(
                 options: authOptions,
                 completionHandler: { _, _ in }
               )
             } else {
               let settings: UIUserNotificationSettings =
                 UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
               application.registerUserNotificationSettings(settings)
             }


             application.registerForRemoteNotifications()
      UIApplication.shared.applicationIconBadgeNumber = 0

//     if FirebaseApp.app() == nil { //
        FirebaseApp.configure()
//        }
    Messaging.messaging().delegate = self

    GMSServices.provideAPIKey("AIzaSyB-gcvnec9PZTfDg8IroxCXAekFSrYp6Vc")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
