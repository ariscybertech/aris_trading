/// stocks : [{"name":"JPASSOCIAT","id":11460,"exchange":"NSE","current_price":55.3},{"name":"ACC","id":22,"exchange":"NSE","current_price":35.6},{"name":"Nifty 50","id":26000,"exchange":"NSE","current_price":556},{"name":"HDFCAMC","id":4244,"exchange":"NSE","current_price":45},{"name":"HDFC","id":1330,"exchange":"NSE","current_price":123.5},{"name":"SBILIFE","id":21808,"exchange":"NSE","current_price":453},{"name":"SBIN","id":3045,"exchange":"NSE","current_price":543},{"name":"USDINR APR FUT","id":2794,"exchange":"CDS","current_price":66},{"name":"INFY","id":1594,"exchange":"NSE","current_price":765},{"name":"USDINR AUG FUT","id":3692,"exchange":"CDS","current_price":996}]

class DataModel {
  List<Stocks>? _stocks;

  List<Stocks>? get stocks => _stocks;

  DataModel({
      List<Stocks>? stocks}){
    _stocks = stocks;
}

  DataModel.fromJson(dynamic json) {
    if (json['stocks'] != null) {
      _stocks = [];
      json['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "JPASSOCIAT"
/// id : 11460
/// exchange : "NSE"
/// current_price : 55.3

class Stocks {
  String? _name;
  int? _id;
  String? _exchange;
  double? _currentPrice;

  String? get name => _name;
  int? get id => _id;
  String? get exchange => _exchange;
  double? get currentPrice => _currentPrice;

  Stocks({
      String? name, 
      int? id, 
      String? exchange, 
      double? currentPrice}){
    _name = name;
    _id = id;
    _exchange = exchange;
    _currentPrice = currentPrice;
}

  Stocks.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _exchange = json['exchange'];
    _currentPrice = json['current_price'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['exchange'] = _exchange;
    map['current_price'] = _currentPrice;
    return map;
  }

}