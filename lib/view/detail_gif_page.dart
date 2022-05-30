import 'package:flutter/material.dart';
import 'package:tugas_modul_5/network/giphy-model.dart';

class DetailGifPage extends StatefulWidget {
  final String? imageUrl;
  final String? title;
  final String? rating;
  final String? avatar;
  final String? username;
  final String? display;

  const DetailGifPage( {Key? key, this.imageUrl, this.title, this.rating, this.avatar, this.username, this.display}) : super(key: key);

  @override
  State<DetailGifPage> createState() => _DetailGifPageState();
}

class _DetailGifPageState extends State<DetailGifPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('GIF') ,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.lightBlueAccent, //change your color here
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage('${widget.imageUrl}'),
                    ),
                  ),
                ),
              ),
             Padding(
               padding: EdgeInsets.all(10),
               child:  Text('${widget.title}', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
             ),
             Padding(
               padding: EdgeInsets.all(5),
               child: Text('By @${widget.username ?? ''}', style: TextStyle(color: Colors.white)),
             ),
             Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.favorite, color: Colors.white,),
                   Icon(Icons.share, color: Colors.white,)
                 ],
               ),
             )
            ],
          ),
      ),
    );
  }
  }

