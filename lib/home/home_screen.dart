import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portifólio',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerWithCircleAvatar(size),
            cardEletronicaApp(size),
            creditsAndMore(),
          ],
        ),
      ),
      floatingActionButton: cvDownloadButton(),
    );
  }

// ? Card with the eletronic app
  Container cardEletronicaApp(Size size) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      height: size.height * 0.6,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding * 3),
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kBgLightColor,
          border: Border.all(
            color: const Color(0xFF3093a3),
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 10),
              blurRadius: 30,
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(
                      'https://raw.githubusercontent.com/xmanelsantos/eletronica_app/main/assets/app/icon.png'),
                )),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Eletrônica App',
                      style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\nAplicativo focado em Controle de Estoque,\ncom uso do Firebase, e muitas interatividades com o usuário.\nEstudo de UI/UX, gerenciamento de estado com Provider e SetState,\ngerador de QR Code, Image Picker e muito mais...',
                      style: GoogleFonts.aBeeZee(
                        fontSize: size.width * 0.012,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

// ? Repository link and buttons
  Padding creditsAndMore() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Center(
        child: Column(
          children: [
            Text(
              'Esse site foi feito utilizando o Framework Flutter.',
              style: GoogleFonts.aBeeZee(
                  color: kPrimaryColor.withOpacity(0.7),
                  fontStyle: FontStyle.italic),
            ),
            TextButton(
              onPressed: () {
                launch('https://github.com/xmanelsantos/portifolio');
              },
              child: Text(
                'Repositório GitHub',
                style: GoogleFonts.aBeeZee(
                  color: kPrimaryColor.withOpacity(0.9),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// ? Floating Action Button
  FloatingActionButton cvDownloadButton() {
    return FloatingActionButton.extended(
      onPressed: () {
        // TODO DOWNLOAD FILE
      },
      icon: const Icon(Icons.file_download, color: Colors.black),
      label: Text(
        'Download CV',
        style: GoogleFonts.aBeeZee(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }

// ? Header with Name and Circle Avatar
  Container headerWithCircleAvatar(Size size) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      height: size.height * 0.3,
      width: size.width,
      decoration: const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(23),
            bottomLeft: Radius.circular(23),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 20,
              color: Colors.black54,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundImage: const NetworkImage(
                'https://avatars.githubusercontent.com/u/79411116?v=4'),
            radius: size.height / 7,
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: 'Emanuel Ferreira dos Santos',
                style: GoogleFonts.bebasNeue(
                  fontSize: size.width / 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text: '\nCiência da Computação | Flutter',
                style: GoogleFonts.bebasNeue(
                  fontSize: size.width / 35,
                  color: kBgDarkColor,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
