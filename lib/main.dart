import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              height: 600,
              width: double.infinity,
              child: CustomPaint(
                painter: _Cabecera(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Expanded(child: firstT()),
                SizedBox(
                  height: 150,
                  child: Expanded(
                      flex: 4,
                      child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            CardFav('assets/Big-Hero-6-Poster.png',
                                '6 GRANDES HEROES', '2014', '4.5', 4.5),
                            CardFav(
                                'assets/frozen.png',
                                'FROZEN 2: UNA AVENTURA CONGELADA',
                                '2019',
                                '4.5',
                                4.5),
                          ])),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: secondT()),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 10,
                  child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        listCard(
                            'assets/entrenar_dragon.png',
                            'COMO ENTRENAR A TU DRAGON',
                            'Jacynthe Lubowitz - 2019',
                            '4.5',
                            4.5),
                        listCard('assets/sonic.png', "SONIC: LA PELICULA",
                            'Irene Amato - 2020', '4.5', 4.5),
                        listCard('assets/abominable.png', 'ABOMINABLE',
                            'Tito Predovic - 2019', '4.5', 4.5),
                        listCard('assets/avesdepresa.png', 'AVES DE PRESA',
                            'Tito Predovic - 2019', '5.0', 5.0),
                        SizedBox(
                          height: 85,
                        )
                      ]),
                ),
              ]),
            ),
            bottonBar(context),
          ],
        ),
      ),
    );
  }

//PRUEBA DE COMMIT
  Align bottonBar(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: BottomNavigationBar(
              onTap: (i) {
                setState(() {
                  index = i;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: index,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.movie),
                    icon: Icon(
                      Icons.movie_outlined,
                      color: Colors.black45,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.play_circle_outline_rounded),
                    icon: Icon(
                      Icons.play_circle_outline_outlined,
                      color: Colors.black45,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.search),
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black45,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.view_headline),
                    icon: Icon(
                      Icons.view_headline_outlined,
                      color: Colors.black45,
                      size: 35,
                    ),
                    title: Text('')),
              ],
            )));
  }

  SizedBox listCard(
      String img, String title, String des, String rate, double numRate) {
    return SizedBox(
        height: 100,
        child: Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: Image.asset(
                    img,
                    height: 55,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(height: 5),
                      Text(
                        des,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.white,
                                  offset: new Offset(0.0, 2.0),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            rate,
                            textAlign: TextAlign.end,
                          )),
                          SizedBox(
                            width: 3,
                          ),
                          RatingBar.builder(
                            itemSize: 10,
                            initialRating: numRate,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color.fromRGBO(71, 92, 218, 1),
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Card CardFav(
      String img, String title, String des, String rate, double numRate) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    img,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    des,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.white,
                              offset: new Offset(0.0, 2.0),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        rate,
                        textAlign: TextAlign.end,
                      )),
                      SizedBox(
                        width: 3,
                      ),
                      RatingBar.builder(
                        itemSize: 10,
                        initialRating: numRate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromRGBO(71, 92, 218, 1),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding Hex(IconData ic) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: ClipPath(
          child: Container(
            color: Color.fromRGBO(71, 92, 218, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(ic),
            ),
          ),
          clipper: Hexagono(),
        ),
      ),
    );
  }

  Row firstT() {
    return Row(children: [
      Expanded(
          child: Text(
        "PREMIERES",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
      )),
    ]);
  }

  Row secondT() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "IN THIS WEEK",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
        )),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey[900],
      elevation: 0,
      title: Center(
        child: Text(
          "CINEMA EXAMEN FINAL",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class Hexagono extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.75);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _Cabecera extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_Cabecera oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_Cabecera oldDelegate) => false;
}
