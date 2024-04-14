import 'package:flutter/material.dart';

import '../../core/assets.dart';
import '../../core/components/components.dart';
import '../../core/extensions/extensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: context.textHierarchy.h2,
                      ),
                      const CustomSpace.sp4(),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                          hintText: 'Insira seu e-mail',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const CustomSpace.sp4(),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          hintText: 'Insira sua senha',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.visibility_outlined),
                        ),
                        obscureText: true,
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
                        onPressed: () {},
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
