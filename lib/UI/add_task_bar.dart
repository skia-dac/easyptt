

import 'package:easypage/UI/theme.dart';
import 'package:easypage/UI/widgets/button.dart';
import 'package:easypage/controllers/task_controller.dart';
import 'package:easypage/models/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import 'widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController =Get.put(TaskController());
  final TextEditingController _titleController =TextEditingController();
  final TextEditingController _noteController =TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime= "9:30 PM";
  String _startTime= DateFormat("hh:m a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int>remaincList=[
    5,
    10 ,
    15 ,
    20 ,
    30,
  ];
  String _selectedRepeat = "None";
  List<String>repeatList=[
 "None",
    "Daily",
    "Weekly",
    "Monthly"
  ];
  int _selectedColor=0;

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
         MyInputField(title: "Subject", hint: "Enter The Subject" ,controller: _titleController ),
         MyInputField(title: "Note", hint: "Enter your Note",controller: _noteController),
         MyInputField(title: "Date", hint: DateFormat.yMEd().format(_selectedDate),
         widget: IconButton(
           icon:Icon (Icons.calendar_today_outlined,
           color: Colors.grey,),
           onPressed: () {
             print ("hi there");
             _getDateFromUser();
           },

         ),),
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
         ]),
         MyInputField(title: "Reamind", hint: "$_selectedRemind minutes early",
          widget: DropdownButton(
            icon:Icon(Icons.keyboard_arrow_down,
            color: Colors.grey,
            ),
            iconSize: 32,
              elevation: 4,
              style: subTitleStyle,
              underline: Container(height: 0,),
              onChanged: (String ?newValue){
              setState(() {
    _selectedRemind = int.parse(newValue!);
              });
    },
              items:remaincList.map<DropdownMenuItem<String>>((int value){
                return DropdownMenuItem<String>(
                value:value.toString(),
                child:Text(value.toString())
    );
              }
    ).toList(),
    )
         ),
         MyInputField(title: "Repeat", hint: "$_selectedRepeat",
             widget: DropdownButton(
               icon:Icon(Icons.keyboard_arrow_down,
                 color: Colors.grey,
               ),
               iconSize: 32,
               elevation: 4,
               style: subTitleStyle,
               underline: Container(height: 0,),
               onChanged: (String ?newValue){
                 setState(() {
                   _selectedRepeat = newValue!;
                 });
               },
               items:repeatList.map<DropdownMenuItem<String>>((String? value){
                 return DropdownMenuItem<String>(
                     value:value,
                     child:Text(value!, style: TextStyle(color: Colors.grey))
                 );
               }
               ).toList(),
             )
         ),
         SizedBox(height:18,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       _colorpallete(),
       MyButton(label: "Create Task", onTap: ()=>_validateDate())

  ],
)
         ]
       ),
          ),
         ),
    );
  }
_validateDate(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      // add to database
      _addTaskToDb();
      Get.back();
    } else if ( _titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("required", "All field are required !",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: redClr,
      icon: Icon(Icons.warning_amber_rounded,
      color: Colors.red,)
      );
    }
}
  _addTaskToDb()async {
   int value=await
    _taskController.addTask(
        task:Task(
          note:_noteController.text,
          title:_titleController.text,
          date : DateFormat.yMEd().format(_selectedDate),
          startTime:_startTime,
          endTime: _endTime,
          remind: _selectedRemind,
          repeat: _selectedRepeat,
          color: _selectedColor,
          isCompleted: 0,
        )
    );
   print ("My id is" "+" "$value");
   }
  _colorpallete(){
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color"
          ,style:titleStyle,
        ),
        SizedBox(height: 8.0,),
        Wrap(
          children:
          List<Widget>.generate(3,
                  (int index){
                return GestureDetector(
                  onTap: () {
                    setState(() {

                    });
                    _selectedColor=index;
                    print("$index");

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child:
                    CircleAvatar (
                      radius: 14,
                      backgroundColor: index==0?greenClr:index==1?redClr:yellowClr,
                      child: _selectedColor==index?Icon(Icons.star,
                          color:Colors.white,
                          size:16
                      ):Container(),
                    ),
                  ),
                );
              }),
        )
      ],
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
