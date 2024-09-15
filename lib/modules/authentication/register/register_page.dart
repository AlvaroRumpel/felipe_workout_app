import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../core/utils/mixins/mixin.dart';
import '../../../core/utils/validation.dart';
import '../../../core/widgets/widgets.dart';
import '../cubit/register/register_cubit.dart';
import '../widgets/logo_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with MessageMixin, LoadingMixin {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LogoScaffold(
      form: Form(
        child: Form(
          key: _formKey,
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              state.maybeWhen(
                error: (message) {
                  showError(context, message);
                  hideLoading();
                },
                loading: () => showLoading(context),
                logged: () {
                  hideLoading();
                  Navigator.pushReplacementNamed(context, HOME);
                },
                orElse: () => hideLoading(),
              );
            },
            child: Column(
              children: [
                Text(
                  'Cadastro',
                  style: context.textHierarchy.h2,
                ),
                const CustomSpace.sp4(),
                CustomTextField(
                  controller: _emailEC,
                  labelText: 'E-mail',
                  hintText: 'Insira seu e-mail',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validators: [Required(), Email()],
                ),
                const CustomSpace.sp4(),
                CustomTextField(
                  controller: _passwordEC,
                  labelText: 'Senha',
                  hintText: 'Insira sua senha',
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validators: [Required(), Password()],
                ),
                const CustomSpace.sp4(),
                CustomTextField(
                  controller: _confirmPasswordEC,
                  labelText: 'Confirmar a senha',
                  hintText: 'Insira sua senha novamente',
                  prefixIcon: Icons.lock_outline,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validators: [
                    Required(),
                    Custom(validation: (value) {
                      if (_passwordEC.text != value) {
                        return 'As senhas devem corresponder!';
                      }

                      return null;
                    })
                  ],
                ),
                const CustomSpace.sp4(),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.read<RegisterCubit>().register(
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
                CustomButton.outlined(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Voltar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
