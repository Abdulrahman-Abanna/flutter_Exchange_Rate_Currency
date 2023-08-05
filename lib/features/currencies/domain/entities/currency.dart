import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final double USD;
  final double SAR;
  final double EUR;
  final double AED;
  final double KWD;
  final double EGP;
  final double OMR;
  final double QAR;
  final double XAU;

  const Currency({
      required this.USD,
      required this.SAR,
      required this.EUR,
      required this.AED,
      required this.KWD,
      required this.EGP,
      required this.OMR,
      required this.QAR,
      required this.XAU
      });

  @override
  List<Object?> get props => [USD, SAR, EUR, AED, KWD, EGP, OMR, QAR,XAU];
}
