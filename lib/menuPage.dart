import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>_MenuScreenState();
}
class _MenuScreenState extends State<MenuScreen>{

  Widget buildTakeTestBtn(){
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      elevation: 5,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      primary: Colors.white,
      onPrimary: Colors.black12,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: ()=>print("One of these buttons are pressed"),//Navigator.push(context,new MaterialPageRoute(builder: (context)=>new FormScreen())),
        child: Text(
          'Color-blindness test',
          style: TextStyle(
              color: Color(0xddff0000),
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
    );
  }

  Widget buildDetectColorBtn(){
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      elevation: 5,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      primary: Colors.white,
      onPrimary: Colors.black12,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: ()=>print("Ahh.. Again"),//Navigator.push(context,new MaterialPageRoute(builder: (context)=>new FormScreen())),
        child: Text(
          'Color detection',
          style: TextStyle(
              color: Color(0xddff0000),
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
    );
  }

  Widget buildObjectDetectionBtn(){
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      elevation: 5,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100)
      ),
      primary: Colors.white,
      onPrimary: Colors.black12,
    );
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: ()=>print("Ok.. this is last"),//Navigator.push(context,new MaterialPageRoute(builder: (context)=>new FormScreen())),
        child: Text(
          'Object detection',
          style: TextStyle(
              color: Color(0xddff0000),
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text('Home'),
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
      ) ,

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:SystemUiOverlayStyle.light,
        child:GestureDetector(
          child:Stack(
              children:<Widget>[
                Container(
                  height:double.infinity,
                  width:double.infinity,
                  decoration: BoxDecoration(
                      gradient:LinearGradient(
                          begin: Alignment.topCenter,
                          end:Alignment.bottomCenter,
                          colors: [
                            Color(0x44ff0000),
                            Color(0x66ff0000),
                            Color(0x99ff0000),
                            Color(0xccff0000),
                            // Color(0xe0d98f7d),
                            // Color(0xe5db6363),
                            // Color(0xe7cb4747),
                            // Color(0xffd92b2b),
                          ]
                      )
                  ),
                  child:SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 60),
                        buildTakeTestBtn(),
                        SizedBox(height: 30),
                        buildDetectColorBtn(),
                        SizedBox(height: 30),
                        buildObjectDetectionBtn()
                      ],
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}