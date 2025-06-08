import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/user_profile_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/widgets/bottom_navigation_bar_widget_light.dart';
import 'package:flutter/material.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class LikesInterestScreen extends BaseRoute {
  final UserProfile userProfile; 
  final bool isEditHobbies;
  const LikesInterestScreen({super.key, super.a, super.o, required this.userProfile, required this.isEditHobbies}) : super(r: 'LikesIntrestScreen');

  @override
  BaseRouteState createState() => _LikesInterestScreenState(userProfile,isEditHobbies);
}

class _LikesInterestScreenState extends BaseRouteState {
  final UserProfile userProfile;
  final UserProfileHandler userProfileHandler = UserProfileHandler();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> _list = [];
  late UserProvider userProvider;
  bool isEditHobbies = false;
  bool _isLoading = false;
  
  _LikesInterestScreenState(this.userProfile, this.isEditHobbies);
  
  // Available interests with their icons
  final List<Map<String, dynamic>> availableInterests = [
    {'name': 'readers', 'icon': MdiIcons.book},
    {'name': 'pet lovers', 'icon': MdiIcons.paw},
    {'name': 'gamers', 'icon': Icons.videogame_asset},
    {'name': 'musicians', 'icon': MdiIcons.music},
    {'name': 'travelers', 'icon': Icons.travel_explore_outlined},
    {'name': 'artists', 'icon': Icons.palette},
    {'name': 'chefs', 'icon': MdiIcons.chefHat},
    {'name': 'fitness enthusiasts', 'icon': MdiIcons.run},
  ];
  
  void updateProfileUser() async {
    setState(() => _isLoading = true);
    try {
      userProfile.hobbies = _list;
      userProvider.setUserProfile(userProfile);
      await userProfileHandler.createUserProfile(userProfile);
      userProvider.clearCachedProducts();
      
      if (mounted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => BottomNavigationWidgetLight(
            currentIndex: 0,
            a: widget.analytics,
            o: widget.observer,
          ),
        ));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> editProfileUser() async {
    setState(() => _isLoading = true);
    try {
      userProfile.hobbies = _list;
      final response = await userProfileHandler.editUserProfile(userProfile);
      userProvider.setUserProfile(userProfile);
      userProvider.clearCachedProducts();
      
      if (mounted) {
        Navigator.of(context).pop(_list); // Return the updated list
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update interests: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    if (isEditHobbies) {
      _list = List.from(userProvider.userProfile?.hobbies ?? []);
    }
  }

  Widget _buildInterestChip(Map<String, dynamic> interest) {
    final isSelected = _list.contains(interest['name']);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _list.remove(interest['name']);
          } else {
            _list.add(interest['name']);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFF9C27B0)
              : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected 
                ? const Color(0xFF9C27B0)
                : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected 
                  ? const Color(0xFF9C27B0).withOpacity(0.3)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              interest['icon'],
              color: isSelected ? Colors.white : const Color(0xFF9C27B0),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              interest['name'],
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF9C27B0),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: _appBarWidget(),
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFF9C27B0),
                        const Color(0xFFE91E63),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9C27B0).withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isEditHobbies ? 'Edit Your Interests' : AppLocalizations.of(context)!.lbl_likes_intrets,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isEditHobbies 
                            ? 'Update your interests to get better matches'
                            : AppLocalizations.of(context)!.lbl_likes_intrets_subtitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Selected count
                if (_list.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_list.length} interest${_list.length == 1 ? '' : 's'} selected',
                      style: const TextStyle(
                        color: Color(0xFF9C27B0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                
                const SizedBox(height: 20),
                
                // Interests Grid
                Wrap(
                  alignment: WrapAlignment.start,
                  children: availableInterests.map((interest) => _buildInterestChip(interest)).toList(),
                ),
                
                const SizedBox(height: 40),
                
                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : () {
                      if (isEditHobbies) {
                        editProfileUser();
                      } else {
                        updateProfileUser();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9C27B0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      elevation: 4,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            isEditHobbies ? 'Save Changes' : AppLocalizations.of(context)!.btn_continue,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: IconButton(
                  icon: const Icon(FontAwesomeIcons.longArrowAltLeft),
                  color: Theme.of(context).iconTheme.color,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                trailing: !isEditHobbies ? InkWell(
                  onTap: () {
                    updateProfileUser();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.btn_skip,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 14, color: const Color(0xFFDD3663)),
                  ),
                ) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
