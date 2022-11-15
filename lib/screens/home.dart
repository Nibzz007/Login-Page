import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_sample/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  
  final car1 =
      'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960';
  final car2 =
      'https://cdn.motor1.com/images/mgl/mrz1e/s3/coolest-cars-feature.webp';
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAlertDialog(context);
              //signOut(context);
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('Person $index'),
              subtitle: Text('Message $index'),
              leading: index.isEven
                  ? CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.red,
                      backgroundImage: NetworkImage(car1),
                    )
                  :
                  ClipRect(
                      child: Image.network(
                        car2,
                        height: 95,
                        width: 60,
                      ),
                    ),
              trailing: Text('10:00 a.m'),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: 24,
        ),
      ),
    );
  }

  void signOut(BuildContext ctx) async {
    
    final _sharedPrefs = await SharedPreferences.getInstance();
    _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (route) => false);
  }

  showAlertDialog(BuildContext ctx) {
    Widget okButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        signOut(ctx);
      },
    );
    Widget cancelButton = ElevatedButton(
      onPressed: (){
        Navigator.pop(ctx);
      }, 
      child: Text('No')
      );

    AlertDialog alert = AlertDialog(
      title: Text("Sign Out"),
      content: Text("Are you sure?"),
      actions: [
        okButton,
        cancelButton
      ],
    );

    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
