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

class InvitationListScreen extends BaseRoute {
  const InvitationListScreen({super.key, super.a, super.o})
      : super(r: 'InvitationListScreen');

  @override
  BaseRouteState createState() => _InvitationListScreenState();
}

class _InvitationListScreenState extends BaseRouteState {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late UserProfile currentProfile;
  late List<Map<String, dynamic>> invitations = [];
  bool _isLoading = true;

  _InvitationListScreenState() : super();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    currentProfile = userProvider.userProfile ?? UserProfile(id: "", email: "");
    fetchFriends();
  }

  Future<void> fetchFriends() async {
    setState(() {
      _isLoading = true;
    });
    var fetchedInvitations = await UserRelationsHandler().getUserInvitations(currentProfile.id);
    setState(() {
      invitations = fetchedInvitations;
      _isLoading = false;
    });
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  Future<void> _updateInvitationStatus(UserProfile invitation, InvitationStatus status) async {
    var userRelations = UserRelations(
      userId: invitation.id,
      friendId: currentProfile.id,
      createdAt: DateTime.now(),
      status: status,
    );
    await UserRelationsHandler().updateUserRelations(userRelations);
    fetchFriends();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: g.scaffoldBackgroundGradientColors,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: g.isDarkModeEnable ? Colors.black26 : Colors.white24,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: g.isDarkModeEnable ? Colors.white : g.AppColors.primary,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Invitations',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: g.isDarkModeEnable ? Colors.white : g.AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: g.AppColors.primary,
                          strokeWidth: 2,
                        ),
                      )
                    : invitations.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: g.isDarkModeEnable ? Colors.white12 : Colors.white24,
                                  ),
                                  child: Icon(
                                    Icons.notifications_off_outlined,
                                    size: 48,
                                    color: g.isDarkModeEnable ? Colors.white54 : g.AppColors.primary.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Text(
                                  'No New Invitations',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: g.isDarkModeEnable ? Colors.white70 : g.AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'When someone invites you,\nit will appear here',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: g.isDarkModeEnable ? Colors.white54 : g.AppColors.primary.withOpacity(0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            itemCount: invitations.length,
                            itemBuilder: (ctx, index) {
                              var invitation = invitations[index];
                              var user = invitation['user'] as UserProfile;
                              var createdAt = invitation['created_at'] as DateTime;
                              
                              return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: g.isDarkModeEnable 
                                        ? [Colors.white12, Colors.white.withOpacity(0.08)]
                                        : [Colors.white, Colors.white.withOpacity(0.9)],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: g.AppColors.primary.withOpacity(0.1),
                                      blurRadius: 15,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                                      leading: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: g.gradientColors,
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: CircleAvatar(
                                          radius: 24,
                                          backgroundColor: g.isDarkModeEnable ? Colors.black26 : Colors.white,
                                          child: Text(
                                            '${user.firstName[0]}${user.lastName[0]}',
                                            style: TextStyle(
                                              color: g.AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        '${user.firstName} ${user.lastName}',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: g.isDarkModeEnable ? Colors.white : g.AppColors.primary,
                                        ),
                                      ),
                                      subtitle: Text(
                                        _getTimeAgo(createdAt),
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: g.isDarkModeEnable ? Colors.white60 : g.AppColors.primary.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: g.gradientColors,
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                ),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: TextButton(
                                                onPressed: () => _updateInvitationStatus(user, InvitationStatus.accepted),
                                                style: TextButton.styleFrom(
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                ),
                                                child: const Text('Accept'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: g.isDarkModeEnable ? Colors.white12 : Colors.white,
                                                borderRadius: BorderRadius.circular(20),
                                                border: Border.all(
                                                  color: g.AppColors.primary.withOpacity(0.3),
                                                ),
                                              ),
                                              child: TextButton(
                                                onPressed: () => _updateInvitationStatus(user, InvitationStatus.rejected),
                                                style: TextButton.styleFrom(
                                                  foregroundColor: g.AppColors.primary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                ),
                                                child: const Text('Decline'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

