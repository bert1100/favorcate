import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
//    获取FlutterViewController
    let controller: FlutterViewController = window.rootViewController as! FlutterViewController;
//    创建FlutterMethodChannel
    let channel = FlutterMethodChannel(name: "gray.com/battery", binaryMessenger: controller.binaryMessenger);
//    监听channel
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
//        判断回调方法
        guard call.method == "getBatteryInfo" else {
            result(FlutterMethodNotImplemented);
            return
        }
//        获取电池信息
        let device = UIDevice.current;
        device.isBatteryMonitoringEnabled = true;
//        获取电量信息
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(FlutterError(code: "unknown", message: "Battery info is unknown", details: nil));
        }else {
            result(Int(device.batteryLevel * 100));
        }
    }
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
