import 'package:flutter/material.dart';
import 'package:menu_demo/core/base/context_extensions.dart';
import 'package:menu_demo/core/widgets/button_widgets.dart';
import 'package:menu_demo/core/widgets/logo.dart';
import 'package:menu_demo/ui/utils/scfBackground.dart';
import 'package:menu_demo/view/wine/sample_view.dart';

class WineView extends StatefulWidget {
  const WineView({super.key});

  @override
  State<WineView> createState() => _WineViewState();
}

class _WineViewState extends State<WineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ScaffoldBackgroundImageWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Spacer(),
                      const Expanded(
                        flex: 2,
                        child: Align(child: LogoImageWidget()),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SpButton(
                          text: 'WINE & COCTAILS',
                          ontap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: context.paddingPageSymetricV / 3 +
                        context.paddingPageSymetricH / 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 4),
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SpButton(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SampleView(),
                            ),
                          );
                        },
                        text: 'Red Wine',
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
