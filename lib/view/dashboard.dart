import 'package:flutter/material.dart';
import 'package:tugas_modul_5/network/giphy-data-source.dart';
import 'package:tugas_modul_5/network/giphy-model.dart';
import 'package:tugas_modul_5/view/detail_gif_page.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Text("TRENDING ON GIPHY", style: TextStyle(fontSize: 24, color: Colors.white),),
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