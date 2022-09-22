//
//  AppDelegate.swift
//  UIKit-App
//
//  Created by TalkVia Mac Mini on 20/9/2022.
//

import UIKit
import Flutter
import FlutterPluginRegistrant


@UIApplicationMain
class AppDelegate: FlutterAppDelegate { // More on the FlutterAppDelegate.
  lazy var flutterEngine = FlutterEngine(name: "talkvia_flutter_engine")

  override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    // Runs the default Dart entrypoint with a default Flutter route.
    flutterEngine.run();
      
      if let controller = window?.rootViewController as? FlutterViewController {
          let channel = FlutterMethodChannel(
              name: "talkvia.flutter.chatbot/phrase",
              binaryMessenger: controller.binaryMessenger)

          channel.setMethodCallHandler({ [weak self] (
              call: FlutterMethodCall,
              result: @escaping FlutterResult) -> Void in
              print("Inside setMethodCallHandler ---- SWIFT")
              print(call.method)
              switch call.method {
              case "getStartupArgs":
                  print("getStartupArgs ---- SWIFT")
                  result([
                    "chatbotName": "TalkVia Chatbot",
                    "subheading" : "Config subheading",
                    "fulfilmentURL" : "https://voicebotsvc.talkvia.com/Process/ChatBot?ProjectId=3f40d537-b5d2-4257-aa7f-5b4d56be43ed",
                    "primaryColor" : "#6067d8",
                    "secondaryColor" : "#fe8a73",
                    "headingTextColor" : "#000000",
                    "imageSourceURL" : "https://picsum.photos/200",
                    "minimizedImageURL" : "test",
                    "backgroundImageURL" : "test",
                    "responseDelay" : "2000",
                    "googleInvocation" : "",
                    "alexaInvocation" : "",
                    "carouselTime" : "8000",
                    "allowSound" : "true",
                    "soundOnDefault" : "false",
                    "allowSpeechRecognition" : "true",
                    "showTextbox" : "false"
                ])
              case "getEnteredPhrase":
                  print("getEnteredPhrase ---- SWIFT")
              default:
                  result(FlutterMethodNotImplemented)
              }
          })
          print("I got here, meaning rootViewController was ok")
      }
      
    GeneratedPluginRegistrant.register(with: self.flutterEngine);
    return super.application(application, didFinishLaunchingWithOptions: launchOptions);
  }
}
