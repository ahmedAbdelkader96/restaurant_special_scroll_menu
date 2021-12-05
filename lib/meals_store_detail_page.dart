import 'package:flutter/material.dart';
import 'package:restaurant_special_menu/meals_store_page.dart';

class SportsStoreDetailPage extends StatelessWidget {
  final Ball? ball;

  const SportsStoreDetailPage({Key? key, this.ball}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: size.height *0.4),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    width: size.width / 2.5,
                    height: size.height *0.4,
                    child: Hero(
                      tag: 'hero_background_${ball!.name}',
                      child: Container(
                        decoration: BoxDecoration(
                          color: ball!.color,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 100,
                    child: Hero(
                      tag: 'hero_text_${ball!.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          ball!.name!.split(' ').join('\n'),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: size.height*0.18,
                    child: Hero(
                      tag: 'hero_ball_${ball!.name}',
                      child: Image.asset(
                        ball!.image!,
                        height: MediaQuery.of(context).size.height*0.18,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20,
                    top: 40,
                    child: BackButton(),
                  ),
                ],
              ),
            ),
             Expanded(
               child: ListView(
                 padding: const EdgeInsets.all(5),
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const [
                       Text(" Main Data :",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                     ],
                   ),
                   const SizedBox(height: 10,),
                   const Text("hamburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2) a sandwich consisting of a patty of ground beef served within a split bread roll, with various garnishes, or (3) the ground beef itself, which is used as a base in many sauces, casseroles, terrines, and the like."

                       "The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide."),
                   const SizedBox(height: 20,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const [
                       Text(" Main Data :",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                     ],
                   ),
                   const SizedBox(height: 10,),

                   const Text("hamburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2) a sandwich consisting of a patty of ground beef served within a split bread roll, with various garnishes, or (3) the ground beef itself, which is used as a base in many sauces, casseroles, terrines, and the like."

                       "The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide."),
                   const SizedBox(height: 20,),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: const [
                       Text(" Main Data :",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                     ],
                   ),
                   const SizedBox(height: 10,),

                   const Text("hamburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2) a sandwich consisting of a patty of ground beef served within a split bread roll, with various garnishes, or (3) the ground beef itself, which is used as a base in many sauces, casseroles, terrines, and the like."

                       "The origin of hamburger is unknown, but the hamburger patty and sandwich were probably brought by 19th-century German immigrants to the United States, where in a matter of decades the hamburger came to be considered an archetypal American food. The importance of the hamburger in American popular culture is indicated by its virtual ubiquity at backyard barbecues and on fast-food restaurant menus and by the proliferation of so-called hamburger stands and restaurants. Some chains, such as McDonald’s, Burger King, and Wendy’s, proliferated worldwide."),
                 ],
               )
             ),
          ],
        ),
      ),
    );
  }
}
