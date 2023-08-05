
import '../../domain/entities/currency.dart';

class CurrenciesModel extends Currency {
  const CurrenciesModel(
      {
      required double USD,
      required double SAR,
      required double EUR,
      required double AED,
      required double KWD,
      required double EGP,
      required double OMR,
      required double QAR,
      required double XAU
      })
      : super(
            USD: USD,
            SAR: SAR,
            EUR: EUR,
            AED: AED,
            KWD: KWD,
            EGP: EGP,
            OMR: OMR,
            QAR: QAR,
            XAU: XAU,
            );

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) {
    return CurrenciesModel(
        USD: json['USD']!.toDouble(),
        SAR: json['SAR']!.toDouble(),
        EUR: json['EUR']!.toDouble(),
        AED: json['AED']!.toDouble(),
        KWD: json['KWD']!.toDouble(),
        EGP: json['EGP']!.toDouble(),
        OMR: json['OMR']!.toDouble(),
        QAR: json['QAR']!.toDouble(),
        XAU: json['XAU']!.toDouble()
        );
  }

  Map<String, dynamic> toJson() {
    return {
      'USD': USD,
      'SAR': SAR,
      'EUR': EUR,
      'AED': AED,
      'KWD': KWD,
      'EGP': EGP,
      'OMR': OMR,
      'QAR': QAR,
      'XAU': XAU,
    };
  }
}
