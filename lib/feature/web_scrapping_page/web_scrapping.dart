import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart'as dom;


class WebScrapping extends StatefulWidget {
  const WebScrapping({Key? key}) : super(key: key);

  @override
  _WebScrappingState createState() => _WebScrappingState();
}

class _WebScrappingState extends State<WebScrapping> {

  List<String> titles=[];

  List<String> urlImages=[];


  getWebScrapping()async{
    final response = await http.get(Uri.parse('https://www.freecodecamp.org/news/tag/blog/'));
    dom.Document html = dom.Document.html(response.body);
    final title= html.querySelectorAll('h2.post-card-title > a').map((e) => e.innerHtml.trim()).toList();


    final Url= html.querySelectorAll('a.post-card-image-link > img').map((e) => e.attributes['src']!).toList();
    setState(() {
      titles=title;
      urlImages = Url;
    });
  }
  @override
  void initState() {
    super.initState();
    getWebScrapping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      ListView.builder(itemCount: titles.length,
          itemBuilder: (context, index) {
        var text = titles[index];
        var img = urlImages[index];
        return Column(
          children: [
            Text(text),
            SizedBox(height: 10),
            Image.network(img.toString(),width: double.infinity,height: 200,fit: BoxFit.cover,)

          ],
        );
      }),

    );
  }
}
