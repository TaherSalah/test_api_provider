import 'package:api_with_provider/provider/store_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shard/app_style.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<StoreProvider>(context, listen: false).getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<StoreProvider>(
        builder: (context, value, child) {
          final data = value.store;
          return GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Card(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Expanded(
                            child: Image.network(
                          data[index].image,
                          height: 200,
                          width: 200,
                        )),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          data[index].title,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          '${data[index].price}',
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,),
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadiusDirectional.circular(25)
                    ),
                    child: Text('${data[index].category}',style: GoogleFonts.cairo(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),

                ],
              );
            },
          );
        },
      ),
    );
  }
}
