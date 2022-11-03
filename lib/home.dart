import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 156, 155, 155),
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
              onPressed: () {
                signout(context);
              },
              icon: const Icon(Icons.exit_to_app)),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 225, 223, 223),
      body: SafeArea(
        child: ListView(
          children: const [
            ListTile(
              title: Text("THE LORD OF THE RINGS\nthe return of the king"),
              subtitle: Text("Author: J.R.R.TOLKIEN"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/home.png.jpg",
                ),
              ),
              trailing: Text("Rating : 8.7"),
            ),
            ListTile(
              title: Text("To kill a  MOCKINGBIRD"),
              subtitle: Text("Author: HAPRPER LEE"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/tokillamokkingbird.jpg",
                ),
              ),
              trailing: Text("Rating : 7.7"),
            ),
            ListTile(
              title: Text("1984"),
              subtitle: Text("Author: GEORAGE ORWELL"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/1984.jpg",
                ),
              ),
              trailing: Text("Rating : 9.2"),
            ),
            ListTile(
              title: Text("FRANKENSTEIN"),
              subtitle: Text("Author: MARY SHELLY"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/frankestain.jpg",
                ),
              ),
              trailing: Text("Rating : 7.3"),
            ),
            ListTile(
              title: Text("HYPER FOCUS"),
              subtitle: Text("Author: CHRIS BAILEY"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/hyperfocus.jpg",
                ),
              ),
              trailing: Text("Rating : 7.9"),
            ),
            ListTile(
              title: Text("INVISIBLE MAN"),
              subtitle: Text("Author: ELLISON"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/invisibleman.jpg",
                ),
              ),
              trailing: Text("Rating : 9.2"),
            ),
            ListTile(
              title: Text("LOLITA"),
              subtitle: Text("Author: VLADIMIT NABOKOV"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/lolita.jpg",
                ),
              ),
              trailing: Text("Rating : 8.5"),
            ),
            ListTile(
              title: Text("OLIVER TWIST"),
              subtitle: Text("Author:RICHARD DREYFUSS"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/olivertwist.jpg",
                ),
              ),
              trailing: Text("Rating : 9.7"),
            ),
            ListTile(
              title: Text("RICH DAD POOR DAD"),
              subtitle: Text("Author: ROBERT T.KIYOSAKI"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/RichDadPoorDad.jpg",
                ),
              ),
              trailing: Text("Rating : 9.1"),
            ),
            ListTile(
              title: Text("THE GREAT GATSBY"),
              subtitle: Text("Author: F.SCOTT-FITZGERALD"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/thegreatgasby.jpg",
                ),
              ),
              trailing: Text("Rating : 7.7"),
            ),
            ListTile(
              title: Text("THE SECRET"),
              subtitle: Text("Author: RHONDA BRYANE"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/thesceret.jpg",
                ),
              ),
              trailing: Text("Rating : 9.2"),
            ),
            ListTile(
              title: Text("CRIME AND PUNISHMENT"),
              subtitle: Text("Author: DOSTOYEVSKY"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/crimepunishment.jpg",
                ),
              ),
              trailing: Text("Rating : 8.8"),
            ),
            ListTile(
              title: Text("KARMA"),
              subtitle: Text("Author: SADHGURU"),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  "assets/images/karma.jpg",
                ),
              ),
              trailing: Text("Rating : 9.5"),
            ),
          ],
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LoginPage()), (route) => false);
  }
}
