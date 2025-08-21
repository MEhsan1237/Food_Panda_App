import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/restuarants.dart';
import '../constants/color.dart';
import '../constants/constants.dart';
import '../models/exclusive_panda_model/exclusiveHelper.dart';
import '../models/exclusive_panda_model/exclusive_item_model.dart';
import '../models/panda_pick_model/pandaPickHelper.dart';
import '../models/panda_pick_model/pandaPickItemModel.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'Search for restaurant,cuisones, and dishes');
  }

  @override
  Widget build(BuildContext context) {
    final height  = MediaQuery.of(context).size.height * 1 ;
    final width  = MediaQuery.of(context).size.width * 1 ;

    return Scaffold(
      appBar: AppBar(
        title: const  Text('Food Delivery'),
        actions: const[
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 10,)
        ],
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
            child: Row(
              children:  [
                Expanded(child: CupertinoTextField(
                  controller: _textController,
                  padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 10),
                  placeholder: "asdf",
                  prefix: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search , color: Color(0xff7b7b7b) ,),
                  ),
                  decoration: BoxDecoration(
                      color: const Color(0xfff7f7f7),
                      borderRadius : BorderRadius.circular(50)
                  ),
                  style: const TextStyle(color: Color(0xff707070) ,
                      fontSize: 12, fontFamily: Regular) ,
                )),
                const SizedBox(width: 10,),
                const Icon(Icons.filter_list_outlined, color: MyColors.primaryColor,)
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Panda Pick' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .338,
                  child: ListView.builder(
                      itemCount: PandaPickHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        PandaPickItemModel model = PandaPickHelper.getStatusItem(index);
                        return RestuarentScreen(
                          name: model.name,
                          image:model.image ,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.ratting,
                          deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
              ),
              const Text('Panda exclusives' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * .338,
                  child: ListView.builder(
                      itemCount: ExclusiveHelper.itemCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                        return RestuarentScreen(
                          name: model.name,
                          image:model.image ,
                          remainingTime: model.remaingTime,
                          totalRating: model.totalRating,
                          subTitle: model.subTitle,
                          rating: model.rating,
                          deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                        );
                      }),
                ),
              ),

              const Text('All Restuarent' , style: TextStyle(color: Color(0xff323232) , fontSize: 15, fontFamily: Bold),),

              Container(
                height: height * .4,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                    itemCount: ExclusiveHelper.itemCount,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      ExclusiveItemModel model = ExclusiveHelper.getStatusItem(index);
                      return RestuarentScreen(
                        name: model.name,
                        image:model.image ,
                        remainingTime: model.remaingTime,
                        totalRating: model.totalRating,
                        subTitle: model.subTitle,
                        rating: model.rating,
                        deliveryTime: model.remaingTime, deliveryPrice: model.deliveryPrice,
                      );
                    }),
              ),
              const SizedBox(height: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
