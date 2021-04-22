import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityService with ChangeNotifier{

  getNetworkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch(connectivityResult){
      case ConnectivityResult.wifi:
        notifyListeners();
        return true;
        break;
      case ConnectivityResult.mobile:
        notifyListeners();
        return true;
        break;
      case ConnectivityResult.none:
        notifyListeners();
        return false;
        break;
    }

  }
}