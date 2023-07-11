import 'package:flutter/material.dart';
import 'package:menu_demo/core/base/context_extensions.dart';
import 'package:menu_demo/core/widgets/button_widgets.dart';
import 'package:menu_demo/core/widgets/logo.dart';
import 'package:menu_demo/provider/wine_provider.dart';
import 'package:menu_demo/ui/utils/scfBackground.dart';
import 'package:provider/provider.dart';

class SampleView extends StatefulWidget {
  const SampleView({super.key});

  @override
  State<SampleView> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WineProvider>(builder: (context, wine, child) {
        final wines = wine.wines;
        return Stack(
          children: [
            const ScaffoldBackgroundImageWidget(),
            FutureBuilder(
                future: wine.fetchWines(),
                builder: (context, snapshot) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: CustomAppBar(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: context.paddingPageSymetricH / 4 +
                                context.paddingPageSymetricV / 6,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: GridView.builder(
                                padding: context.paddingPageSymetricV / 3 +
                                    context.paddingPageSymetricH / 2,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 20,
                                        mainAxisSpacing: 20,
                                        crossAxisCount: 4),
                                itemCount: wines.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final wine = wines[index];
                                  return Card(
                                    elevation: 10,
                                    color: Colors.blueGrey.shade800,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width:
                                                      context.dynamicWidth(0.2),
                                                  height: context
                                                      .dynamicHeight(0.2),
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/images/wine.png",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  wine.title!,
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            wine.details!,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        );
      }),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
