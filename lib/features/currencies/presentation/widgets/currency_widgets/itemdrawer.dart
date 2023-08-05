import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/localization/language/languages.dart';

class ItemDrawer extends StatelessWidget {
  final String title;
  final String icons;
  final onTap;
  final bool? checktypeitemdrawer;
  final String? typefunction;

  const ItemDrawer(
      {Key? key,
      required this.title,
      required this.icons,
      this.onTap,
      this.checktypeitemdrawer,
      this.typefunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: ListTile(
          title: Text(
            title.toString(),
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          leading: Image.asset(icons.toString(),fit: BoxFit.cover,scale:1.5 ,),
          onTap: () {
            if (checktypeitemdrawer == true) {
              if (typefunction == 'feedback') {
                calllauncherEmail();
              } else {
                Navigator.of(context).pop();
                _DeveloperBuild(context);
              }
            } else {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => onTap),
              );
            }
          },
        ),
      ),
    );
  }

  void calllauncherEmail() async {
    if (await canLaunchUrl(Uri.parse(AppConstants.recipientEmail))) {
      await launchUrlString(AppConstants.recipientEmail);
    } else {
      print("Error Launch");
    }
  }

  _DeveloperBuild(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(238, 187, 195, 1),
          title: Text(
            Languages.of(context)!.developandprogramming,
          ),
          content: Text(
            Languages.of(context)!.name_developer,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/icons8-whatsapp-96.png'),
                  ),
                  onTap: () {
                    _Calllauncherall();
                  },
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/icons8-phone-96.png'),
                  ),
                  onTap: () {
                    _Calllauncherall(typecall: 'phone');
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void _Calllauncherall({String? typecall}) async {
    var url;

    if (typecall == 'phone') {
      url = AppConstants.PhoneNumber;
    } else {
      url = "whatsapp://send?phone=" + AppConstants.PhoneNumberWhats + "";
    }

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrlString(url);
    } else {
      print('Error call');
    }
  }
}
