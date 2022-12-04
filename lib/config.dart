class Config {
  static const String appName = "FastMart";

  //Home
  // static const String apiURL = "192.168.1.10:4000";
  // static const String imgURL = "http://192.168.1.10:4000";

  //Home1
  // static const String apiURL = "192.168.1.8:4000";
  // static const String imgURL = "http://192.168.1.8:4000";

  //Home2
  // static const String apiURL = "192.168.1.11:4000";
  // static const String imgURL = "http://192.168.1.11:4000";

  //Home3
  static const String apiURL = "192.168.1.6:4000";
  static const String imgURL = "http://192.168.1.6:4000";

  //Home4
  // static const String apiURL = "192.168.1.4:4000";
  // static const String imgURL = "http://192.168.1.4:4000";

  // //Uni Mobile Hotspot
  // static const String apiURL = "192.168.30.176:4000";
  // static const String imgURL = "http://192.168.30.176:4000";

  //Uni
  // static const String apiURL = "10.113.54.167:4000";
  // static const String imgURL = "http://10.113.54.167:4000";

  //Lib
  // static const String apiURL = "10.113.49.211:4000";
  // static const String imgURL = "http://10.113.49.211:4000";

  //Uni
  // static const String apiURL = "10.113.62.51:4000";
  // static const String imgURL = "http://10.113.62.51:4000";

  //Uni
  // static const String apiURL = "10.113.6.10:4000";
  // static const String imgURL = "http://10.113.6.10:4000";

  // LAN
  // static const String apiURL = "192.168.137.1:4000";
  // static const String imgURL = "http://192.168.137.1:4000";

  // LAN
  // static const String apiURL = "172.20.0.147:4000";
  // static const String imgURL = "http://172.20.0.147:4000";

  static const String loginAPI = "/users/login";

  static const String registerAPI = "/users/register";

  static const String userProfileAPI = "/users/user-profile";

  static const String updateUserTokenAPI = "/users/tokenUpdate";

  static const String updateUserImgAPI = "/users/updateProfileImg";

  static const String updateProfileAPI = "/users/updateProfile";

  static const String changePasswordAPI = "/users/changePassword";

  static const String categoryAPI = "/categories/category";

  static const String productAPI = "/products/product";

  static const String productByQRAPI = "/products/productByBarcode";

  static const String saveOrderAPI = "/orders/order";

  static const String saveCashOrderAPI = "/orders/orderByCash";

  static const String getOrderAPI = "/orders/userOrders";

  static const String updateOrderAPI = "/orders/orderUpdate";

  static const String getCardAPI = "/cards/userCards";

  static const String createCardAPI = "/cards/createCard";

  static const String deleteCardAPI = "/cards/deleteCard";

  static const String createDemandAPI = "/demands/demand";

  static const String getDemandAPI = "/demands/demand";

  static const String addComplaintAPI = "/complaints/complaint";

  static const String getActiveOffersAPI = "/advertisments/activeOffers";

  static const int pageSized = 10;

  static int selectedIndex = 0;
}
