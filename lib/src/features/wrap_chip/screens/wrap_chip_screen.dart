import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/wrap_chip/cubit/wrap_chip_cubit.dart';

import '../../../config/constants/app_colors.dart';
import '../widgets/me_switch.dart';
import '../widgets/me_wrap_chip_drop_down.dart';

enum ShapeEnum { rectangle, square, meDefault }

class WrapChipScreen extends StatefulWidget {
  const WrapChipScreen({super.key});

  @override
  State<WrapChipScreen> createState() => _WrapChipScreenState();
}

class _WrapChipScreenState extends State<WrapChipScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<WrapChipCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap View')),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 30),
          BlocBuilder<WrapChipCubit, WrapChipState>(
            builder: (BuildContext context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Wrap(
                  runSpacing: state.runSpacing,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Chip Chip',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: state.spacing,
                          children: [
                            Chip(
                              shape: state.shape,
                              label: const Text('Chip'),
                              elevation: state.elevation,
                              avatar: state.avatar,
                              onDeleted:
                                  state.deleteIconFunc == null ? null : () {},
                            ),
                            ActionChip(
                              shape: state.shape,
                              label: const Text('ActionChip'),
                              elevation: state.elevation,
                              avatar: state.avatar,
                            ),
                            RawChip(
                              shape: state.shape,
                              label: const Text('RawChip'),
                              elevation: state.elevation,
                              avatar: state.avatar,
                              onDeleted:
                                  state.deleteIconFunc == null ? null : () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Choice Chip',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: state.spacing,
                          children: [
                            ChoiceChip(
                              shape: state.shape,
                              label: const Text('Disable'),
                              selected: false,
                              disabledColor: Colors.black12,
                              elevation: state.elevation,
                              avatar: state.avatar,
                            ),
                            ChoiceChip(
                              shape: state.shape,
                              elevation: state.elevation,
                              label: const Text(
                                'Small',
                                style: TextStyle(color: Colors.blue),
                              ),
                              selected: true,
                              selectedColor: Colors.blue.withOpacity(0.3),
                              avatar: state.avatar,
                            ),
                            ChoiceChip(
                              shape: state.shape,
                              label: const Text('Large'),
                              selectedColor: AppColors.grey.withOpacity(0.3),
                              selected: true,
                              elevation: state.elevation,
                              avatar: state.avatar,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Input chip',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: state.spacing,
                          children: [
                            Row(),
                            InputChip(
                              shape: state.shape,
                              onDeleted:
                                  state.deleteIconFunc == null ? null : () {},
                              disabledColor: Colors.black12,
                              label: const Text('Disable'),
                              selected: false,
                              elevation: state.elevation,
                              avatar: state.avatar,
                            ),
                            InputChip(
                              shape: state.shape,
                              label: const Text('iOS'),
                              elevation: state.elevation,
                              avatar: state.avatar,
                              onDeleted:
                                  state.deleteIconFunc == null ? null : () {},
                            ),
                            InputChip(
                              shape: state.shape,

                              label: const Text('Android'),
                              // selected: true,
                              selectedColor: Colors.black26,
                              elevation: state.elevation,
                              avatar: state.avatar,
                              onDeleted:
                                  state.deleteIconFunc == null ? null : () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('elevation'),
                        MeWrapTextSwitch<WrapChipCubit>(
                          initValue: bloc.state.elevation != 0,
                          addEvent: () {
                            bloc.addNewEvent(WrapChipEnum.elevation);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('avatar'),
                        MeWrapTextSwitch<WrapChipCubit>(
                          initValue: bloc.state.avatar != null,
                          addEvent: () {
                            bloc.addNewEvent(WrapChipEnum.avatar);
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('deleteIcon'),
                        MeWrapTextSwitch<WrapChipCubit>(
                          initValue: bloc.state.deleteIconFunc != null,
                          addEvent: () {
                            bloc.addNewEvent(WrapChipEnum.deleteIcon);
                          },
                        ),
                      ],
                    ),
                  ],
                )),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('spacing'),
                          MeWrapTextSwitch<WrapChipCubit>(
                            initValue: bloc.state.spacing != 0,
                            addEvent: () {
                              bloc.addNewEvent(WrapChipEnum.spacing);
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('runSpacing'),
                          MeWrapTextSwitch<WrapChipCubit>(
                            initValue: bloc.state.runSpacing != 0,
                            addEvent: () {
                              bloc.addNewEvent(WrapChipEnum.runSpacing);
                            },
                          ),
                        ],
                      ),
                      MeWrapChipDropDown<ShapeEnum, WrapChipCubit>(
                          items: ShapeEnum.values, addEvent: bloc.addNewEvent),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
