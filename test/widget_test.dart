import 'package:bitcoin_tracker/helpers/constants.dart';
import 'package:bitcoin_tracker/providers/api.dart';
import 'package:bitcoin_tracker/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Widget test for BitcoinTrackerHome page',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => APIManager()),
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: BitcoinTrackerHome(),
        ),
      ),
    );

    expect(find.text(Constants.appName), findsOneWidget);
    expect(find.byKey(const Key("logo")), findsOneWidget);
    expect(find.text(Constants.currentPriceText), findsOneWidget);
    expect(find.byKey(const Key("selector")), findsOneWidget);
  });
}
