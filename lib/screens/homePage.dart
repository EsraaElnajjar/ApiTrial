import 'package:apistoretrial/models/productmodel.dart';
import 'package:apistoretrial/services/get_all_products.dart';
import 'package:apistoretrial/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
 static String id ='HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.cartShopping,color: Colors.black,))
        ],
        leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),),
        centerTitle: true,
        title: Text('New Trend',style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top:65 ),
        child: FutureBuilder<List<productModel>>(
          future: GetAllProducts().getAllProducts(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<productModel> products=snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ), itemBuilder: (context,index){
                return CustomCard(product: products[index]);
              });
            }else{
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
