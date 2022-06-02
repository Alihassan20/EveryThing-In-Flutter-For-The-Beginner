

import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class PageVertical extends StatefulWidget {
  @override
  _PageVerticalState createState() => _PageVerticalState();
}

class _PageVerticalState extends State<PageVertical> {
  final List<String> titles = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "12 Angry Men",
    "Schindler's List",
    "Pulp Fiction",
  ];

  List<String> urlImg = [
    'https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg',
    'https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg',
    'https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg',
    'https://upload.wikimedia.org/wikipedia/ar/f/f5/Twelve_angry_men.jpg',
    'https://upload.wikimedia.org/wikipedia/ar/9/94/%D9%82%D8%A7%D8%A6%D9%85%D8%A9_%D8%B4%D9%86%D8%AF%D9%84%D8%B1.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Dipinto_di_Pulp_Fiction.jpg/640px-Dipinto_di_Pulp_Fiction.jpg',
  ];
  final List<Widget> images = [
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('https://upload.wikimedia.org/wikipedia/ar/thumb/d/d0/%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg/260px-%D9%85%D9%84%D8%B5%D9%82_%D9%81%D9%84%D9%85_%D8%A7%D9%84%D8%AE%D9%84%D8%A7%D8%B5_%D9%85%D9%86_%D8%B4%D8%A7%D9%88%D8%B4%D8%A7%D9%86%D9%83_(1994).jpg'),
            )
        )),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://i.ytimg.com/vi/zZ9NbRSlBUY/hqdefault.jpg')              )
        )),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://www.space-figuren.de/images/product_images/info_images/17457_0.jpg')              )
        )),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://upload.wikimedia.org/wikipedia/ar/f/f5/Twelve_angry_men.jpg')              )
        )),

    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('https://upload.wikimedia.org/wikipedia/ar/9/94/%D9%82%D8%A7%D8%A6%D9%85%D8%A9_%D8%B4%D9%86%D8%AF%D9%84%D8%B1.jpg'),
            )
        )),
    Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Dipinto_di_Pulp_Fiction.jpg/640px-Dipinto_di_Pulp_Fiction.jpg'),
            )
        )),


  ];


  var img;
  bool isClik=false;
  @override
  Widget build(BuildContext context) {
    print(isClik);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
            children: <Widget>[
              isClik==true ?Image.network(img,height: MediaQuery.of(context).size.height*1,width: double.infinity,fit: BoxFit.fill,):Container(color: Colors.grey,),
              Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                child: VerticalCardPager(

                  textStyle: const TextStyle(fontSize: 15,
                      color: Colors.white),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {
                    setState(() {
                      img = urlImg[page!.toInt()];
                      isClik=true;
                      print(img);
                    });

                  },
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {
                    // setState(() {
                    //   img = urlImg[index];
                    //   isClik=true;
                    //   print(img);
                    // });
                    //

                  },
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  onChanged: (value)=>null,
                  decoration: InputDecoration(
                      hintText: "Select Any Movies",
                      fillColor: Colors.white,filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      focusColor: Colors.blueGrey,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                ),
              ),


            ],
        ),
      ),
    );
  }
}