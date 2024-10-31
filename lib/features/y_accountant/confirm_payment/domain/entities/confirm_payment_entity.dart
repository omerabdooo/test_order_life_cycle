class ConfirmPaymentEntity {
  final String idBond;
  final String bankName;
  final String customerN;
  final String amountBon;
  final String numBond;
  final String date;

  ConfirmPaymentEntity(
      {required this.idBond,
      required this.bankName,
      required this.customerN,
      required this.amountBon,
      required this.numBond,
      required this.date});
}
