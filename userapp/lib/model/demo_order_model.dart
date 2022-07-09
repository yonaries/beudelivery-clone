class DemoOrderModel {
  String orderId;
  String orderTime;
  String orderDate;
  String orderStatus;
  String totalItemsQuantity;
  String paid;
  List<Items> item;
  DemoOrderModel({
    required this.orderId,
    required this.orderTime,
    required this.orderDate,
    required this.orderStatus,
    required this.totalItemsQuantity,
    required this.paid,
    required this.item,
  });
}

class Items {
  String itemName;
  String quantity;

  Items({required this.itemName, required this.quantity});
}
