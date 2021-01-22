import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_app/presentation/bloc/auth/auth_cubit.dart';
import 'package:flutter_chat_app/presentation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:flutter_chat_app/presentation/screens/home_screen.dart';
import 'package:flutter_chat_app/presentation/screens/splash_screen.dart';
import 'package:flutter_chat_app/presentation/screens/welcome_screen.dart';
import 'package:flutter_chat_app/presentation/widgets/theme/style.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
          di.sl<AuthCubit>()
            ..appStarted(),
        ),
        BlocProvider(create: (_) => di.sl<PhoneAuthCubit>()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: greenColor,
        ),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return HomeScreen(
                    uid: authState.uid,
                  );
                }
                if (authState is UnAuthenticated) {
                  return WelcomeScreen();
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }
}
