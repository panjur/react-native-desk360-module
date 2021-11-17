import Desk360

@objc(Desk360Module)
public class Desk360Module: NSObject, RCTBridgeModule {
    override init() {
        
    }
    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    
    @objc(intialize:withKey:withName:withEmail:withTarget:withPush:withDevice:withResolver:withRejecter:)
    public func intialize(appVersionName: String, apiKey: String, userName: String, userEmail: String, targetId: String, pushToken: String, deviceId: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) {
        let props = Desk360Properties(
            appID: apiKey,
            deviceID: deviceId,
            environment: .production,
            language: "en",
            bypassCreateTicketIntro: true
        )
        
        Desk360.start(using: props)
        
        resolve(true)
    }
    
    @objc(show:withRejecter:)
    public func show(resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            var topVC = UIApplication.shared.delegate?.window??.rootViewController
            while( (topVC?.presentedViewController != nil) &&
                    topVC != topVC?.presentedViewController ){
                topVC = topVC?.presentedViewController;
            }
            if topVC != nil {
                Desk360.show(on: topVC!, animated: true)
//                resolve("show")
            } else {
                
            }
        }
    }
    
    public static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    public static func moduleName() -> String! {
        return "Desk360Module"
    }

}
