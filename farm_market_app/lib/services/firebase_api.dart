import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:farm_market_app/controllers/controller.dart';
import 'package:farm_market_app/routes/app_routes.dart';
import 'package:farm_market_app/views/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseApi {
  FirebaseAuth auth = FirebaseAuth.instance;
  final otpController = Get.put(OTPController());
  //final loginController = Get.put(LoginController());

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      } else {
        print(e.code.toString());
      }
    };
    final phoneCodeSent = (String verificationId, int? resendToken)async{
      print('Code froom seveer : ${verificationId}');
      otpController.otpVerifiedID = verificationId;
      Get.toNamed(Routes.OTP_AUTHEN);
    };
    try{
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: phoneCodeSent,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          log(verificationId);
        },
      );
    }catch(e){
      print(e.toString());
    }

  }

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }

  static UploadTask? uploadBytes(String destination, Uint8List data) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putData(data);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
