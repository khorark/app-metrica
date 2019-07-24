
#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(RNAppMetrica, AppMetrica, NSObject)

RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)

RCT_EXTERN_METHOD(activateWithApiKey: (NSString *)key)
RCT_EXTERN_METHOD(activateWithConfig: (NSDictionary *)params)
RCT_EXTERN_METHOD(reportEvent: (NSString *)message parameters:(nullable NSDictionary *)params)

RCT_EXTERN_METHOD(
                  decrement: (RCTPromiseResolveBlock)resolve
                  rejecter: (RCTPromiseRejectBlock)reject
                  )

@end
  