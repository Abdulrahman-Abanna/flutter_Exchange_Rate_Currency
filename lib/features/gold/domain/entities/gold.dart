import 'package:equatable/equatable.dart';

class Gold extends Equatable {
  final double gram_price_18k;
  final double gram_price_21k;
  final double gram_price_24k;

  const Gold(
      {required this.gram_price_18k,
      required this.gram_price_21k,
      required this.gram_price_24k});
  @override
  List<Object?> get props => [gram_price_18k, gram_price_21k, gram_price_24k];
}
