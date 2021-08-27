#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Desk360Module, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(intialize:(NSString*)userName withEmail:(NSString*)userEmail withTarget:(NSString*)targetId withPush:(NSString*)pushToken withDevice:(NSString*)deviceId
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(show:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)

@end