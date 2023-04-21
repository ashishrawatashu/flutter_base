
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Wrap(
            children: [
              Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35,),
                      SizedBox(height: 10,),
                      Text(
                        "My App",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Descrption ",
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Student Profile'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Track bus'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.download),
            title: Text('Download e-Pass'),
            onTap: () => {

            },
          ),

          ListTile(
            leading: Icon(Icons.free_cancellation),
            title: Text('Cancel e-Pass'),
            onTap: () => {

            },
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            subtitle: Text(
              ' ',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            onTap: () => {Navigator.pop(context), showLogOutDiaog()},
          ),
        ],
      ),
    );
  }

  showLogOutDiaog() {
    showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to log out ? '),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () {

            },
            child: new Text('Yes'),
          ),
        ],
      ),
    );
  }

}
