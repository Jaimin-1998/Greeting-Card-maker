import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:invitationcard_maker/src/utils/constants.dart';

class InternetNetworkManager {
    checkInterConnection(BuildContext context) async {
     var connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile) {
       isConnection=true;
       print("Connected to Mobile Network");
     } else if (connectivityResult == ConnectivityResult.wifi) {
       print("Connected to WiFi");
       isConnection=true;
     } else {
       isConnection=false;
       print("Unable to connect. Please Check Internet Connection");
     }
  }
}