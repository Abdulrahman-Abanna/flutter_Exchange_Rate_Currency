import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/localization/localization_delegate.dart';
import 'core/themes/app_theme.dart';
import 'features/currencies/presentation/state_managements/bloc/currencies_bloc.dart';
import 'features/currencies/presentation/state_managements/cubit/select_currency_cubit.dart';
import 'features/global/language_cubit/cubit/language_cubit.dart';
import 'features/gold/presentation/state_managements/cubit/gold_cubit.dart';
import 'injection_container.dart' as di;
import 'features/splash_page/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<CurrenciesBloc>()..add(GetCurrenciesEvent()),
        ),
        BlocProvider(
          create: (context) => SelectCurrencyCubit(),
        ),
        BlocProvider(create: (_) => di.sl<GoldCubit>()),
        BlocProvider(
          create: (context) => LanguageCubit()..getSavedLanguage(),
        )
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            locale: state.locale,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              debugShowCheckedModeBanner: false,
              title: 'Gold_Currency',
              theme: appTheme,
              home: SplashScrean(),
              supportedLocales: [
                Locale('ar'),
                Locale('en'),
              ],
              localizationsDelegates: [
                AppLocalizationDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              });
        },
      ),
    );
  }
}
