import 'package:flutter/material.dart';
import 'package:tugas_modul_5/network/giphy-data-source.dart';
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
      body: SingleChildScrollView(
        child: Container(
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
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.favorite, color: Colors.redAccent,),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(Icons.share, color: Colors.lightBlueAccent,),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('FOR YOU', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              FutureBuilder(
                future: GiphyDataSource.instance.loadGiphy(),
                builder: (
                    BuildContext context,
                    AsyncSnapshot<dynamic> snapshot,
                    ) {
                  if (snapshot.hasError) {
                    print('error');
                    return _buildErrorSection();
                  }
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    GiphyModel giphyModel =
                    GiphyModel.fromJson(snapshot.data);
                    return _buildSuccessSection(giphyModel);
                  }
                  return _buildLoadingSection();
                },
              )
            ],
          ),
        ),
      )
    );
  }


  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    );
  }

  Widget _buildSuccessSection(GiphyModel data) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      shrinkWrap: true,
      itemBuilder: (context,int index){
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailGifPage(
                imageUrl: "${data.giphy?[index].image!.fixed!.url}",
                title: "${data.giphy?[index].title}",
                rating:  "${data.giphy?[index].rating}",
                username: "${data.giphy?[index].username}",
              );
            }));
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  //width: MediaQuery.of(context).size.width,
                  child: Image.network('${data.giphy?[index].image!.fixed!.url}', fit: BoxFit.fitHeight,),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: data.giphy?.length,
    );
  }
}

