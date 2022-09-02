class OrderRequestModel {
  OrderRequestModel({
    required this.orderNo,
    required this.orderUser,
    required this.orderProducts,
    required this.paymentMethod,
    required this.orderDate,
    required this.quantity,
    required this.total,
  });
  late final String orderNo;
  late final String orderUser;
  late final String orderProducts;
  late final String paymentMethod;
  late final String orderDate;
  late final int quantity;
  late final int total;

  OrderRequestModel.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
    orderUser = json['orderUser'];
    orderProducts = json['orderProducts'];
    paymentMethod = json['paymentMethod'];
    orderDate = json['orderDate'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['orderNo'] = orderNo;
    _data['orderUser'] = orderUser;
    _data['orderProducts'] = orderProducts;
    _data['paymentMethod'] = paymentMethod;
    _data['orderDate'] = orderDate;
    _data['quantity'] = quantity;
    _data['total'] = total;
    return _data;
  }
}
