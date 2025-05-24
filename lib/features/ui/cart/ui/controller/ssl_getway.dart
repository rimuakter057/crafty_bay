import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCCustomerInfoInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/General.dart';
import 'package:flutter_sslcommerz/model/sslproductinitilizer/SSLCProductInitializer.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

Future<void> sslProcess({
  required BuildContext context,
  required String storeId,
  required String storePassword,
  required double amount,
  required String customerName,
  required String customerEmail,
  required String customerPhone,
  required String customerAddress,
  bool isLive = false,
}) async {
  try {
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        ipn_url: "https://yourdomain.com/ipn",
        // Replace with your IPN URL
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "general",
        sdkType: isLive ? SSLCSdkType.LIVE : SSLCSdkType.TESTBOX,
        store_id: storeId,
        store_passwd: storePassword,
        total_amount: amount,
        tran_id: DateTime.now().millisecondsSinceEpoch.toString(),
      ),
    );

    // Add customer information
    sslcommerz.addCustomerInfoInitializer(
      customerInfoInitializer: SSLCCustomerInfoInitializer(
        customerName: customerName,
        customerEmail: customerEmail,
        customerAddress1: customerAddress,
        customerCity: "Dhaka",
        customerPostCode: "1207",
        customerCountry: "Bangladesh",
        customerPhone: customerPhone,
        customerState: '',
      ),
    );

    // Add product information
    sslcommerz.addProductInitializer(
      sslcProductInitializer: SSLCProductInitializer(
        productName: "Test Product",
        productCategory: "general",
        general: General(general: "General Purpose", productProfile: "general"),
      ),
    );

    // Initiate the payment
    SSLCTransactionInfoModel result = await sslcommerz.payNow();

    // Determine the message and background color based on the transaction status
    String message;
    Color backgroundColor;

    switch (result.status?.toLowerCase()) {
      case "failed":
        message = "Transaction Failed";
        backgroundColor = Colors.red;
        break;
      case "closed":
        message = "Transaction Closed by User";
        backgroundColor = Colors.orange;
        break;
      case "success":
        message = "Transaction Successful - Amount: ${result.amount}";
        backgroundColor = Colors.green;
        break;
      default:
        message = "Transaction Status: ${result.status}";
        backgroundColor = Colors.blue;
    }

    // Display the SnackBar with the transaction status
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: Duration(seconds: 4),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Error: ${e.toString()}"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ),
    );
  }
}
