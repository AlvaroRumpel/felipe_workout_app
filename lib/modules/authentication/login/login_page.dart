import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/utils/mixins/mixin.dart';
import '../../../core/utils/validation.dart';
import '../../../core/widgets/widgets.dart';
import '../../../cubits/login/login_cubit.dart';
import '../widgets/logo_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageMixin, LoadingMixin {
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
    return LogoScaffold(
      form: Form(
        key: _formKey,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              error: (message) {
                showError(context, message);
                hideLoading();
              },
              loading: () => showLoading(context),
              orElse: () => hideLoading(),
            );
          },
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
                validators: [Required()],
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
                  if ((_formKey.currentState?.validate() ?? false)) {
                    context.read<LoginCubit>().login(
                          email: _emailEC.text,
                          password: _passwordEC.text,
                        );
                  }
                },
                child: const Text('Entrar'),
              ),
              const CustomSpace.sp4(),
              Text(
                'Não tem uma conta?',
                style: context.textHierarchy.subtitle1,
              ),
              const CreateAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
