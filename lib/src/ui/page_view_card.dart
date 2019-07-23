import 'package:flutter_course/src/ui/responsive_layout.dart';
import 'package:flutter_web/material.dart';

class _PageSelector extends StatelessWidget {
  const _PageSelector();

  void _handleArrowButtonPress(BuildContext context, int delta) {
    final TabController controller = DefaultTabController.of(context);
    if (!controller.indexIsChanging)
      controller.animateTo((controller.index + delta).clamp(0, 3));
  }

  @override
  Widget build(BuildContext context) {
    final TabController controller = DefaultTabController.of(context);
    final Color color = Theme.of(context).accentColor;
    return Container(
      height: ResponsiveWidget.isSmallScreen(context)
          ? 250
          : ResponsiveWidget.isMediumScreen(context) ? 350 : 500.0,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveWidget.isSmallScreen(context) ? 0.0 : 70.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.chevron_left),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, -1);
                    },
                    tooltip: 'Page back'),
                Expanded(
                  child: TabBarView(
                    children: [
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: "Sviluppo rapido e produttivo\n",
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 25.0
                                                : 30.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            "Disegna la tua app in pochi millisecondi "
                                            "grazie all\'Hot Reload. Utilizza un ricco "
                                            "set di widget completamente personalizzabili "
                                            "per creare interfacce native in pochi minuti.",
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 15.0
                                                    : 20.0),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ResponsiveWidget.isSmallOrMediumScreen(context)
                                ? Container()
                                : Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        'gif/fast.gif',
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ResponsiveWidget.isSmallOrMediumScreen(context)
                                ? Container()
                                : Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        'gif/reflectly.gif',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: "UI espressive\n",
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 25.0
                                                : 30.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            'Grazie ai pacchetti di widget stile '
                                            'Android e iOS potrai creare '
                                            'l\'interfaccia perfetta. Inoltre '
                                            'sentiti libero di creare il tuo '
                                            'stile controllando ogni singolo '
                                            'pixel dello schermo.',
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 15.0
                                                    : 20.0),
                                      )
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text.rich(
                                  TextSpan(
                                    text: "Performance native\n",
                                    style: TextStyle(
                                        fontSize:
                                            ResponsiveWidget.isSmallScreen(
                                                    context)
                                                ? 25.0
                                                : 30.0),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Grazie al motore grafico Skia, "
                                            "Flutter renderizza "
                                            "l\'interffaccia direttamente sul "
                                            "display, e compilando il codice in nativo si ottengono ottime performance.",
                                        style: TextStyle(
                                            fontSize:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 15.0
                                                    : 20.0),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            ResponsiveWidget.isSmallOrMediumScreen(context)
                                ? Container()
                                : Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        'gif/native.gif',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.chevron_right),
                    color: color,
                    onPressed: () {
                      _handleArrowButtonPress(context, 1);
                    },
                    tooltip: 'Page forward')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabPageSelector(controller: controller),
          ),
        ],
      ),
    );
  }
}

class PageSelectorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: _PageSelector(),
    );
  }
}
