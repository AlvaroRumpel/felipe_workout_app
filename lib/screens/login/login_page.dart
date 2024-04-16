import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../core/extensions/extensions.dart';
import '../../core/utils/validations.dart';
import '../../core/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Image.asset(
                  LOGO_LETREIRO,
                  height: context.height * .2,
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.borderRadius.xl),
                    topRight: Radius.circular(context.borderRadius.xl),
                  ),
                  color: context.themeState.colors.surfaceContainerLow,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: context.textHierarchy.h2,
                      ),
                      const CustomSpace.sp4(),
                      CustomTextField(
                        controller: _emailEC,
                        labelText: 'E-mail',
                        hintText: 'Insira seu e-mail',
                        prefixIcon: Icons.email_outlined,
                        validators: [Required(), Email()],
                      ),
                      const CustomSpace.sp4(),
                      CustomTextField(
                        controller: _passwordEC,
                        labelText: 'Senha',
                        hintText: 'Insira sua senha',
                        prefixIcon: Icons.lock_outline,
                        obscureText: true,
                        validators: [Required(), Password()],
                      ),
                      Row(
                        children: [
                          const CustomSpace.sp4(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Esqueceu a senha?',
                              style: context.textHierarchy.subtitle1.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const CustomSpace.sp4(),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {}
                        },
                        child: const Text('Entrar'),
                      ),
                      const CustomSpace.sp4(),
                      Text(
                        'Não tem uma conta?',
                        style: context.textHierarchy.subtitle1,
                      ),
                      CustomTextButton(
                        onPressed: () {},
                        text: 'Criar uma conta aqui',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
