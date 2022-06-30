import 'dart:developer';

class ProfileController {
  //goto clicked settings
  goToSetting({required title}) {
    if (title == "Payment Methods") {
      // ignore: todo
      //TODO send to payment method screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    } else if (title == "Offers") {
      // ignore: todo
      //TODO send to offers screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    }
    if (title == "Promo Codes") {
      // ignore: todo
      //TODO send to Promo Codes
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    }
    if (title == "Rewards") {
      // ignore: todo
      //TODO send to rewards
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return
      // }));
      log(title);
    }
  }
}
