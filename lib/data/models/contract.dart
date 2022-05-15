class PostContract {
  final int count;
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
  final String sellerCode;
  final String purchaserCode;
  final double price;
  final DateTime updated;
  final bool onTrade;

  GetContract.fromJson(Map<String, dynamic> data)
      : sellerCode = data['sellerCode']??"",
        purchaserCode = data['purchaserCode']??"",
        price = double.parse(data['price'].toString()),
        updated = DateTime.parse(
          data['updated'],
        ),
        onTrade = data['onTrade'];
}
