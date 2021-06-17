/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart'
    show CupertinoApp, CupertinoTheme, CupertinoThemeData;
import 'package:flutter/material.dart'
    show MaterialApp, ScaffoldMessengerState, Theme, ThemeData, ThemeMode;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart';
import 'widget_base.dart';

abstract class _BaseData {
  _BaseData({
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.restorationScopeId,
    this.scrollBehavior,
  });

  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
}

abstract class _BaseRouterData {
  _BaseRouterData({
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.highContrastDarkTheme,
    this.highContrastTheme,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.restorationScopeId,
    this.scrollBehavior,
  });

  final Key? widgetKey;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final ThemeData? highContrastDarkTheme;
  final ThemeData? highContrastTheme;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;
}

class MaterialAppData extends _BaseData {
  MaterialAppData(
      {Key? widgetKey,
      GlobalKey<NavigatorState>? navigatorKey,
      Widget? home,
      Map<String, WidgetBuilder>? routes,
      String? initialRoute,
      RouteFactory? onGenerateRoute,
      RouteFactory? onUnknownRoute,
      List<NavigatorObserver>? navigatorObservers,
      TransitionBuilder? builder,
      String? title,
      GenerateAppTitle? onGenerateTitle,
      Color? color,
      Locale? locale,
      Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
      LocaleListResolutionCallback? localeListResolutionCallback,
      LocaleResolutionCallback? localeResolutionCallback,
      Iterable<Locale>? supportedLocales,
      bool? showPerformanceOverlay,
      bool? checkerboardRasterCacheImages,
      bool? checkerboardOffscreenLayers,
      bool? showSemanticsDebugger,
      bool? debugShowCheckedModeBanner,
      Map<LogicalKeySet, Intent>? shortcuts,
      Map<Type, Action<Intent>>? actions,
      InitialRouteListFactory? onGenerateInitialRoutes,
      String? restorationScopeId,
      ScrollBehavior? scrollBehavior,
      this.theme,
      this.debugShowMaterialGrid,
      this.darkTheme,
      this.themeMode,
      this.scaffoldMessengerKey})
      : super(
          widgetKey: widgetKey,
          navigatorKey: navigatorKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          restorationScopeId: restorationScopeId,
          scrollBehavior: scrollBehavior,
        );

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
}

class MaterialAppRouterData extends _BaseRouterData {
  MaterialAppRouterData({
    Key? widgetKey,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    ScrollBehavior? scrollBehavior,
    this.theme,
    this.debugShowMaterialGrid,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
  }) : super(
          widgetKey: widgetKey,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          scrollBehavior: scrollBehavior,
        );

  final ThemeData? theme;
  final bool? debugShowMaterialGrid;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
}

class CupertinoAppData extends _BaseData {
  CupertinoAppData({
    Key? widgetKey,
    GlobalKey<NavigatorState>? navigatorKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    ScrollBehavior? scrollBehavior,
    this.theme,
  }) : super(
          widgetKey: widgetKey,
          navigatorKey: navigatorKey,
          home: home,
          routes: routes,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
          onUnknownRoute: onUnknownRoute,
          navigatorObservers: navigatorObservers,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          scrollBehavior: scrollBehavior,
        );

  final CupertinoThemeData? theme;
}

class CupertinoAppRouterData extends _BaseRouterData {
  CupertinoAppRouterData({
    Key? widgetKey,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    Color? color,
    Locale? locale,
    Map<LogicalKeySet, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    InitialRouteListFactory? onGenerateInitialRoutes,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    ScrollBehavior? scrollBehavior,
    this.theme,
  }) : super(
          widgetKey: widgetKey,
          builder: builder,
          title: title,
          onGenerateTitle: onGenerateTitle,
          color: color,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          localeListResolutionCallback: localeListResolutionCallback,
          localeResolutionCallback: localeResolutionCallback,
          supportedLocales: supportedLocales,
          showPerformanceOverlay: showPerformanceOverlay,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
          showSemanticsDebugger: showSemanticsDebugger,
          debugShowCheckedModeBanner: debugShowCheckedModeBanner,
          shortcuts: shortcuts,
          actions: actions,
          onGenerateInitialRoutes: onGenerateInitialRoutes,
          routeInformationProvider: routeInformationProvider,
          routeInformationParser: routeInformationParser,
          routerDelegate: routerDelegate,
          backButtonDispatcher: backButtonDispatcher,
          scrollBehavior: scrollBehavior,
        );

