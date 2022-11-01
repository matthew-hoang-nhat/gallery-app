import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/bottom_appbar_view/cubit/bottom_appbar_cubit.dart';

import '../widgets/me_switch.dart';

enum FloatActionButtonPositionEnum {
  dockedEnd,
  dockedCenter,
  floatingEnd,
  floatingCenter,
}

// ignore: must_be_immutable
class BottomAppBarViewScreen extends StatelessWidget {
  BottomAppBarViewScreen({super.key});

  var radioSelect;

  @override
  Widget build(BuildContext context) {
    final navigationItems = [
      const Icon(Icons.settings),
      const SizedBox(width: 20),
      const Icon(CupertinoIcons.search),
      const SizedBox(width: 20),
      const Icon(CupertinoIcons.heart_fill),
    ];

    final bloc = context.read<BottomAppBarCubit>();
    radioSelect = bloc.state.floatingActionButtonLocation;

    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Bottom App Bar View'),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: bloc.state.isNotchMargin ? 20 : 0,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: navigationItems),
            ),
          ),
          floatingActionButton: bloc.state.isFloatActionButton == true
              ? FloatingActionButton(
                  tooltip: 'Increment Counter',
                  onPressed: () {},
                  child: const Icon(Icons.add),
                )
              : null,
          floatingActionButtonLocation: bloc.state.floatingActionButtonLocation,
          body: SafeArea(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Float Action Button',
                    ),
                    MeSwitchBottomAppBar<BottomAppBarCubit>(
                      addEvent: () {
                        bloc.addNewEvent(BottomAppBarEnum.floatActionButton);
                      },
                      initValue: bloc.state.isFloatActionButton,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Notch'),
                    MeSwitchBottomAppBar<BottomAppBarCubit>(
                      addEvent: () {
                        bloc.addNewEvent(BottomAppBarEnum.notMargin);
                      },
                      initValue: bloc.state.isNotchMargin,
                    )
                  ],
                ),
                const Divider(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Float action Button Position',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                radioWidget(bloc),
              ],
            ),
          ))),
    );
  }

  Column radioWidget(BottomAppBarCubit bloc) => Column(
        children: [
          ListTile(
            title: const Text('Docked - End'),
            leading: Radio(
              value: FloatingActionButtonLocation.endDocked,
              groupValue: radioSelect,
              onChanged: (value) {
                radioSelect = value!;
                bloc.addNewEvent(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Docked - Center'),
            leading: Radio(
              value: FloatingActionButtonLocation.centerDocked,
              groupValue: radioSelect,
              onChanged: (value) {
                radioSelect = value!;
                bloc.addNewEvent(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Floating - End'),
            leading: Radio(
              value: FloatingActionButtonLocation.endFloat,
              groupValue: radioSelect,
              onChanged: (value) {
                radioSelect = value!;
                bloc.addNewEvent(value);
              },
            ),
          ),
          ListTile(
            title: const Text('Floating - Center'),
            leading: Radio(
              value: FloatingActionButtonLocation.centerFloat,
              groupValue: radioSelect,
              onChanged: (value) {
                radioSelect = value!;
                bloc.addNewEvent(value);
              },
            ),
          ),
        ],
      );
}
