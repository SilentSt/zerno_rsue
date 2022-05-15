class Resell {
  final double oldPrice;
  final double newPrice;
  final int count;
  final String code;

  Resell({
    required this.oldPrice,
    required this.newPrice,
    required this.count,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        "oldPrice": oldPrice,
        "newPrice": newPrice,
        "count": count,
        "code": code,
      };
}
