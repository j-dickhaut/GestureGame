import 'package:flutter/material.dart';
import 'package:ssp_extreme/shared/widgets/active_inventory.dart';
import 'package:ssp_extreme/screens/inventory/widgets/gesture_card.dart';
import 'package:ssp_extreme/shared/theme/styled_text.dart';
import 'package:ssp_extreme/shared/theme/theme.dart';
import 'package:ssp_extreme/shared/data/data.dart';
import '../../shared/data/gesture_class.dart';

class InventoryScreen extends StatefulWidget {
   const InventoryScreen({super.key});
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}


class _InventoryScreenState extends State<InventoryScreen> {

  void  inventorySetState(Gesture gesture){
  //rebuilds the screen when Player Inventory changes
    if(gesture.isInventory == false && inventoryList.length < 4){
      //adds pressed Gesture to the List
      setState(() {
        gesture.isInventory = !gesture.isInventory;
        inventoryList.add(gesture);
      });
    }else if(gesture.isInventory == true){
        //removes pressed Gesture from List
      setState(() {
        gesture.isInventory = !gesture.isInventory;
        inventoryList.remove(gesture);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryAccent,
      appBar: AppBar(
        title: StyledTitle("Inventory"),
      ),
      body: Column(
        children:[
          Expanded(child: 
          Stack(children: [
            Positioned.fill(
              child: Image.asset("assets/img/background.png", fit: BoxFit.cover),
            ),
            ListView.builder(itemCount: gestureList.length, itemBuilder: (_,index){
                  return GestureCard(gestureList[index], onPressed: inventorySetState);
                },),
        ]),
          ),
          
    
            //Inventory
            SizedBox(
              height: 2,
              child: Container(
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(
              height: 2,
              child: Container(
                color: AppColor.textColor,
              ),
            ),
            SizedBox(
              height: 5,
              child: Container(
                color: AppColor.primaryAccent,
              ),
            ),
            StyledHeading('Your active inventory:'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ActiveInventory(
                inventoryList: inventoryList, 
                onPressedButton:  inventorySetState
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
    );
    
  }
}
