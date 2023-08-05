import '../../domain/entities/gold.dart';

class GoldModel extends Gold {
  const GoldModel(
      {required double gram_price_18k,
      required double gram_price_21k,
      required double gram_price_24k})
      : super(
            gram_price_18k: gram_price_18k,
            gram_price_21k: gram_price_21k,
            gram_price_24k: gram_price_24k);

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      gram_price_18k: json['gram_price_18k'],
      gram_price_21k: json['gram_price_21k'],
      gram_price_24k: json['gram_price_24k'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gram_price_18k':gram_price_18k,
      'gram_price_21k':gram_price_21k,
      'gram_price_24k':gram_price_24k,
    };
  }
}
