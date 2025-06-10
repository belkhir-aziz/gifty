import 'package:datingapp/models/user_relations.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:datingapp/utils/data_types/invitation_status.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:provider/provider.dart';

class InvitationDialog extends StatefulWidget {
  const InvitationDialog({super.key});

  @override
  _InvitationDialogState createState() => _InvitationDialogState();
}

class _InvitationDialogState extends State<InvitationDialog> {
  final TextEditingController _emailController = TextEditingController();
  final UserProfileHandler userProfileHandler = UserProfileHandler();
  final UserRelationsHandler userRelationsHandler = UserRelationsHandler();
  late UserProvider userProvider;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendInvitation() async {
    final email = _emailController.text;
    if (_isValidEmail(email)) {
      setState(() {
        _isLoading = true;
      });
      try {
        var user = await userProfileHandler.getUserProfileWithEmail(email);
        if (user == null || userProvider.userProfile == null) {
          _showError('User not found. Please make sure your friend has registered with this email.');
          return;
        }
        var relation = UserRelations(
          userId: userProvider.userProfile?.id ?? "",
          friendId: user.id,
          createdAt: DateTime.now(),
          status: InvitationStatus.pending
        );
        await userRelationsHandler.addUserRelations(relation);
        _showSuccess();
        Navigator.of(context).pop();
      } catch (e) {
        _showError('Failed to send invitation. Please try again.');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      _showError('Please enter a valid email address');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: g.AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 8),
            Text(
              'Invitation sent successfully!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: g.AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
      ),
    );
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
      title: Row(
        children: [
          const Icon(
            Icons.person_add,
            color: g.AppColors.primary,
            size: 28,
          ),
          const SizedBox(width: 12),
          Text(
            'Invite a Friend',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Enter your friend\'s email address to send them an invitation to join your wish list network.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16),
                hintText: 'friend@example.com',
                prefixIcon: const Icon(
                  Icons.email,
                  color: g.AppColors.primary,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: g.AppColors.primary.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: g.AppColors.primary.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: g.AppColors.primary),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: g.gradientColors,
                ),
              ),
              child: TextButton(
                onPressed: _isLoading ? null : _sendInvitation,
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Send Invitation',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
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