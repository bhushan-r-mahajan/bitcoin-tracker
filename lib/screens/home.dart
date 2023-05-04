import 'package:bitcoin_tracker/helpers/constants.dart';
import 'package:bitcoin_tracker/providers/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BitcoinTrackerHome extends StatefulWidget {
  const BitcoinTrackerHome({super.key});

  @override
  State<BitcoinTrackerHome> createState() => _BitcoinTrackerHomeState();
}

class _BitcoinTrackerHomeState extends State<BitcoinTrackerHome> {
  var backgroundColor = Colors.grey[900];

  @override
  void initState() {
    super.initState();
    callApi();
  }

  void callApi() async {
    var apiProvider = Provider.of<APIManager>(context, listen: false);
    await apiProvider.getCurrentPrice();
  }

  @override
  Widget build(BuildContext context) {
    var apiProvider = Provider.of<APIManager>(context, listen: true);
    double imageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: _buildTextWithStyle(20, Constants.appName),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff212121), Color(0xff424242)],
            ),
          ),
        ),
        elevation: 3,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff212121), Color(0xff424242)],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              Constants.bitcoinLogo,
              key: const Key("logo"),
              height: imageHeight * 0.3,
              width: imageHeight * 0.5,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextWithStyle(20, Constants.currentPriceText),
                _buildTextWithStyle(20, apiProvider.currentPrice.toString()),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: CupertinoPicker.builder(
                key: const Key("selector"),
                selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                  background: Colors.lightGreenAccent.withOpacity(0.2),
                ),
                childCount: apiProvider.currencyArray.length,
                itemExtent: 50,
                onSelectedItemChanged: (int? value) {
                  apiProvider.selectPriceToDisplay(
                    apiProvider.currencyArray[value!],
                  );
                },
                itemBuilder: (context, index) {
                  var value = apiProvider.currencyArray[index];
                  return _buildSelectorTile(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWithStyle(double fontSize, String text) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  Widget _buildSelectorTile(String value) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      color: Colors.transparent,
      child: _buildTextWithStyle(18, value),
    );
  }
}
