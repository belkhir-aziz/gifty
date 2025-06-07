import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/models/user_relations.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:datingapp/utils/data_types/invitation_status.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class InvitationsScreen extends BaseRoute {
  const InvitationsScreen({super.key, super.a, super.o}) : super(r: 'InvitationsScreen');

  @override
  BaseRouteState createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends BaseRouteState {
  List<UserProfile> pendingInvitations = [];
  bool _isLoading = true;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    _loadInvitations();
  }

  Future<void> _loadInvitations() async {
    try {
      final invitations = await UserRelationsHandler().getPendingInvitations(userProvider.userProfile?.id ?? '');
      setState(() {
        pendingInvitations = invitations;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
      appBar: AppBar(
        title: const Text('Invitations'),
        backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : pendingInvitations.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail_outline,
                        size: 64,
                        color: g.isDarkModeEnable ? Colors.white70 : Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Pending Invitations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: g.isDarkModeEnable ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'When someone sends you an invitation,\nit will appear here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: g.isDarkModeEnable ? Colors.white70 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: pendingInvitations.length,
                  itemBuilder: (context, index) {
                    final invitation = pendingInvitations[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: g.AppColors.primary,
                          child: Text(
                            '${invitation.firstName[0]}${invitation.lastName[0]}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          '${invitation.firstName} ${invitation.lastName}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          invitation.email,
                          style: TextStyle(
                            color: g.isDarkModeEnable ? Colors.white70 : Colors.grey,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.check, color: Colors.green),
                              onPressed: () => _handleInvitation(invitation.id, true),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.red),
                              onPressed: () => _handleInvitation(invitation.id, false),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  Future<void> _handleInvitation(String userId, bool accept) async {
    try {
      if (accept) {
        await UserRelationsHandler().acceptInvitation(
          userProvider.userProfile?.id ?? '',
          userId,
        );
      } else {
        await UserRelationsHandler().rejectInvitation(
          userProvider.userProfile?.id ?? '',
          userId,
        );
      }
      _loadInvitations();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error ${accept ? 'accepting' : 'rejecting'} invitation'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

