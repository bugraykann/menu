import 'package:flutter/material.dart';
import 'package:menu_demo/core/base/context_extensions.dart';
import 'package:menu_demo/view/wine/wine_view.dart';

import '../core/widgets/button_widgets.dart';
import '../core/widgets/logo.dart';
import '../ui/utils/scfBackground.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScaffoldBackgroundImageWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logonun bulunduğu widget
                const Expanded(
                  flex: 5,
                  child: LogoImageWidget(),
                ),
                const Spacer(),
                //ListView Builder Kullanıldı çünkü daha sonrasında yeni bir kategori eklenirse dinamik olarak anasayfada yer almalı
                Expanded(
                  flex: 2,
                  child: _menuButtons(context),
                ),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _menuButtons(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      padding: context.paddingPageSymetricV / 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: context.paddingPageSymetricH / 6,
          child: SpButton(
            text: 'WINE & COCTAILS',
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WineView(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
