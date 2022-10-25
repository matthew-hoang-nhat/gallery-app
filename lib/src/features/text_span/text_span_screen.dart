import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constants/app_colors.dart';

class TextSpanScreen extends StatelessWidget {
  const TextSpanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text View'),
      ),
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Row(),
            const Text(
              'Create a text widget. If [style] argument is null, the text will use the style from the ...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.pink_3,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            RichText(
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                  const TextSpan(
                      text: 'First ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const WidgetSpan(
                      child: Icon(
                    Icons.arrow_right_alt,
                    color: AppColors.red,
                  )),
                  const TextSpan(
                      text: 'Second ',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: 30,
                      )),
                  WidgetSpan(
                    child: Container(
                      height: 70,
                      width: 70,
                      color: AppColors.yellow,
                    ),
                  ),
                  const TextSpan(
                      text: ' Third',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: 30,
                      ))
                ])),
            RichText(
              text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'One ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Two ',
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )),
                    TextSpan(
                        text: 'Three ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Four ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Five ',
                        style: TextStyle(
                          color: AppColors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  ]),
            ),
            RichText(
                text: const TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                  TextSpan(
                      text: 'G',
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.blue,
                          backgroundColor: AppColors.pink_2)),
                  TextSpan(
                      text: 'o',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.red,
                          backgroundColor: AppColors.pink_1)),
                  TextSpan(
                      text: 'o',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellow,
                          backgroundColor: AppColors.pink_3)),
                  TextSpan(
                      text: 'g',
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.blue,
                          backgroundColor: AppColors.pink_2)),
                  TextSpan(
                      text: 'l',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.green,
                          backgroundColor: AppColors.pink_1)),
                  TextSpan(
                      text: 'e',
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColors.red,
                          backgroundColor: AppColors.pink_2)),
                ]))
          ])),
    );
  }
}
