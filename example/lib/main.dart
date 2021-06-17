import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'extensions.dart';
import 'icons_page.dart';
import 'logo.dart';
import 'material_ios_page.dart';
import 'platform_widget_example.dart';
import 'tab_impl_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cupertinoTheme = CupertinoThemeData(
      primaryColor: Color(0xff127EFB),
    );

    final materialTheme = ThemeData(
      primarySwatch: Colors.green,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
          foregroundColor: MaterialStateProperty.all(Color(0xFF3DDC84)),
        ),
      ),
    );

    return PlatformTheme(
      //primaryColor: Colors.green, // both platforms will get this color
      materialTheme: materialTheme,
      cupertinoTheme: cupertinoTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          home: PlatformPage(),
        ),
      ),
    );
  }
}

class PlatformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Flutter Platform Widgets'),
      ),
      body: ListView(
        children: [
          FlutterPlatformWidgetsLogo(size: 60),
          Divider(thickness: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformElevatedButton(
                child: PlatformText('Change Platform'),
                onPressed: () {
                  final p = PlatformProvider.of(context)!;

                  isMaterial(context)
                      ? p.changeToCupertinoPlatform()
                      : p.changeToMaterialPlatform();
                }),
          ),
          Divider(thickness: 10),
          // ! PlatformText
          PlatformWidgetExample(
            title: 'PlatformText',
            builder: (_, platform) => PlatformText(
              '${platform.text} Text',
              textAlign: TextAlign.center,
            ),
          ),
          // ! PlatformWidget
          PlatformWidgetExample(
            title: 'PlatformWidget',
            builder: (_, platform) => PlatformWidget(
              material: (_, __) => Text(
                'Showing ${platform.text}',
                textAlign: TextAlign.center,
              ),
              cupertino: (_, __) => Text(
                'Showing ${platform.text}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // ! PlatformButton
          PlatformWidgetExample(
            title: 'PlatformButton',
            builder: (_, platform) => PlatformButton(
              child: Text(platform.text),
              onPressed: () => print('${platform.text} PlatformButton'),
            ),
          ),
          PlatformWidgetExample(
            title: 'Flat/Filled PlatformButton',
            builder: (_, platform) => PlatformButton(
              materialFlat: (_, __) => MaterialFlatButtonData(),
              cupertinoFilled: (_, __) =>
                  CupertinoFilledButtonData(padding: const EdgeInsets.all(0)),
              child: Text(platform.text),
              onPressed: () {},
            ),
          ),
          // ! PlatformElevatedButton
          PlatformWidgetExample(
            title: 'PlatformElevatedButton',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => print('${platform.text} PlatformButton'),
              padding: const EdgeInsets.all(8),
            ),
          ),
          PlatformWidgetExample(
            title: 'PlatformElevatedButton Icon',
            builder: (_, platform) => PlatformElevatedButton(
              child: Text(platform.text),
              onPressed: () => print('${platform.text} PlatformButton'),
              padding: const EdgeInsets.all(8),
              material: (_, __) => MaterialElevatedButtonData(
                icon: Icon(Icons.home),
              ),
              cupertino: (_, __) => CupertinoElevatedButtonData(
                originalStyle: true,
              ),
            ),
          ),
          // ! PlatformTextButton
          PlatformWidgetExample(
            title: 'PlatformTextButton',
            builder: (_, platform) => PlatformTextButton(
              child: Text(platform.text),
              onPressed: () => print('${platform.text} PlatformButton'),
              padding: const EdgeInsets.all(8),
            ),
          ),
          PlatformWidgetExample(
            title: 'PlatformTextButton Icon',
            builder: (_, platform) => PlatformTextButton(
              child: Text(platform.text),
              onPressed: () => print('${platform.text} PlatformButton'),
              padding: const EdgeInsets.all(8),
              material: (_, __) => MaterialTextButtonData(
                icon: Icon(Icons.home),
              ),
              cupertino: (_, __) => CupertinoTextButtonData(
                originalStyle: true,
              ),
            ),
          ),
          // ! PlatformSwitch
          PlatformWidgetExample(
            title: 'PlatformSwitch',
            builder: (_, __) => StateProvider<bool>(
              initialValue: false,
              builder: (_, value, setValue) => PlatformSwitch(
                onChanged: setValue,
                value: value,
              ).center,
            ),
          ),
          // ! PlatformSlider
          PlatformWidgetExample(
            title: 'PlatformSlider',
            builder: (_, __) => StateProvider<double>(
              initialValue: 0.5,
              builder: (_, value, setValue) => PlatformSlider(
                onChanged: setValue,
                value: value,
              ),
            ),
          ),

          // ! PlatformIconButton
          PlatformWidgetExample(
            title: 'PlatformIconButton',
            builder: (context, __) => PlatformIconButton(
              icon: Icon(context.platformIcons.folder),
              onPressed: () {},
            ),
          ),
          // ! PlatformTextField
          PlatformWidgetExample(
            title: 'PlatformTextField',
            builder: (_, platform) =>
                PlatformTextField(hintText: platform.text),
          ),
          PlatformWidgetExample(
            title: 'PlatformTextField multiline',
            builder: (_, platform) => SizedBox(
              height: 100,
              child: PlatformTextField(
                hintText: platform.text,
                expands: true,
                maxLines: null,
              ),
            ),
          ),
          // ! PlatformTextFormField
          PlatformWidgetExample(
            title: 'PlatformTextFormField',
            builder: (_, platform) => PlatformTextFormField(
              hintText: 'hint',
              validator: (value) =>
                  (value?.length ?? 0) < 3 ? 'Not enough' : null,
              autovalidateMode: AutovalidateMode.always,
            ),
          ),
          // ! PlatformCircularProgressIndicator
          // _PlatformWidgetExample(
          //   title: 'PlatformCircularProgressIndicator',
          //   builder: (_) => PlatformCircularProgressIndicator().center,
          // ),
          // ! PlatformWidgetBuilder
          PlatformWidgetExample(
            title: 'PlatformWidgetBuilder',
            builder: (_, platform) => PlatformWidgetBuilder(
              cupertino: (_, child, __) => GestureDetector(
                child: child,
                onTap: () => print('Cupertino PlatformWidgetBuilder'),
              ),
              material: (_, child, __) => InkWell(
                child: child,
                onTap: () => print('Material PlatformWidgetBuilder'),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: PlatformText('Tap me (${platform.text})').center,
              ),
            ),
          ),
          // ! platformThemeData
          PlatformWidgetExample(
            title: 'platformThemeData',
            builder: (context, platform) => Text(
              platform.text,
              textAlign: TextAlign.center,
              style: platformThemeData(
                context,
                material: (data) => data.textTheme.headline5,
                cupertino: (data) => data.textTheme.navTitleTextStyle,
              ),
            ),
          ),
          // ! Dialogs
          PlatformWidgetExample(
            title: 'showPlatformDialog',
            builder: (context, platform) => PlatformButton(
              child: Text(platform.text),
              onPressed: () => _showExampleDialog(context, platform.text),
            ),
          ),
          // ! Bottomsheet
          PlatformWidgetExample(
            title: 'showPlatformModalSheet',
            builder: (context, platform) => PlatformButton(
              child: Text(platform.text),
              onPressed: () => _showPopupSheet(context, platform.text),
            ),
          ),
          // ! Tab pages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformButton(
              child: Text('Show Tabbed Pages'),
              onPressed: () => Navigator.of(context).push(
                platformPageRoute(
                  context: context,
                  builder: (context) => TabImplementationPage(),
                ),
              ),
            ),
          ),
          // ! Icons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformButton(
              child: Text('Show Platform Icons'),
              onPressed: () => Navigator.of(context).push(
                platformPageRoute(
                  context: context,
                  builder: (context) => IconsPage(),
                ),
              ),
            ),
          ),
          // ! Material on iOS
          if (isCupertino(context))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PlatformButton(
                child: Text('Show Material on iOS'),
                onPressed: () => Navigator.of(context).push(
                  platformPageRoute(
                    context: context,
                    builder: (context) => IosMaterialPage(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

_showExampleDialog(BuildContext context, String text) {
  showPlatformDialog(
    context: context,
    builder: (_) => PlatformAlertDialog(
      title: Text('Alert'),
      content: Text('$text content'),
      actions: <Widget>[
        PlatformDialogAction(
          material: (_, __) => MaterialDialogActionData(),
          cupertino: (_, __) => CupertinoDialogActionData(),
          child: PlatformText('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        PlatformDialogAction(
          child: PlatformText('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

_showPopupSheet(BuildContext context, String text) {
  showPlatformModalSheet(
    context: context,
    builder: (_) => PlatformWidget(
      material: (_, __) => _androidPopupContent(context, text),
      cupertino: (_, __) => _cupertinoSheetContent(context, text),
    ),
  );
}

Widget _androidPopupContent(BuildContext context, String text) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: PlatformText('Option 1 $text'),
          ),
          onTap: () => Navigator.pop(context),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: PlatformText('Option 2 $text'),
          ),
          onTap: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Widget _cupertinoSheetContent(BuildContext context, String text) {
  return CupertinoActionSheet(
    title: Text('$text Favorite Dessert'),
    message:
        const Text('Please select the best dessert from the options below.'),
    actions: <Widget>[
      CupertinoActionSheetAction(
        child: const Text('Profiteroles'),
        onPressed: () {
          Navigator.pop(context, 'Profiteroles');
        },
      ),
      CupertinoActionSheetAction(
        child: const Text('Cannolis'),
        onPressed: () {
          Navigator.pop(context, 'Cannolis');
        },
      ),
      CupertinoActionSheetAction(
        child: const Text('Trifle'),
        onPressed: () {
          Navigator.pop(context, 'Trifle');
        },
      ),
    ],
    cancelButton: CupertinoActionSheetAction(
      child: const Text('Cancel'),
      isDefaultAction: true,
      onPressed: () {
        Navigator.pop(context, 'Cancel');
      },
    ),
  );
}

class StateProvider<T> extends StatefulWidget {
  final T initialValue;
  final Widget Function(
    BuildContext context,
    T value,
    void Function(T) setValue,
  ) builder;

  const StateProvider({
    Key? key,
    required this.builder,
    required this.initialValue,
  }) : super(key: key);

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends State<StateProvider<T>> {
  late T state;

  @override
  void initState() {
    super.initState();

    state = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      state,
      (T newValue) => setState(() => state = newValue),
    );
  }
}
