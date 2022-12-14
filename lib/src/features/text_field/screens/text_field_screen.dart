import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/text_field/cubit/text_field_cubit.dart';
import 'package:gallery_app/src/features/text_field/text_field_enum.dart';

import '../widgets/me_switch.dart';

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TextFieldCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Form view')),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Hint Text'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.hintText);
                      },
                      initValue: bloc.state.hintText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Label Text'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.labelText);
                      },
                      initValue: bloc.state.labelText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Help Text'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.helpText);
                      },
                      initValue: bloc.state.helpText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Error Text'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.errorText);
                      },
                      initValue: bloc.state.errorText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Counter Text'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.counterText);
                      },
                      initValue: bloc.state.counterText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Prefix'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.prefix);
                      },
                      initValue: bloc.state.prefix,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Suffix'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.suffix);
                      },
                      initValue: bloc.state.suffix,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Prefix Icon'),
                    MeTextFieldSwitch<TextFieldCubit>(
                      addEvent: () {
                        bloc.addNewEvent(TextFieldEnum.prefixIcon);
                      },
                      initValue: bloc.state.prefixIcon,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BlocBuilder<TextFieldCubit, TextFieldState>(
                builder: (BuildContext context, state) {
                  return Center(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: state.labelText ? 'Label Text' : null,
                        hintText: state.hintText ? 'Hint Text' : null,
                        helperText: state.helpText ? 'Help Text' : null,
                        errorText: state.errorText ? 'Error Text' : null,
                        counterText: state.counterText ? 'Counter Text' : null,
                        prefix: state.prefix ? const Text('prefix') : null,
                        suffix: state.suffix ? const Text('suffix') : null,
                        prefixIcon:
                            state.prefixIcon ? const Icon(Icons.abc) : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}
