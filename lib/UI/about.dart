import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileWidgetShape();
  }
}

class _ProfileWidgetShape extends State<ProfileWidget> {
  var theme1 = Colors.white;
  var theme2 = Color(0xff2E324F);
  var white = Colors.white;
  var black = Colors.black;
  bool switchColor = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: theme1,
      appBar: AppBar(
        backgroundColor: theme1,
        elevation: 0.0,
        leading: Icon(
          Icons.arrow_back,
          color: black,
        ),
        actions: <Widget>[


        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _profilePic(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
              child: Text("Easy Manage",
                  style: TextStyle(
                      color: black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: Text(
                "PRODUCT DESIGNER",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text("Create with flutter",
                style: TextStyle(
                    color: black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              height: 230,
            ),


            _hireButton(),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 0.0),
              child: Divider(
                color: Color(0xff78909c),
                height: 50.0,
              ),
            ),
            _followers()
          ],
        ),
      ),
    );
  }

  Row _followers() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _followerDetails("assets/images/inst.jpg"),
      _followerDetails("assets/images/fbb.jpg"),
    ],
  );

  Column _followerDetails(String image) => Column(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(45.0, 16.0, 40.0, 16.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          child: Image.asset(
            image,
          ),
        ),
      ),
      Text("1.3k",
          style: TextStyle(
              color: black, fontWeight: FontWeight.bold, fontSize: 20.0)),
      Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Text("whatsapp",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
      ),
    ],
  );

  MaterialButton _hireButton() => MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    onPressed: () {
      debugPrint("Hire Me");
      setState(() {
        if (switchColor == false) {
          black = Colors.white;
          white = Colors.black;
          theme1 = Color(0xff2E324F);
          switchColor = true;
        } else {
          black = Colors.black;
          white = Colors.white;
          theme1 = Colors.white;
          switchColor = false;
        }
      });
    },
    height: 40.0,
    minWidth: 140.0,
    child: Text(
      "Hire Me",
      style: TextStyle(color: Colors.white, fontSize: 18.0),
    ),
    color: Colors.blue,
  );



  Padding _networkIcon(String image) => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 15.0),
    child: Container(height: 25.0, width: 25.0, child: Image.asset(image)),
  );

  Container _profilePic() => Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 15.0),
      child: Stack(
        alignment: const Alignment(0.9, 0.9),
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/logo.png"),
            radius: 70.0,
          ),
        ],
      ),
    ),
  );
}