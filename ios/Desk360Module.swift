import Desk360

@objc(Desk360Module)
public class Desk360Module: NSObject {
    private let APP_KEY = "zIu9jt0zXQCx2Kvm6S3BGu12GThMh3YM"
    override init() {
        
    }
    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    
    @objc(intialize:withEmail:withTarget:withPush:withDevice:withResolver:withRejecter:)
    public func intialize(userName: String, userEmail: String, targetId: String, pushToken: String, deviceId: String, resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) {
        let props = Desk360Properties(
            appID: APP_KEY,
            deviceID: deviceId,
            environment: .production,
            language: "en",
            bypassCreateTicketIntro: true
        )
        
        Desk360.start(using: props)
    }
    
    @objc(show:withRejecter:)
    public func show(resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock) {
        DispatchQueue.main.async {
            guard let topVC = UIApplication.shared.delegate?.window??.rootViewController else {return}
            Desk360.show(on: topVC, animated: true)
        }
    }
}
