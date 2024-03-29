import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motorparts_marketplace/pages/auth_pages/bloc/user_auth_bloc.dart';
import 'package:motorparts_marketplace/pages/categories_page/bloc/model_and_brand_bloc.dart';
import 'package:motorparts_marketplace/pages/home_page.dart';
import 'package:motorparts_marketplace/providers/cart_provider.dart';
import 'package:motorparts_marketplace/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserAuthBloc>(
            create: (context) => UserAuthBloc(),
          ),
          BlocProvider<ModelAndBrandBloc>(
            create: (context) => ModelAndBrandBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final String title = 'Mercado Piezas';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF219EBC),
        ),
        useMaterial3: true,
      ),
      // home: OnboardingPage() //LoginPage(),
      // home: LoginRegisterPage(),
      home: MyHomePage(
        title: title,
      ),
      // home: Scaffold(
      //   body: PaymentPage(),
      // ),
      //MyHomePage(title: title),
    );
  }
}
