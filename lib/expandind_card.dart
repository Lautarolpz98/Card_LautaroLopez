import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpandingCard extends StatefulWidget {
  @override
  _ExpandingCardState createState() => _ExpandingCardState();
}

class _ExpandingCardState extends State<ExpandingCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double expandedHeight = screenHeight * 0.8;
    final double collapsedHeight = 90;

    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: screenWidth * 0.9,
          height: isExpanded ? expandedHeight : collapsedHeight,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 155, 168, 187),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'LAUTARO LOPEZ',
                      style: TextStyle(
                          fontFamily: 'Courier',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  if (isExpanded) ...[
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 6)),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage('assets/perfil.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.2,
                      child: TweenAnimationBuilder(
                        duration: Duration(seconds: 10),
                        tween: IntTween(
                            begin: 0,
                            end:
                                '"Hola, soy Lautaro, desarrollador autodidacta con 2 años de experiencia en Flutter. Me apasiona crear interfaces fluidas y funcionales. Actualmente, busco mi primer empleo como Frontend Flutter Developer para aportar mis conocimientos y seguir creciendo en el mundo del desarrollo móvil." 🚀'
                                    .length),
                        builder: (context, value, child) {
                          return Text(
                            '"Hola, soy Lautaro, desarrollador autodidacta con 2 años de experiencia en Flutter. Me apasiona crear interfaces fluidas y funcionales. Actualmente, busco mi primer empleo como Frontend Flutter Developer para aportar mis conocimientos y seguir creciendo en el mundo del desarrollo móvil." 🚀'
                                .substring(0, value),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              decoration: TextDecoration.none,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    //mis redes
                    TweenAnimationBuilder(
                      duration: Duration(seconds: 2),
                      tween: IntTween(begin: 0, end: 'Mis Redes'.length),
                      builder: (context, value, child) {
                        return Text(
                          'Mis Redes'.substring(0, value),
                          style: TextStyle(
                            fontFamily: 'Courier',
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //iconos redes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.github,
                              size: 60,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          onPressed: () {
                            // Acción para GitHub
                            launchUrl(
                                Uri.parse('https://github.com/Lautarolpz98'));
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.linkedin,
                              size: 60,
                              color: const Color.fromARGB(255, 22, 113, 233)),
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://www.linkedin.com/in/lautaro-lopez-b56aa7305/'));
                            // Acción para LinkedIn
                          },
                        ),
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.instagram,
                              size: 60,
                              color: const Color.fromARGB(255, 194, 76, 155)),
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://www.instagram.com/lautaro_lauth/'));
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
