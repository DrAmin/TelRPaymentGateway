#import "TelrPaymentGatewayPlugin.h"
#if __has_include(<telr_payment_gateway/telr_payment_gateway-Swift.h>)
#import <telr_payment_gateway/telr_payment_gateway-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "telr_payment_gateway-Swift.h"
#endif

@implementation TelrPaymentGatewayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTelrPaymentGatewayPlugin registerWithRegistrar:registrar];
}
@end
