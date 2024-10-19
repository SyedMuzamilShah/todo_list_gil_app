import 'package:flutter/material.dart';

import '../views/settings_view.dart';

 class MyDrawer extends StatelessWidget {
   const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
        child: SafeArea(
          child: Column(
            children: [
              // App logo
              Padding(
          padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                  Icons.lock_open_rounded,
              size: 70,
              color:Theme.of(context).colorScheme.inversePrimary
              ),
              ),
          
              Padding(padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
          
              ),
              
              //home list tile
              MyDrawerListTile(
                text: "H O M E",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
          
              //setting list tile
              MyDrawerListTile(
                  text: "S E T T I N G S",
                  icon: Icons.settings,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SettingsPage(),
                      ),
                    );
                  }
              ),
          
              const Spacer(),
          
              //logout list tile
              MyDrawerListTile(
                  text: "L O G O U T",
                  icon: Icons.logout,
                  onTap: () {},
              ),
              const SizedBox(height: 25,),
            ],
          ),
        ),
    );
  }
}

class MyDrawerListTile extends StatelessWidget {

  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawerListTile({super.key,
    required this.text,
    required this.icon,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(text,style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary),
      ),
        leading: Icon(icon, color: Theme.of(context).colorScheme.inversePrimary,
        ),
        onTap: onTap,
      ),
    );
  }
}
