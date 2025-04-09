import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class InvitationListScreen extends BaseRoute {
  const InvitationListScreen({super.key, super.a, super.o})
      : super(r: 'InvitationListScreen');

  @override
  BaseRouteState createState() => _InvitationListScreenState();
}

class _InvitationListScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProfile currentProfile;
  late List<UserProfile> invitations = [];
  _InvitationListScreenState() : super();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    currentProfile = userProvider.userProfile ?? UserProfile(id: "", email: "");
    fetchFriends();
  }

  Future<void> fetchFriends() async {
    var fetchedInvitations = await UserRelationsHandler().getUserInvitations(currentProfile.id);
    setState(() {
      invitations = fetchedInvitations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: g.scaffoldBackgroundGradientColors,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
              icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
              color: Theme.of(context).iconTheme.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: invitations.length,
                    itemBuilder: (ctx, index) {
                      var invitation = invitations[index];
                      var initials = invitation.firstName[0] + invitation.lastName[0];
                      return Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 31,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 30,
                                    child: Text(
                                      initials,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: g.isRTL
                                      ? const EdgeInsets.only(right: 12)
                                      : const EdgeInsets.only(left: 12),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Invitation from ${invitation.firstName} ${invitation.lastName}',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .titleMedium,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 4),
                                        child: Text(
                                          'Would you like to connect?',
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle accept invitation
                                            },
                                            child: Text("accept"), // todo
                                          ),
                                          SizedBox(width: 8),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Handle decline invitation
                                            },
                                            child: Text("reject"), // todo
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 12),
                            height: 1.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: g.gradientColors,
                              ),
                            ),
                            child: const Divider(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
