
import 'dart:async';

import 'package:flutter/services.dart';

class TelrPaymentGateway {
  static const MethodChannel _channel =
      const MethodChannel('telr_payment_gateway');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String?> callTelRForTransaction ({required String store_id, required String key,
    required String app_install_id, required String amount,required  String app_name, required String app_user_id,required String app_version,required String sdk_version,
    required String mode,required String tran_type,required String tran_cart_id,required String desc,required  String tran_lang,required  String tran_currency,
    required String bill_city,required String bill_country,required String bill_region,required String bill_address,required String bill_first_name,
    required String bill_last_name,required String bill_title,required String bill_email,required String bill_phone}) async {

    final String? message = await _channel.invokeMethod('callTelRForTransaction',
        {
          "store_id" : store_id,
          "key" : key,
          "amount" : amount,
          "app_install_id" : app_install_id,
          "app_name" : app_name,
          "app_user_id" : app_user_id,
          "app_version" : app_version,
          "sdk_version" : sdk_version,
          "mode" : mode,
          "tran_type" : tran_type,
          "tran_cart_id" : tran_cart_id,
          "desc" : desc,
          "tran_language" : tran_lang,
          "tran_currency" : tran_currency,
          "bill_city" : bill_city,
          "bill_country" : bill_country,
          "bill_region" : bill_region,
          "bill_address" : bill_address,
          "bill_first_name" : bill_first_name,
          "bill_last_name" : bill_last_name,
          "bill_title" : bill_title,
          "bill_email" : bill_email,
          "bill_phone" : bill_phone
        });
    return message;
  }

}