  final CupertinoThemeData? theme;
}

class PlatformApp extends PlatformWidgetBase<CupertinoApp, MaterialApp> {
  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String? title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale>? supportedLocales;
  final bool? showPerformanceOverlay;
  final bool? checkerboardRasterCacheImages;
  final bool? checkerboardOffscreenLayers;
  final bool? showSemanticsDebugger;
  final bool? debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final InitialRouteListFactory? onGenerateInitialRoutes;

  final PlatformBuilder<MaterialAppData>? material;
  final PlatformBuilder<CupertinoAppData>? cupertino;
  final PlatformBuilder<MaterialAppRouterData>? materialRouter;
  final PlatformBuilder<CupertinoAppRouterData>? cupertinoRouter;

  /// {@macro flutter.widgets.widgetsApp.routeInformationProvider}
  final RouteInformationProvider? routeInformationProvider;

  /// {@macro flutter.widgets.widgetsApp.routeInformationParser}
  final RouteInformationParser<Object>? routeInformationParser;

  /// {@macro flutter.widgets.widgetsApp.routerDelegate}
  final RouterDelegate<Object>? routerDelegate;

  /// {@macro flutter.widgets.widgetsApp.backButtonDispatcher}
  final BackButtonDispatcher? backButtonDispatcher;

  final String? restorationScopeId;

  final ScrollBehavior? scrollBehavior;

