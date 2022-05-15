class Redeal {
  final String bayerCode;
  final String sellerCode;
  final double price;
  final int count;

  Redeal({
    required this.bayerCode,
    required this.sellerCode,
    required this.price,
    required this.count,
  });

  Map<String, dynamic> get toJson => {
        "buyerCode": bayerCode,
        "sellerCode": sellerCode,
        "price": price,
        "count": count,
      };
}
