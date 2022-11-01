import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/container/cubit/container_cubit.dart';
import '../../../config/constants/app_colors.dart';
import '../widgets/me_container_drop_down.dart';
import '../widgets/me_switch.dart';

class ContainerScreen extends StatelessWidget {
  const ContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      {AppColors.white: 'white'},
      {AppColors.blue: 'blue'},
      {AppColors.red: 'red'},
      {AppColors.green: 'green'},
    ];
    final borders = [
      {const Border.fromBorderSide(BorderSide.none): false},
      {Border.all(): true}
    ];
    final boxShadows = [
      {const BoxShadow(): false},
      {
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3)): true
      },
    ];
    final borderRadiuses = [
      {BorderRadius.circular(0): 'None'},
      {BorderRadius.circular(20): '20'},
      {BorderRadius.circular(50): '50'},
      {BorderRadius.circular(100): '100'},
    ];
    final blendModes = [
      {BlendMode.src: 'src'},
      {BlendMode.difference: 'difference'},
      {BlendMode.color: 'color'},
      {BlendMode.colorDodge: 'colorDodge'},
      {BlendMode.colorBurn: 'colorDodge'},
    ];
    final bloc = context.read<ContainerCubit>();

    return BlocProvider<ContainerCubit>(
      create: (context) => bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Stack & Alignment')),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 30),
            BlocBuilder<ContainerCubit, ContainerState>(
              builder: (BuildContext context, state) {
                return Center(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        backgroundBlendMode: state.blendMode,
                        borderRadius: state.borderRadius,
                        border: state.border,
                        color: state.background,
                        boxShadow: [state.boxShadow]),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Border'),
                      MeContainerSwitch<Border, ContainerCubit>(
                        addEvent: bloc.addNewEvent,
                        items: borders,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('BorderRadius'),
                      MeContainerDropDown<BorderRadius, ContainerCubit>(
                        addEvent: bloc.addNewEvent,
                        items: borderRadiuses,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('BorderShadow'),
                      MeContainerSwitch<BoxShadow, ContainerCubit>(
                        addEvent: bloc.addNewEvent,
                        items: boxShadows,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Background'),
                      MeContainerDropDown<Color, ContainerCubit>(
                        items: colors,
                        addEvent: bloc.addNewEvent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('BlendMode'),
                      MeContainerDropDown<BlendMode, ContainerCubit>(
                        items: blendModes,
                        addEvent: bloc.addNewEvent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
