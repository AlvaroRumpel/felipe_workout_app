import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/extensions.dart';
import '../../core/theme/cubit/theme_cubit.dart';
import '../../core/widgets/widgets.dart';
import '../authentication/cubit/auth/auth_cubit.dart';
import 'cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: context.textHierarchy.h4,
            ),
            BlocSelector<SettingsCubit, SettingsState, Brightness>(
              selector: (state) {
                return state is SettingsData
                    ? state.themeMode
                    : Brightness.dark;
              },
              builder: (context, brightness) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Mudar o tema'),
                    Switch(
                      value: brightness == Brightness.light,
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>((state) {
                        if (state.contains(WidgetState.selected)) {
                          return const Icon(Icons.light_mode_outlined);
                        }

                        return const Icon(Icons.dark_mode_outlined);
                      }),
                      onChanged: (_) {
                        context.read<SettingsCubit>().changeThemeMode(
                              brightness == Brightness.dark
                                  ? Brightness.light
                                  : Brightness.dark,
                            );

                        context.read<ThemeCubit>().toggleTheme(
                              brightness == Brightness.dark
                                  ? Brightness.light
                                  : Brightness.dark,
                            );
                      },
                    ),
                  ],
                );
              },
            ),
            const CustomSpace.sp4(),
            CustomButton(
              onPressed: () {},
              icon: Icons.message_outlined,
              backgroundColor: context.colors.tertiary,
              iconColor: context.colors.onTertiary,
              child: Text(
                'Contato',
                style: TextStyle(color: context.colors.onTertiary),
              ),
            ),
            const CustomSpace.sp4(),
            CustomButton(
              onPressed: context.read<AuthCubit>().signOut,
              icon: Icons.logout_rounded,
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
          onPressed: () {},
          backgroundColor: context.colors.errorContainer,
          iconColor: context.colors.onErrorContainer,
          icon: Icons.close,
          child: Text(
            'Apagar conta',
            style: TextStyle(color: context.colors.onErrorContainer),
          ),
        ),
      ),
    );
  }
}
