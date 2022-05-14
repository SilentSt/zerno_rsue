class PostContract {
  final double count;
  final double price;
  final bool sell;

  PostContract({
    required this.count,
    required this.price,
    required this.sell,
  });

  Map<String, dynamic> get toJson => {
        "count": count,
        "price": price,
        "sell": sell,
      };
}

class GetContract {
  final String sellerId;
  final String purchaseId;
  final double price;
  final DateTime updated;
  final bool onTrade;

  GetContract.fromJson(Map<String, dynamic> data)
      : sellerId = data['sellerId'],
        purchaseId = data['purchaseId'],
        price = data['price'],
        updated = DateTime.parse(
          data['updated'],
        ),
        onTrade = data['onTrade'];
}
