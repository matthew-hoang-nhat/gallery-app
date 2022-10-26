import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';

import '../widgets/half_circle.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final dropDownItems = ['Dropdown', 'Hello', 'World', 'Vietnam'];
  late String dropdownItem = dropDownItems.first;
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button View'),
        leading: const Icon(Icons.arrow_back, color: AppColors.green),
        actions: const [
          Icon(Icons.close, color: AppColors.red),
          Icon(Icons.more_vert_rounded),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: DropdownButton<String>(
                    hint: const Text('DropDownButton'),
                    items: dropDownItems
                        .map((String e) =>
                            DropdownMenuItem<String>(value: e, child: Text(e)))
                        .toList(),
                    // value: dropdownItem,
                    onChanged: (value) {}),
              ),
              DropdownButtonFormField(
                  hint: const Text('DropdownButtonFormField'),
                  items: dropDownItems
                      .map((String e) =>
                          DropdownMenuItem<String>(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (value) {}),
              const Icon(
                CupertinoIcons.plus_app_fill,
                size: 30,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Elevated Button'))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('Elevated Button Icon')),
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Text Button'))),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('Text Button Icon')),
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Outlined Button'))),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    label: const Text('Outlined Button Icon')),
              ),
              CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: const Text(
                        'Cupertino Button',
                        style: TextStyle(color: AppColors.white),
                      )),
                  onPressed: () {}),
              MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  onPressed: () {},
                  child: CustomPaint(
                      painter: ShapePainter(),
                      child: Container(
                          height: 40,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: const Text('Material Button')))),
              RawMaterialButton(
                  onPressed: () {},
                  child: CustomPaint(
                    painter: ShapePainter(),
                    child: Container(
                        height: 40,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text('Raw material Button')),
                  )),
              Row(
                children: [
                  customRadioButton('Option 1', 0),
                  customRadioButton('Option 2', 1),
                  customRadioButton('Option 3', 2),
                ],
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(CupertinoIcons.plus),
              )
            ]),
      ),
    );
  }

  Widget customRadioButton(String text, int index) {
    return InkWell(
      onTap: () {
        value = index;
        setState(() {});
      },
      child: Container(
        height: 50,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey, width: 2),
            color: (value == index)
                ? AppColors.blue.withOpacity(0.2)
                : AppColors.white),
        child: Text(
          text,
          style: TextStyle(
            color: (value == index) ? AppColors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}