  const PlatformApp({
    Key? key,
    this.widgetKey,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.onGenerateInitialRoutes,
    this.restorationScopeId,
    this.scrollBehavior,
    this.material,
    this.cupertino,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        backButtonDispatcher = null,
        materialRouter = null,
        cupertinoRouter = null,
        super(key: key);

  const PlatformApp.router({
    Key? key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.widgetKey,
    this.builder,
    this.title,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales,
    this.showPerformanceOverlay,
    this.checkerboardRasterCacheImages,
    this.checkerboardOffscreenLayers,
    this.showSemanticsDebugger,
    this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    PlatformBuilder<MaterialAppRouterData>? material,
    PlatformBuilder<CupertinoAppRouterData>? cupertino,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        this.material = null,
        this.cupertino = null,
        materialRouter = material,
        cupertinoRouter = cupertino,
        super(key: key);

  @override
  createMaterialWidget(BuildContext context) {
    final dataRouter = materialRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null) {
      assert(dataRouter?.routerDelegate != null || routerDelegate != null);

      return MaterialApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser!,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate!,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        theme: (dataRouter?.theme ?? Theme.of(context))
            .copyWith(platform: TargetPlatform.android),
        darkTheme:
            dataRouter?.darkTheme?.copyWith(platform: TargetPlatform.android),
        highContrastDarkTheme: dataRouter?.highContrastDarkTheme,
        highContrastTheme: dataRouter?.highContrastTheme,
        themeMode: dataRouter?.themeMode ?? ThemeMode.system,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        debugShowMaterialGrid: dataRouter?.debugShowMaterialGrid ?? false,
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: dataRouter?.scaffoldMessengerKey,
        scrollBehavior: dataRouter?.scrollBehavior ?? scrollBehavior,
      );
    } else {
      final data = material?.call(context, platform(context));
      final themeData = Theme.of(context);
      final lightTheme =
          themeData.brightness == Brightness.light ? themeData : null;
      final darkTheme =
          themeData.brightness == Brightness.dark ? themeData : null;
      return MaterialApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: (data?.theme ?? lightTheme)
            ?.copyWith(platform: TargetPlatform.android),
        debugShowMaterialGrid: data?.debugShowMaterialGrid ?? false,
        darkTheme: (data?.darkTheme ?? darkTheme)
            ?.copyWith(platform: TargetPlatform.android),
        themeMode: data?.themeMode ?? ThemeMode.system,
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        highContrastDarkTheme: data?.highContrastDarkTheme,
        highContrastTheme: data?.highContrastTheme,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
        scaffoldMessengerKey: data?.scaffoldMessengerKey,
        scrollBehavior: data?.scrollBehavior ?? scrollBehavior,
      );
    }
  }

  @override
  createCupertinoWidget(BuildContext context) {
    final dataRouter = cupertinoRouter?.call(context, platform(context));

    if (routeInformationParser != null ||
        dataRouter?.routeInformationParser != null) {
      assert(dataRouter?.routerDelegate != null || routerDelegate != null);

      return CupertinoApp.router(
        routeInformationProvider:
            dataRouter?.routeInformationProvider ?? routeInformationProvider,
        routeInformationParser:
            dataRouter?.routeInformationParser ?? routeInformationParser!,
        routerDelegate: dataRouter?.routerDelegate ?? routerDelegate!,
        backButtonDispatcher:
            dataRouter?.backButtonDispatcher ?? backButtonDispatcher,
        theme: dataRouter?.theme,
        builder: dataRouter?.builder ?? builder,
        title: dataRouter?.title ?? title ?? '',
        onGenerateTitle: dataRouter?.onGenerateTitle ?? onGenerateTitle,
        color: dataRouter?.color ?? color,
        locale: dataRouter?.locale ?? locale,
        localizationsDelegates:
            dataRouter?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            dataRouter?.localeListResolutionCallback ??
                localeListResolutionCallback,
        localeResolutionCallback:
            dataRouter?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: dataRouter?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay: dataRouter?.showPerformanceOverlay ??
            showPerformanceOverlay ??
            false,
        checkerboardRasterCacheImages:
            dataRouter?.checkerboardRasterCacheImages ??
                checkerboardRasterCacheImages ??
                false,
        checkerboardOffscreenLayers: dataRouter?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            dataRouter?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: dataRouter?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        shortcuts: dataRouter?.shortcuts ?? shortcuts,
        actions: dataRouter?.actions ?? actions,
        key: dataRouter?.widgetKey ?? widgetKey,
        restorationScopeId:
            dataRouter?.restorationScopeId ?? restorationScopeId,
      );
    } else {
      final data = cupertino?.call(context, platform(context));
      return CupertinoApp(
        key: data?.widgetKey ?? widgetKey,
        navigatorKey: data?.navigatorKey ?? navigatorKey,
        home: data?.home ?? home,
        routes: data?.routes ?? routes ?? const <String, WidgetBuilder>{},
        initialRoute: data?.initialRoute ?? initialRoute,
        onGenerateRoute: data?.onGenerateRoute ?? onGenerateRoute,
        onUnknownRoute: data?.onUnknownRoute ?? onUnknownRoute,
        navigatorObservers: data?.navigatorObservers ??
            navigatorObservers ??
            const <NavigatorObserver>[],
        builder: data?.builder ?? builder,
        title: data?.title ?? title ?? '',
        onGenerateTitle: data?.onGenerateTitle ?? onGenerateTitle,
        color: data?.color ?? color,
        locale: data?.locale ?? locale,
        localizationsDelegates:
            data?.localizationsDelegates ?? localizationsDelegates,
        localeListResolutionCallback:
            data?.localeListResolutionCallback ?? localeListResolutionCallback,
        localeResolutionCallback:
            data?.localeResolutionCallback ?? localeResolutionCallback,
        supportedLocales: data?.supportedLocales ??
            supportedLocales ??
            const <Locale>[Locale('en', 'US')],
        showPerformanceOverlay:
            data?.showPerformanceOverlay ?? showPerformanceOverlay ?? false,
        checkerboardRasterCacheImages: data?.checkerboardRasterCacheImages ??
            checkerboardRasterCacheImages ??
            false,
        checkerboardOffscreenLayers: data?.checkerboardOffscreenLayers ??
            checkerboardOffscreenLayers ??
            false,
        showSemanticsDebugger:
            data?.showSemanticsDebugger ?? showSemanticsDebugger ?? false,
        debugShowCheckedModeBanner: data?.debugShowCheckedModeBanner ??
            debugShowCheckedModeBanner ??
            true,
        theme: data?.theme ?? CupertinoTheme.of(context),
        shortcuts: data?.shortcuts ?? shortcuts,
        actions: data?.actions ?? actions,
        onGenerateInitialRoutes:
            data?.onGenerateInitialRoutes ?? onGenerateInitialRoutes,
        restorationScopeId: data?.restorationScopeId ?? restorationScopeId,
      );
    }
  }
}
