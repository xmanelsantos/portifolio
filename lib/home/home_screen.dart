import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifolio/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: headerWithCircleAvatar(size),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.file_download, color: Colors.black),
        label: Text(
          'Download CV',
          style: GoogleFonts.aBeeZee(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kPrimaryColor,
      ),
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
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(23)),
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
                  fontSize: size.width / 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextSpan(
                text: '\nCiência da Computação | Flutter',
                style: GoogleFonts.bebasNeue(
                  fontSize: size.width / 30,
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
