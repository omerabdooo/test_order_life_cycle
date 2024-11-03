class AllOrderEntity {
  final int idOrder;
  final String orderNum;
  final DateTime? orderDate;
  final int productNum;

  AllOrderEntity(
      {required this.idOrder,
      required this.orderNum,
      required this.orderDate,
      required this.productNum});
}
