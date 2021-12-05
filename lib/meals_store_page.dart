import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:restaurant_special_menu/meals_store_detail_page.dart';

const leftMargin = 40.0;

class Ball {
  final int? price;
  final String? model;
  final String? name;
  final String? image;
  final Color? color;
  final Color? textColor;

  const Ball({
    this.price,
    this.model,
    this.name,
    this.image,
    this.color,
    this.textColor,
  });
}

//24,30,31
const meals = [
   Ball(
      price: 25,
      name: 'Burger',
      model: 'Fast Food',
      color: Color(0xFF743AD6),
      textColor: Colors.white,
      image: 'assets/1.png'),
   Ball(
      price: 42,
      name: 'Pizza',
      model: 'Fast Food',
      color: Color(0xFF07205A),
      textColor: Colors.white,
      image: 'assets/2.png'),
   Ball(
      price: 29,
      name: 'Sandowich',
      model: 'Fast Food',
      color: Color(0xFF6EE897),
      textColor: Colors.black,
      image: 'assets/3.png'),
   Ball(
      price: 69,
      name: 'Food Plate',
      model: 'Fast Food',
      color: Colors.amber,
      textColor: Colors.white,
      image: 'assets/4.png'),
];

class SportsStorePage extends StatefulWidget {
  const SportsStorePage({Key? key}) : super(key: key);

  @override
  _SportsStorePageState createState() => _SportsStorePageState();
}

class _SportsStorePageState extends State<SportsStorePage> {
  final _priceNotifier = ValueNotifier<int?>(meals.first.price);

  final _pageController = PageController(viewportFraction: 0.9);

  final _pageNotifier = ValueNotifier<double?>(0.0);
   Color color = const Color(0xFF743AD6) ;
  Widget _buildHeader() {
    Widget _buildGroup(bool selected, IconData icon) {
      return Row(
        children: [
          Icon(
            icon,
            color: selected ? Colors.black : Colors.grey[300],
            size: 13,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            'Macdonald’s Menu',
            style: TextStyle(
              fontSize: 13,
              color: selected ? Colors.black : Colors.grey,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: leftMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Macdonald’s',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 26,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: leftMargin),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey[300]!,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(children: [
                _buildGroup(true, Icons.battery_charging_full),
                const SizedBox(
                  width: 20,
                ),
                _buildGroup(false, Icons.shopping_basket),
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[300],
        elevation: 4,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shopping_basket,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(
              Icons.wb_sunny,
            ),
          )
        ],
      );

  Widget _buildBottomWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: leftMargin),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color:color)),
              child: CircleAvatar(
                 child: Center(child: Image.asset('assets/macdonalds.png',fit: BoxFit.cover,)) ,
                backgroundColor: Colors.white,
                 // backgroundImage: AssetImage('assets/macdonalds.png',),
                radius: 10,
              ),
            ),
            title: const Text(
              'Macdonald’s',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text(
              'Egypt',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  void _listener() {
    if(_pageController.page==0){setState(() {color = const Color(0xFF743AD6);});
    }else if(_pageController.page==1){setState(() {color = const Color(0xFF07205A);});
    } else if(_pageController.page==2){setState(() {color = const Color(0xFF6EE897);});
    }else if(_pageController.page==3){setState(() {color = Colors.amber;});
    }
    _pageNotifier.value = _pageController.page;

  }

  @override
  void initState() {


    lastPrice = meals.first.price;
    WidgetsBinding.instance!.addPostFrameCallback((_) {

      _pageController.addListener(_listener);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listener);
    _pageController.dispose();
    _pageNotifier.dispose();
    _priceNotifier.dispose();
    super.dispose();
  }

  int? lastPrice = 0;

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _buildBottomNavigationBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 46),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        width: MediaQuery.of(context).size.width / 3,
                        bottom: 20,
                        child: Padding(
                          padding: const EdgeInsets.only(left: leftMargin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              ValueListenableBuilder<int?>(
                                  valueListenable: _priceNotifier,
                                  builder: (context, value, child) {
                                    return TweenAnimationBuilder<int>(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      tween: IntTween(
                                          begin: lastPrice, end: value),
                                      builder:
                                          (context, animationValue, child) {
                                        return Text(
                                          "\$$animationValue",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey[700],
                                          ),
                                        );
                                      },
                                    );
                                  }),
                              const Spacer(),
                              Text(
                                'Available size',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 30,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.withOpacity(0.5))),
                                      child: const Center(
                                        child: Text(
                                          'S',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      ),
                                    
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.withOpacity(0.5))),
                                      child: const Center(
                                        child: Text(
                                          'M',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 23,
                                      width: 23,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.withOpacity(0.5))),
                                      child: const Center(
                                        child: Text(
                                          'L',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ValueListenableBuilder<double?>(
                        valueListenable: _pageNotifier,
                        builder: (context, value, child) => PageView.builder(
                          controller: _pageController,
                          itemCount: meals.length,
                          onPageChanged: (index) {
                            //every time the page changed, get the current page and get the price from the balls array
                            //update the value to the notifier and object inside [ValueListenableBuilder] will rebuild
                            _priceNotifier.value = meals[index].price;
                            lastPrice = meals[index].price;
                          },
                          itemBuilder: (context, index) {
                            final lerp = lerpDouble(
                                1, 0, (index - _pageNotifier.value!).abs())!;

                            double opacity = lerpDouble(1.0, 0.0,
                                (index - _pageNotifier.value!).abs())!;
                            opacity = opacity < 0 ? 0 : opacity;
                            return Opacity(
                              opacity: opacity,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8.0,
                                            left: 20,
                                          ),
                                          child: Hero(
                                            tag:
                                                'hero_text_${meals[index].name}',
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Text(
                                                meals[index]
                                                    .name!
                                                    .split(" ")
                                                    .join("\n"),
                                                maxLines: 2,
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .push(PageRouteBuilder(
                                              transitionDuration:
                                                  const Duration(
                                                      milliseconds: 800),
                                              pageBuilder: (_, animation, __) =>
                                                  FadeTransition(
                                                opacity: animation,
                                                child: SportsStoreDetailPage(
                                                  ball: meals[index],
                                                ),
                                              ),
                                            ));
                                          },
                                          child: Hero(
                                            tag:
                                                'hero_background_${meals[index].name}',
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: meals[index].color,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(30),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    child: Text(
                                                      meals[index]
                                                          .model!
                                                          .split(" ")
                                                          .join("\n"),
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        color: meals[index]
                                                            .textColor,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: Transform.scale(
                                      alignment: Alignment.centerRight,
                                      scale: lerp,
                                      child: Hero(
                                        tag: 'hero_ball_${meals[index].name}',
                                        child: Image.asset(
                                          meals[index].image!,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
