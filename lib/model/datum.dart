class Datum {
  final String name;
  final int id;
  final String exchange;
  final double currentPrice;

  Datum({
    required this.id,
    required this.name,
    required this.exchange,
    required this.currentPrice,
  });

  Datum.fromJson(Map<String, dynamic> json)
      : id = json['stocks']['id'],
        name = json['stocks']['name'],
        exchange = json['stocks']['exchange'],
        currentPrice = json['stocks']['current_price'];
}
