import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/MenuLateral.dart'; // Importa el Drawer

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cristiano Ronaldo'),
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Abre el Drawer al presionar el ícono
                },
              );
            },
          ),
        ],
      ),
      drawer: const MenuLateral() as Widget, // Este es el Drawer que se abrirá
      body: const InstagramProfile(), // El cuerpo de la pantalla (perfil de Instagram)
    );
  }
}

class InstagramProfile extends StatefulWidget {
  const InstagramProfile({super.key});

  @override
  InstagramProfileState createState() => InstagramProfileState();
}

class InstagramProfileState extends State<InstagramProfile> {
  // Variable para controlar qué contenido mostrar (grid o perfil vacío)
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Profile section
              const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('asset/images/cristiano1.jpg'),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '3767 ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Publicaciones'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '641 M',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Seguidores'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '584',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Seguidos'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Bio section
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cristiano Ronaldo\n¡SIUUUbscribe to my Youtube Channel!',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 10),
              // Story Highlights as a horizontal ListView
              SizedBox(
                height: 100, // Altura del ListView
                child: ListView(
                  scrollDirection: Axis.horizontal, // Scroll horizontal
                  children: const [
                    StoryHighlight(image: 'asset/images/cristiano0.jpg', label: 'Pilotando'),
                    SizedBox(width: 10),
                    StoryHighlight(image: 'asset/images/cristiano1.jpg', label: 'Praga'),
                    SizedBox(width: 10),
                    StoryHighlight(image: 'asset/images/cristiano2.jpg', label: 'Arquitectura'),
                    SizedBox(width: 10),
                    StoryHighlight(image: 'asset/images/cristiano3.jpg', label: 'Lisboa'),
                    SizedBox(width: 10),
                    StoryHighlight(image: 'asset/images/cristiano4.jpg', label: 'Málaga'),
                    SizedBox(width: 10),
                    StoryHighlight(image: 'asset/images/cristiano5.jpg', label: 'Marbella'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Icon section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.grid_on), // Ícono de cuadrícula
                    onPressed: () {
                      setState(() {
                        isGridView = true; // Mostrar cuadrícula
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person_outline), // Ícono de perfil/persona
                    onPressed: () {
                      setState(() {
                        isGridView = false; // Mostrar perfil vacío
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Mostrar contenido basado en el estado (isGridView)
              isGridView
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Image.asset('asset/images/cristiano$index.jpg', fit: BoxFit.cover);
                      },
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        int reversedIndex = 8 - index;
                        return Image.asset('asset/images/cristiano$reversedIndex.jpg', fit: BoxFit.cover);
                      },
                    )
            ],
          ),
        ),
      ],
    );
  }
}

// Widget para los destacados de historias
class StoryHighlight extends StatelessWidget {
  final String image;
  final String label;

  const StoryHighlight({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 25, // Tamaño del avatar
        ),
        const SizedBox(height: 5), // Espacio entre avatar y texto
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}