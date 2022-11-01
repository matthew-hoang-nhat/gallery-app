import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/features/bottom_appbar_view/cubit/bottom_appbar_cubit.dart';
import 'package:gallery_app/src/features/container/cubit/container_cubit.dart';
import 'package:gallery_app/src/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_app/src/features/stack_align/cubit/stack_align_cubit.dart';
import 'package:gallery_app/src/features/text_field/cubit/text_field_cubit.dart';
import 'package:gallery_app/src/features/wrap_chip/cubit/wrap_chip_cubit.dart';
import 'package:get_it/get_it.dart';
import 'src/config/routes/routers_app.dart';

final getIt = GetIt.instance;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ContainerCubit()),
        BlocProvider(create: (context) => RowColumnCubit()),
        BlocProvider(create: (context) => StackAlignCubit()),
        BlocProvider(create: (context) => TextFieldCubit()),
        BlocProvider(create: (context) => WrapChipCubit()),
        BlocProvider(create: (context) => BottomAppBarCubit()),
      ],
      child: MaterialApp.router(
        theme: ThemeData(textTheme: const TextTheme()),
        routerConfig: getIt<AppRouter>().router,
      ),
    );
  }
}
