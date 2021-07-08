import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telr_payment_gateway/telr_payment_gateway.dart';

void main() {
  const MethodChannel channel = MethodChannel('telr_payment_gateway');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TelrPaymentGateway.platformVersion, '42');
  });
}
