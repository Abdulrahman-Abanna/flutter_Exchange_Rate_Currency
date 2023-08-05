part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
    LanguageState({required this.locale});

  @override
  List<Object> get props => [locale];
}
