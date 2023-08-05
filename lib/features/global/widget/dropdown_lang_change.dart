import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../language_cubit/cubit/language_cubit.dart';
import '../model/language_model.dart';

class ChangeLanguageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<LanguageData>(
      items: LanguageData.LanguageList()
          .map<DropdownMenuItem<LanguageData>>(
              (value) => DropdownMenuItem<LanguageData>(
                    value: value,
                    child: Text(
                      value.name,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
          .toList(),
      onChanged: (LanguageData? language) {
        context.read<LanguageCubit>().ChangeLanguage(language!.languageCode);
      },
      icon: Icon(Icons.language_outlined, color: Colors.white),
      underline: Container(),
      borderRadius: BorderRadius.circular(12.0),
      dropdownColor: Color.fromRGBO(238, 187, 195, 1),
    );
  }
}
