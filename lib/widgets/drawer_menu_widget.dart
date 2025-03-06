import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerMenuWidget extends BaseRoute {
  const DrawerMenuWidget({super.key, super.a, super.o}) : super(r: 'DrawerMenuWidget');

  @override
  BaseRouteState createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends BaseRouteState {
  _DrawerMenuWidgetState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.7,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
            ),
            child: Drawer(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xffD6376E), Color(0xFFAD45B3)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: ListView(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'View Profile',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        MdiIcons.archiveOutline,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Archive Conversation',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Delete Chat',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Clear History',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Search Chat',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        MdiIcons.viewArray,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'View Media',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.block,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Block User',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    const Divider(
                      color: Colors.white54,
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.report,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Report User',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
