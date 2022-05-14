class Deal {
  final String code;
  final int count;
  final double price;
  final bool buy;

  Deal({
    required this.code,
    required this.count,
    required this.price,
    required this.buy,
  });

  Map<String, dynamic> get toJson => {
        "code": code,
        "count": count,
        "price": price,
        "buy": buy,
      };
}
