import 'package:datingapp/models/user_relations.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:provider/provider.dart';

class InvitationDialog extends StatefulWidget {
  const InvitationDialog({Key? key}) : super(key: key);

  @override
  _InvitationDialogState createState() => _InvitationDialogState();
}

class _InvitationDialogState extends State<InvitationDialog> {
  final TextEditingController _emailController = TextEditingController();
  final UserProfileHandler userProfileHandler = UserProfileHandler();
  final UserRelationsHandler userRelationsHandler = UserRelationsHandler();
  late UserProvider userProvider;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendInvitation() async {
    final email = _emailController.text;
    if (_isValidEmail(email)) {
      var user = await userProfileHandler.getUserProfileWithEmail(email);
      if (user == null || userProvider.userProfile == null) {
        print('User not found or user profile is null');
        return;
      }
      var relation = UserRelations(
        userId: userProvider.userProfile?.id ?? "",
        friendId: user.id,
        createdAt: DateTime.now(),
      );
      userRelationsHandler.addUserRelations(relation);
      Navigator.of(context).pop();
    } else {
      print('Invalid email');
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Send Invitation',
                style: Theme.of(context).primaryTextTheme.displayLarge,
              ),
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(20),
                hintText: 'Enter recipient email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: g.gradientColors,
                ),
              ),
              child: TextButton(
                onPressed: _sendInvitation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Send Invitation',
                      style: Theme.of(context)
                          .textButtonTheme
                          .style!
                          .textStyle!
                          .resolve({
                        WidgetState.pressed,
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}