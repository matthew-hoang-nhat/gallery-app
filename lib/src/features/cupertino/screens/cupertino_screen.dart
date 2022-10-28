import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';

class CupertinoScreen extends StatefulWidget {
  const CupertinoScreen({super.key});

  @override
  State<CupertinoScreen> createState() => _CupertinoScreenState();
}

class _CupertinoScreenState extends State<CupertinoScreen> {
  var valueSlider = 0.0;
  var valueSlider2 = 0.0;
  var valueSwitch = false;
  var valueSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          leading: Icon(CupertinoIcons.back, color: AppColors.grey),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: 'Widget'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.folder), label: 'Modal'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.doc_text), label: 'From')
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return screen();
          },
        ),
      ),
    );
  }

  screen() {
    return SafeArea(
        child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text('Widgets',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const Divider(),
          const Center(child: Text('Pull to refresh')),
          const SizedBox(height: 20),
          const Text(
            'Indicator',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const Center(child: CupertinoActivityIndicator()),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Button',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Center(
            child: Column(
              children: [
                CupertinoButton(child: const Text('Button'), onPressed: () {}),
                CupertinoButton(
                    color: AppColors.blue,
                    child: const Text('With background'),
                    onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Slider',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Center(
            child: CupertinoSlider(
                value: valueSlider,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    valueSlider = value.roundToDouble();
                  });
                }),
          ),
          Center(
            child: CupertinoSlider(
                value: valueSlider2,
                min: 0.0,
                max: 100.0,
                onChanged: (value) {
                  setState(() {
                    valueSlider2 = value.roundToDouble();
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Switch',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSwitch(
                  value: valueSwitch,
                  onChanged: (value) {
                    valueSwitch = value;
                    setState(() {});
                  }),
              CupertinoSwitch(
                  value: valueSwitch2,
                  onChanged: (value) {
                    valueSwitch2 = value;
                    setState(() {});
                  })
            ],
          ),
        ],
      ),
    ));
  }
}
