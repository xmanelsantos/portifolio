import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/constants.dart';
import 'package:portifolio/models/packages.dart';
import 'package:portifolio/models/repositories.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/title_with_shadow.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ? Current packages in this project
    final List<Package> packages = [
      Package(
          name: 'Url Launcher',
          description:
              'Utilizado para encaminhar a uma página selecionada.\n(Clique aqui e veja em ação.)',
          image: 'https://i.imgur.com/BcHu5Dv.png',
          link: 'https://pub.dev/packages/url_launcher'),
      Package(
        name: 'Lint',
        description:
            'Utilizado para verificar o código.\n(Este código foi verificado.) ',
        image: 'https://i.imgur.com/WhopBYD.png',
        link: 'https://pub.dev/packages/lint',
      ),
      Package(
          name: 'Carousel Slider',
          description: 'Utilizado para criar um carrosel.\n(Igual a esse.)',
          image: 'https://i.imgur.com/XnTZDr9.png',
          link: 'https://pub.dev/packages/carousel_slider'),
      Package(
        name: 'Google Fonts',
        description:
            'Utilizado para utilizar fontes do Google.\n(Iguais a essas.)',
        image: 'https://i.imgur.com/ptVjP2Q.png',
        link: 'https://pub.dev/packages/google_fonts',
      ),
    ];
    // ? Current aplications in my portfolio  (I don't have any)??
    final List<Repository> repositories = [
      Repository(
        title: 'Eletrônica App',
        description:
            '\nAplicativo focado em Controle de Estoque, com uso do Firebase, \ne muitas interatividades com o usuário. Estudo de UI/UX, \ngerenciamento de estado com Provider e SetState, gerador de QR Code, \nImage Picker e muito mais...',
        image:
            'https://raw.githubusercontent.com/xmanelsantos/eletronica_app/main/assets/app/icon.png',
        url: 'https://github.com/xmanelsantos/eletronica_app',
      ),
      Repository(
        title: 'Portifolio',
        description: '\nEste é o meu portifólio.\n(Este é o meu portifólio.)',
        image: 'https://i.imgur.com/6nqeUVC.png',
        url: 'https://github.com/xmanelsantos/portifolio',
      ),
      Repository(
        title: 'Random Colors',
        description:
            '\nPrimeiro aplicativo feito, para estudo de gerenciamento de estado, \nusando Provider. Projeto descontinuado.',
        image: 'https://i.imgur.com/khzPPBO.png',
        url: 'https://github.com/xmanelsantos/random_colors',
      ),
    ];

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _homeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            headerWithCircleAvatar(size),
            const TitleWithShadow(title: 'Meus Projetos'),
            carouselRepositories(size, repositories),
            const TitleWithShadow(title: 'Packages usados'),
            carouselPackages(packages),
            creditsAndMore(),
          ],
        ),
      ),
      floatingActionButton: cvDownloadButton(),
    );
  }

// ? Carousel with repositories
  CarouselSlider carouselRepositories(
      Size size, List<Repository> repositories) {
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.4,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        enlargeCenterPage: true,
      ),
      items: repositories
          .map((repository) => InkWell(
                onTap: () {
                  launch(repository.url);
                },
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding * 3),
                  height: size.height * 0.6,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kBgLightColor,
                    border: Border.all(
                      color: kPrimaryColor,
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
                          width: size.width * 0.2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(repository.image),
                          )),
                        ),
                        Wrap(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: repository.title,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: size.width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: repository.description,
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: size.width * 0.012,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

// ? AppBar
  AppBar _homeAppBar() {
    return AppBar(
      title: Text(
        'Portifólio',
        style: GoogleFonts.bebasNeue(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevation: 0,
      centerTitle: true,
    );
  }

// ? Carousel with packages
  CarouselSlider carouselPackages(List<Package> packages) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        aspectRatio: 4 / 3,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
      ),
      items: packages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                launch(i.link);
              },
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                alignment: Alignment.center,
                width: 300,
                margin: const EdgeInsets.all(
                  kDefaultPadding * 2,
                ).copyWith(top: kDefaultPadding * 3),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 20,
                      color: Colors.black12,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      i.image,
                      fit: BoxFit.contain,
                      height: 200,
                      width: 200,
                    ),
                    Text(
                      i.name,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      i.description,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kBgDarkColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

// ? Card with the eletronic app

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
          Container(
            height: size.height * 0.3,
            width: size.width * 0.3,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/79411116?v=4',
                  ),
                )),
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
