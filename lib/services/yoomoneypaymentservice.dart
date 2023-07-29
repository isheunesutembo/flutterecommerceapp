import 'package:flutter_yookassa_sdk/flutter_yookassa_sdk.dart';

class YooMoneyPaymentService{
  Future<void> checkout(double amount) async {
    const testModeSettings = TestModeSettings(
      paymentAuthorizationPassed: true,
      cardsCount: 5,
      charge: Amount(value: 0.50, currency: Currency.usd()),
      enablePaymentError: false,
    );

    final inputData = TokenizationModuleInputData(
      clientApplicationKey: 'test_MjI2MjEwoFpy6NV-N1BrBX8FM4DY4tNSrj8PUyKXsTw',
      shopName: 'Ishe ePhamarcy',
      purchaseDescription: 'Description Example',
      amount: Amount(value: amount, currency: Currency.usd()),
      savePaymentMethod: SavePaymentMethod.userSelects,
      shopId: '111222333',
      tokenizationSettings:const TokenizationSettings(
        paymentMethodTypes: PaymentMethodTypes.all(),
        showYooKassaLogo: false,
      ),
      testModeSettings: testModeSettings,
      isLoggingEnabled: false,
      moneyAuthClientId: 'test_client_id_123_123',
      googlePayParameters:const GooglePayParameters(),
    );
    try {
      final paymentData =
          await FlutterYookassaSdk.instance.tokenization(inputData);
      print(paymentData);
    } on YooKassaException catch (error) {
      // Handle Error
      print('Error : $error');
    }
  }

  Future<void> bankCardRepeat(double amount) async {
    const testModeSettings = TestModeSettings(
      paymentAuthorizationPassed: true,
      cardsCount: 5,
      charge: Amount(value: 0.50, currency: Currency.usd()),
      enablePaymentError: false,
    );

    final inputData = BankCardRepeatModuleInputData(
      clientApplicationKey: 'test_NzkxMjAyOuwoQvAL05i8dH3PKX66eL-iT7wMMQHCZmk',
      shopName: 'Shp Name Test',
      purchaseDescription: 'Description Example',
      amount: Amount(value: amount, currency: Currency.rub()),
      savePaymentMethod: SavePaymentMethod.userSelects,
      shopId: '111222333',
      testModeSettings: testModeSettings,
      isLoggingEnabled: false,
      paymentMethodId: '',
    );
    try {
      final paymentData =
          await FlutterYookassaSdk.instance.bankCardRepeat(inputData);
      print(paymentData);
    } on YooKassaException catch (error) {
      // Handle Error
      print('Error : $error');
    }
  }

}