import 'package:flutter/material.dart';
import '../../../../../core/localization/language/languages.dart';
import '../../../../gold/presentation/pages/gold_page.dart';
import 'headerdrawer.dart';
import 'itemdrawer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            HeaderDrawer(),
            ItemDrawer(
              title: Languages.of(context)!.Gold_prices,
              icons: 'assets/images/icons8-gold-bars-48.png',
              onTap: GoldPage(),
            ),
            ItemDrawer(
              title: Languages.of(context)!.Feedback,
              icons: 'assets/images/icons8-feedback-hub-48.png',
              checktypeitemdrawer: true,
              typefunction: 'feedback',
            ),
            ItemDrawer(
              title: Languages.of(context)!.develop_programming,
              icons: 'assets/images/icons8-developer-mode-48.png',
              checktypeitemdrawer: true,
            ),
          ],
        ),
      ),
    );
  }
}
