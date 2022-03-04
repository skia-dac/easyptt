
import 'package:easypage/UI/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'widgets/input_field.dart';

class TimeTablePage extends StatefulWidget {
  const TimeTablePage(String? payload, {Key? key}) : super(key: key);

  @override
  State<TimeTablePage> createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  DateTime _selectedDate = DateTime.now();
  String _endTime= "9:30 PM";
  String _startTime= DateFormat("hh:m a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* help to change the backgroundColor: mode*/
        backgroundColor: context.theme.backgroundColor,
        appBar: _appBar(context),
        body: Container(
          padding: const EdgeInsets.only(left:20 ,right: 20),
          child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" Add Task",style: headingStyle,),
                  MyInputField(title: "Subject", hint: "Enter the Subject",),
                  MyInputField(title: "Teacher", hint: "Enter Teachers"),
                  MyInputField(title: "Class", hint: "Enter the Class"),
                  MyInputField(title: "Note", hint: "Enter your Note"),

                  MyInputField(title: "Date", hint: DateFormat.yMEd().format(_selectedDate),
                    widget: IconButton(
                      icon:Icon (Icons.calendar_today_outlined,
                        color: Colors.grey,),
                      onPressed: () {
                        print ("hi there");
                        _getDateFromUser();
                      },

                    ),
                  ),
                  Row(children: [
                    Expanded(
                        child: MyInputField
                          (title: "Start Time",
                          hint: _startTime,
                          widget:IconButton (
                            onPressed: (){
                              _getTimeFromUser(isStartTime:true);
                            },icon:  Icon(
                            Icons.access_time_filled_rounded,
                            color: Colors.grey,
                          ),
                          ),
                        )),
                    SizedBox (width: 20,),
                    Expanded(
                        child: MyInputField
                          (title: "End Time",
                          hint: _endTime,
                          widget:IconButton (
                            onPressed: (){
                              _getTimeFromUser(isStartTime:false);

                            },
                            icon:  Icon(
                              Icons.access_time_filled_rounded,
                              color: Colors.grey,
                            ),
                          ),
                        )),
                  ])
                ],
              )
          ),
        )
    );
  }

  _appBar(BuildContext context ) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          Get.back();

        },
        child:Icon(Icons.arrow_back_ios, size: 25,
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

  /* create a calender*/
  _getDateFromUser() async {
    DateTime?  _pickerDate = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022)
        , lastDate: DateTime (2122));
    if (_pickerDate!=null){
      setState(() {
        _selectedDate =_pickerDate;
        print(_selectedDate);
      });
    } else{
      print ("it's null or something is wrong");
    }
  }
  _getTimeFromUser({required bool isStartTime}){
    var pickedTime= _showTimePicker();
    String _formatedTime = pickedTime.format ( context);
    if(pickedTime== null){
      print ('Time canceld');
    } else if (isStartTime==true){
      _startTime=_formatedTime;

    }else if (isStartTime==false){
      _endTime=_formatedTime;
    }
  }
  _showTimePicker(){
    return showTimePicker(
        initialEntryMode:TimePickerEntryMode.input ,
        context:context ,
        initialTime:
        TimeOfDay(
            hour: 9,
            minute: 10)
    );
  }
}
