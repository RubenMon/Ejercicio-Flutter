import 'package:flutter/material.dart';
import 'menuLateral.dart';

class SieteYMedioGame extends StatefulWidget {
  const SieteYMedioGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SieteYMedioGameState createState() => _SieteYMedioGameState();
}

class _SieteYMedioGameState extends State<SieteYMedioGame> {
  // Tu lógica del juego permanece igual
  List<Map<String, dynamic>> baraja = [];
  List<Map<String, dynamic>> cartasUsuario = [];
  List<Map<String, dynamic>> cartasMaquina = [];
  int victoriasUsuario = 0;
  int victoriasMaquina = 0;

  @override
  void initState() {
    super.initState();
    iniciarJuego();
  }

  void iniciarJuego() {
    baraja = generarBaraja();
    baraja.shuffle();
    cartasUsuario.clear();
    cartasMaquina.clear();
    setState(() {});
  }

  List<Map<String, dynamic>> generarBaraja() {
    const palos = ['Oros', 'Copas', 'Espadas', 'Bastos'];
    const valores = {
      'As': 1.0,
      '2': 2.0,
      '3': 3.0,
      '4': 4.0,
      '5': 5.0,
      '6': 6.0,
      '7': 7.0,
      'Sota': 0.5,
      'Caballo': 0.5,
      'Rey': 0.5,
    };

    List<Map<String, dynamic>> barajaGenerada = [];
    for (var palo in palos) {
      valores.forEach((nombre, valor) {
        barajaGenerada.add({'nombre': '$nombre de $palo', 'valor': valor});
      });
    }
    return barajaGenerada;
  }

  double calcularPuntaje(List<Map<String, dynamic>> cartas) {
    return cartas.fold(0.0, (sum, carta) => sum + carta['valor']);
  }

  void pedirCartaUsuario() {
    if (baraja.isNotEmpty) {
      cartasUsuario.add(baraja.removeLast());
      if (calcularPuntaje(cartasUsuario) > 7.5) {
        turnoMaquina();
      }
      setState(() {});
    }
  }

  void turnoMaquina() {
    while (calcularPuntaje(cartasMaquina) < 6.5 && baraja.isNotEmpty) {
      cartasMaquina.add(baraja.removeLast());
    }
    verificarGanador();
  }

  void verificarGanador() {
    double puntajeUsuario = calcularPuntaje(cartasUsuario);
    double puntajeMaquina = calcularPuntaje(cartasMaquina);

    if (puntajeUsuario > 7.5 || (puntajeMaquina <= 7.5 && puntajeMaquina > puntajeUsuario)) {
      victoriasMaquina++;
    } else if (puntajeMaquina > 7.5 || (puntajeUsuario <= 7.5 && puntajeUsuario > puntajeMaquina)) {
      victoriasUsuario++;
    }

    if (victoriasUsuario == 5 || victoriasMaquina == 5) {
      mostrarResultadoFinal();
    } else {
      iniciarJuego();
    }
  }

  void mostrarResultadoFinal() {
    String mensaje;
    if (victoriasUsuario > victoriasMaquina) {
      mensaje = "¡Has ganado la partida!";
    } else if (victoriasUsuario < victoriasMaquina) {
      mensaje = "Has perdido la partida.";
    } else {
      mensaje = "¡Es un empate!";
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Resultado Final"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              victoriasUsuario = 0;
              victoriasMaquina = 0;
              iniciarJuego();
              Navigator.of(context).pop();
            },
            child: const Text("Jugar de nuevo"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("7 y Medio"),
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: const MenuLateral(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tus cartas (${calcularPuntaje(cartasUsuario).toStringAsFixed(1)})",
            style: const TextStyle(fontSize: 18),
          ),
          Wrap(
            children: cartasUsuario
                .map((carta) => Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(carta['nombre']),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Victorias Usuario: $victoriasUsuario",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "    Victorias Máquina: $victoriasMaquina",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: pedirCartaUsuario,
            child: const Text("Pedir Carta"),
          ),
          ElevatedButton(
            onPressed: turnoMaquina,
            child: const Text("Plantarse"),
          ),
        ],
      ),
    );
  }
}