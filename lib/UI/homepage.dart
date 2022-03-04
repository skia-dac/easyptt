import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:easypage/UI/services/notification_services.dart';
import 'package:easypage/UI/services/theme_services.dart';
import 'package:easypage/UI/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import './widgets/button.dart';
import 'add_task_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate= DateTime.now();
  var notifyHelper;
  @override
  void initState(){
  // TODO: implement initState
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      // to call teh background color
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
        ],
      ),
    );
  }
  _addDateBar(){
    return Container(
        margin: const EdgeInsets.only(top:20, left: 10),

        child:DatePicker(
          DateTime.now(),
          width: 80,
          height:100,
          initialSelectedDate: DateTime.now(),
          selectedTextColor:primaryClr,
          selectionColor: Colors.orange,
          dateTextStyle: GoogleFonts.lato(
            textStyle:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color:Colors.grey
            ),
          ),
          dayTextStyle: GoogleFonts.lato(
            textStyle:const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color:Colors.grey
            ),
          ),
          monthTextStyle: GoogleFonts.lato(
            textStyle:const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color:Colors.grey
            ),
          ),
          onDateChange: (date){
            _selectedDate=date;

          },

        )
    ) ;
  }
_addTaskBar(){
    return
  Container(
      margin: const EdgeInsets.only(left: 20 , right: 20 , top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text (DateFormat.yMMMMd().format(DateTime.now()),
                  style:subHeadingStyle,
                ),
                Text("Today",
                    style:headingStyle)

              ],
            ),
          ),
          Container (
              child: Align(
                alignment: Alignment.center,
                child: MyButton(label:"+ Add a task",
                    onTap: ()=>Get.to(AddTaskPage())),)
          )
        ],

      )
  );

}
  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          ThemeService().SwitchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode? "Activated Light Theme":" Activated Dark Theme "
          );

        notifyHelper.scheduledNotification();

        },
        child:Icon(Get.isDarkMode? Icons.wb_sunny_outlined:Icons.nightlight_round , size: 20,
          color: Get.isDarkMode? Colors.white:Colors.black
        ),
      ),
          actions: const [
            CircleAvatar(
              backgroundImage:  AssetImage(
                "images/ii.jpg"
              ),
            ),/*
           Icon(Icons.person, size: 20, ), */
            SizedBox(width: 10,),

          ],
    );
  }


}



