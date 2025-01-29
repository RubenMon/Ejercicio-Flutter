import 'package:flutter_application_1/screens/screens.dart';
import 'package:flutter_application_1/main.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/primera': (context) => const Ejercicio1(),
  '/segunda': (context) => const Ejercicio2(),
  '/tercera': (context) => const Ejercicio3(),
  '/cuarta': (context) => const Ejercicio4(),
  '/quinta': (context) => const Ejercicio5(),
  '/sexta': (context) => const ContadorPage(),
  '/septima': (context) => const RetoAPP(),
  '/octava': (context) => const Instagram(),
  '/novena': (context) => const Juego(),
  '/decima': (context) => const SieteYMedioGame(),
  '/undecima': (context) => const Formulario(),
  '/duodecima': (context) => const AdivinaNumero(),
  '/tredecima': (context) => const FormularioSwitch(),
};