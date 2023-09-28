import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Importa Firebase Auth
import 'package:app_creative_val/src/core/features/auth/presentation/cubit/authentication_firebase_cubit.dart';
import 'package:app_creative_val/src/core/features/auth/presentation/cubit/password_visibility_cubit.dart';
import 'package:app_creative_val/src/core/features/home/presentation/pages/home_page.dart';
import '../widgets/input_decorations_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthenticationCubit _authenticationCubit;
  bool _passwordVisible = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authenticationCubit = AuthenticationCubit();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
        create: (context) => PasswordVisibilityCubit(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              boxColorInitial(size),
              iconUser(),
              formLogin(),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView formLogin() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 250,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12.withOpacity(.4),
                      blurRadius: 20,
                      offset: const Offset(0, 5)),
                ]),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 30),
                Form(
                  child: Column(children: [
                    TextFormField(
                      controller: _emailController, // Controlador para el email
                      autocorrect: false,
                      decoration: InputDecorationsForm.inputDecoration(
                        labelText: 'Enter your email',
                        hintext: 'Email',
                        icon: const Icon(Icons.alternate_email_outlined),
                      ),
                    ),
                    const SizedBox(height: 30),
                    BlocBuilder<PasswordVisibilityCubit,
                        PasswordVisibilityState>(
                      builder: (context, state) {
                        if (state is SwitchPasswordVisibility) {
                          _passwordVisible = state.isVisible;
                        }
                        return TextFormField(
                          controller:
                              _passwordController, // Controlador para la contraseña
                          obscureText: !_passwordVisible,
                          autocorrect: false,
                          decoration: InputDecorationsForm.inputDecoration(
                            labelText: 'Enter your password',
                            hintext: 'password',
                            icon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<PasswordVisibilityCubit>()
                                    .switchPasswordVisibility(
                                        isVisible: !_passwordVisible);
                              },
                              icon: Icon(_passwordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      color: Colors.lightBlue,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 15),
                        child: const Text('SIGN IN',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      ),
                      onPressed: () {
                        _signInWithEmailAndPassword(); // Iniciar sesión al presionar el botón
                      },
                    ),
                    const SizedBox(height: 15),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      disabledColor: Colors.grey,
                      color: Colors.grey[50],
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        child: const Text('FORGET PASSWORD',
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 17)),
                      ),
                      onPressed: () {
                        // Agrega aquí la lógica para la recuperación de contraseña
                      },
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    try {
      // Autenticar al usuario utilizando Firebase Auth
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Emitir un estado de autenticación exitosa directamente en el cubit
      context.read<AuthenticationCubit>().emit(AuthenticationAuthenticated());
      // Navegar a la página de inicio
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } catch (e) {
      // Manejar errores de autenticación
      print('Error al iniciar sesión: $e');
      // Puedes mostrar un mensaje de error al usuario si lo deseas
    }
  }

  SafeArea iconUser() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        width: double.infinity,
        child: const Icon(
          Icons.person_pin_circle_outlined,
          color: Colors.white,
          size: 90.0,
        ),
      ),
    );
  }

  Container boxColorInitial(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(78, 173, 250, 1),
            Color.fromRGBO(47, 80, 189, 1)
          ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18.0),
            bottomRight: Radius.circular(18.0),
          )),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(top: 90, left: 30, child: bubbleBox()),
          Positioned(top: -40, left: -30, child: bubbleBox()),
          Positioned(top: -50, right: -20, child: bubbleBox()),
          Positioned(bottom: -50, left: -20, child: bubbleBox()),
          Positioned(bottom: 120, right: 10, child: bubbleBox()),
        ],
      ),
    );
  }

  Container bubbleBox() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
