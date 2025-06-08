import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/product.dart';
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/products_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:datingapp/screens/interest_screen.dart';
import 'package:datingapp/screens/invitation_dialog.dart';
import 'package:datingapp/screens/invitations_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FriendsScreen extends BaseRoute {
  const FriendsScreen({super.key, super.a, super.o}) : super(r: 'FriendsScreen');

  @override
  BaseRouteState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends BaseRouteState {
  int _currentIndex = 0;
  TabController? _tabController;
  List<UserProfile> friends = [];
  List<UserProfile> filteredFriends = [];
  List<Product> products = [];
  Map<String, bool> reservationStatus = {};
  Map<String, String?> reservedByUsers = {};
  late UserProfile currentProfile;
  late UserProfile selectedFriend;
  ProductHandler productHandler = ProductHandler();
  bool _isLoading = true;
  bool _showFriendSelection = true;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    currentProfile = userProvider.userProfile ?? UserProfile(id: "", email: "");
    generateRandomFriends();
    searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      searchQuery = searchController.text;
      _filterFriends();
    });
  }

  void _filterFriends() {
    if (searchQuery.isEmpty) {
      filteredFriends = List.from(friends);
    } else {
      filteredFriends = friends.where((friend) {
        final fullName = '${friend.firstName} ${friend.lastName}'.toLowerCase();
        return fullName.contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  void generateRandomFriends() {
    final List<String> firstNames = [
      'Emma', 'Liam', 'Olivia', 'Noah', 'Ava', 'Ethan', 'Sophia', 'Mason',
      'Isabella', 'William', 'Mia', 'James', 'Charlotte', 'Benjamin', 'Amelia',
      'Lucas', 'Harper', 'Henry', 'Evelyn', 'Alexander'
    ];
    
    final List<String> lastNames = [
      'Smith', 'Johnson', 'Williams', 'Brown', 'Jones', 'Garcia', 'Miller',
      'Davis', 'Rodriguez', 'Martinez', 'Hernandez', 'Lopez', 'Gonzalez',
      'Wilson', 'Anderson', 'Thomas', 'Taylor', 'Moore', 'Jackson', 'Martin'
    ];

    friends.clear();
    for (int i = 0; i < 20; i++) {
      friends.add(UserProfile(
        id: 'friend_$i',
        email: '${firstNames[i % firstNames.length].toLowerCase()}.${lastNames[i % lastNames.length].toLowerCase()}@example.com',
        firstName: firstNames[i % firstNames.length],
        lastName: lastNames[i % lastNames.length],
      ));
    }
    
    filteredFriends = List.from(friends);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
        body: SafeArea(
          child: _showFriendSelection ? _buildFriendSelectionScreen() : _buildWishlistScreen(),
        ),
      ),
    );
  }

  Widget _buildFriendSelectionScreen() {
    return Column(
      children: [
        // Header with modern design
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF9C27B0), // Purple
                const Color(0xFFE91E63), // Pink
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9C27B0).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gift Network',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => InvitationsScreen(
                              a: widget.analytics,
                              o: widget.observer,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Wishlist Description with modern card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.card_giftcard,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Share Your Gift List',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Connect with friends to discover and share perfect gifts. Make gift-giving more meaningful and personal.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Search and Add Friend Section with modern design
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF9C27B0).withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'Search friends...',
                      prefixIcon: Icon(
                        Icons.search,
                        color: const Color(0xFF9C27B0),
                      ),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: const Color(0xFF9C27B0),
                              ),
                              onPressed: () {
                                searchController.clear();
                              },
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF9C27B0),
                      const Color(0xFFE91E63),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF9C27B0).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const InvitationDialog(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // My Wishlist Section with modern design
        Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              setState(() {
                _isLoading = true;
                _showFriendSelection = false;
                selectedFriend = currentProfile;
              });
              fetchProducts(currentProfile.id);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF9C27B0).withOpacity(0.1),
                    const Color(0xFFE91E63).withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: const Color(0xFF9C27B0).withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF9C27B0).withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF9C27B0),
                          const Color(0xFFE91E63),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF9C27B0).withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                      child: Text(
                        '${currentProfile.firstName[0].toUpperCase()}${currentProfile.lastName[0].toUpperCase()}',
                        style: TextStyle(
                          color: const Color(0xFF9C27B0),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Gift List',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'View and manage your wishlist items',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: const Color(0xFF9C27B0),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Friends List Header with modern design
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Friends\' Gift Lists',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF9C27B0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${filteredFriends.length} friends',
                  style: TextStyle(
                    color: const Color(0xFF9C27B0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Friends List with modern design
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : filteredFriends.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No friends found',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try a different search term',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: filteredFriends.length,
                      itemBuilder: (context, index) {
                        final friend = filteredFriends[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: InkWell(
                            onTap: () {
                              _moveToTop(friend);
                              setState(() {
                                _isLoading = true;
                                _showFriendSelection = false;
                                selectedFriend = friend;
                              });
                              fetchProducts(friend.id);
                            },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xFF9C27B0),
                                      const Color(0xFFE91E63),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF9C27B0).withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                                  child: Text(
                                    '${friend.firstName[0].toUpperCase()}${friend.lastName[0].toUpperCase()}',
                                    style: TextStyle(
                                      color: const Color(0xFF9C27B0),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${friend.firstName} ${friend.lastName}',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: g.isDarkModeEnable ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'View gift list',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF9C27B0).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: const Color(0xFF9C27B0),
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildWishlistScreen() {
    return Column(
      children: [
        // Header with modern design
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                g.AppColors.primary,
                g.AppColors.secondary,
              ],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: g.AppColors.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _showFriendSelection = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Gift List',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Products List with modern design
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  g.AppColors.primary.withOpacity(0.1),
                                  g.AppColors.secondary.withOpacity(0.1),
                                ],
                              ),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: g.AppColors.primary.withOpacity(0.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Icon(
                              MdiIcons.giftOpen,
                              size: 48,
                              color: g.AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Your Gift List is Empty',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Start adding items to your gift list',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InterestScreen(
                                    a: widget.analytics,
                                    o: widget.observer,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: g.AppColors.primary,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            icon: const Icon(Icons.add),
                            label: const Text('Add Items'),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: _buildProductCard(products[index]),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  Widget _buildProductCard(Product product) {
    final isReserved = reservationStatus[product.id] == true;
    final reservedByMe = reservedByUsers[product.id] == currentProfile.id;
    
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: isReserved
            ? Border.all(
                color: reservedByMe ? Colors.green : Colors.orange,
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
          // Product Image with modern design
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => InterestScreen(
                    a: widget.analytics,
                    o: widget.observer,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(24)),
              child: SizedBox(
                width: 140,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Product Info with modern design
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => InterestScreen(
                      a: widget.analytics,
                      o: widget.observer,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name ?? 'No name',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: g.isDarkModeEnable ? Colors.white : g.AppColors.lightText,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                g.AppColors.primary.withOpacity(0.1),
                                g.AppColors.secondary.withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                color: g.AppColors.primary,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
                                style: TextStyle(
                                  color: g.AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (product.rating != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  product.rating!.toStringAsFixed(1),
                                  style: TextStyle(
                                    color: Colors.amber[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Action buttons
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Reserve/Unreserve button (only show for friends' lists, not own list)
                if (selectedFriend.id != currentProfile.id) ...[
                  InkWell(
                    onTap: () => _toggleReservation(product),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: (reservationStatus[product.id] == true)
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: (reservationStatus[product.id] == true)
                              ? Colors.orange.withOpacity(0.3)
                              : Colors.green.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            (reservationStatus[product.id] == true)
                                ? Icons.bookmark_remove
                                : Icons.bookmark_add,
                            color: (reservationStatus[product.id] == true)
                                ? Colors.orange
                                : Colors.green,
                            size: 18,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            (reservationStatus[product.id] == true)
                                ? 'Unreserve'
                                : 'Reserve',
                            style: TextStyle(
                              color: (reservationStatus[product.id] == true)
                                  ? Colors.orange
                                  : Colors.green,
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
                // Remove button (only show for own list)
                if (selectedFriend.id == currentProfile.id)
                  InkWell(
                    onTap: () => _showRemoveConfirmationDialog(product),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.red.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                            size: 18,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 9,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
            ],
          ),
          // Reservation status indicator
          if (isReserved)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: reservedByMe ? Colors.green : Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      reservedByMe ? 'Reserved by You' : 'Reserved',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _moveToTop(UserProfile selectedFriend) {
    // Remove the friend from current position
    friends.removeWhere((friend) => friend.id == selectedFriend.id);
    // Add to the beginning of the list
    friends.insert(0, selectedFriend);
    // Update filtered list
    _filterFriends();
  }

  Future<void> fetchFriends() async {
    var fetchedFriends = await UserRelationsHandler().getUserProfileRelations(currentProfile.id);
    setState(() {
      friends = fetchedFriends;
      _isLoading = false;
    });
  }

  Future<void> fetchProducts(String id) async {
    try {
      setState(() {
        _isLoading = true;
      });
      
      // For testing purposes, generate random products for friends
      if (id != currentProfile.id) {
        _generateRandomProductsForFriend(id);
      } else {
        // For current user, try to fetch from database, fallback to random
        try {
          final result = await productHandler.getSuperLikedProductsWithReservationsByUser(id);
          setState(() {
            products = result['products'];
            reservationStatus = result['reservationStatus'];
            reservedByUsers = result['reservedByUsers'];
            _isLoading = false;
          });
        } catch (e) {
          // Fallback to random products for current user too
          _generateRandomProductsForFriend(id);
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _generateRandomProductsForFriend(String friendId) {
    final List<Map<String, dynamic>> sampleProducts = [
      {
        'id': 'prod_1_$friendId',
        'name': 'Wireless Bluetooth Headphones',
        'price': 89.99,
        'rating': 4.5,
        'image_url': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      },
      {
        'id': 'prod_2_$friendId',
        'name': 'Smart Fitness Watch',
        'price': 199.99,
        'rating': 4.3,
        'image_url': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
      },
      {
        'id': 'prod_3_$friendId',
        'name': 'Coffee Maker Machine',
        'price': 129.99,
        'rating': 4.7,
        'image_url': 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400',
      },
      {
        'id': 'prod_4_$friendId',
        'name': 'Portable Phone Charger',
        'price': 29.99,
        'rating': 4.2,
        'image_url': 'https://images.unsplash.com/photo-1609592806596-b5c5c5b8e5e5?w=400',
      },
      {
        'id': 'prod_5_$friendId',
        'name': 'Yoga Mat Premium',
        'price': 45.99,
        'rating': 4.6,
        'image_url': 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400',
      },
      {
        'id': 'prod_6_$friendId',
        'name': 'Desk Organizer Set',
        'price': 34.99,
        'rating': 4.4,
        'image_url': 'https://images.unsplash.com/photo-1586953208448-b95a79798f07?w=400',
      },
      {
        'id': 'prod_7_$friendId',
        'name': 'LED Strip Lights',
        'price': 24.99,
        'rating': 4.1,
        'image_url': 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400',
      },
      {
        'id': 'prod_8_$friendId',
        'name': 'Scented Candle Set',
        'price': 39.99,
        'rating': 4.8,
        'image_url': 'https://images.unsplash.com/photo-1602874801006-e26d3d17d0a5?w=400',
      },
    ];

    // Randomly select 3-6 products for each friend
    final random = DateTime.now().millisecondsSinceEpoch % 1000;
    final numProducts = 3 + (random % 4); // 3-6 products
    final selectedProducts = <Product>[];
    final selectedIndices = <int>{};
    
    while (selectedIndices.length < numProducts && selectedIndices.length < sampleProducts.length) {
      final index = (random + selectedIndices.length * 17) % sampleProducts.length;
      if (!selectedIndices.contains(index)) {
        selectedIndices.add(index);
        selectedProducts.add(Product.fromJson(sampleProducts[index]));
      }
    }

    // Generate random reservation status
    final Map<String, bool> tempReservationStatus = {};
    final Map<String, String?> tempReservedByUsers = {};
    
    for (final product in selectedProducts) {
      // 30% chance of being reserved
      final isReserved = (random + product.id.hashCode) % 10 < 3;
      tempReservationStatus[product.id] = isReserved;
      
      if (isReserved) {
        // 50% chance it's reserved by current user, 50% by someone else
        final reservedByCurrentUser = (random + product.id.hashCode * 2) % 2 == 0;
        tempReservedByUsers[product.id] = reservedByCurrentUser ? currentProfile.id : 'other_user_${product.id}';
      } else {
        tempReservedByUsers[product.id] = null;
      }
    }

    setState(() {
      products = selectedProducts;
      reservationStatus = tempReservationStatus;
      reservedByUsers = tempReservedByUsers;
      _isLoading = false;
    });
  }

  void _showRemoveConfirmationDialog(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Remove from Wishlist',
                  style: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to remove "${product.name}" from your wishlist?',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white70 : Colors.black87,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.orange.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'This will change the item from "Super Like" to "Like" in your preferences.',
                        style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _removeFromWishlist(product);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Remove',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _removeFromWishlist(Product product) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: g.AppColors.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  'Removing from wishlist...',
                  style: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      );

      // Remove from wishlist by updating reaction type
      await productHandler.removeFromWishlist(currentProfile.id, product.id);
      
      // Close loading dialog
      Navigator.of(context).pop();
      
      // Remove the product from the local list
      setState(() {
        products.removeWhere((p) => p.id == product.id);
      });
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${product.name} removed from wishlist',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    } catch (e) {
      // Close loading dialog if it's open
      Navigator.of(context).pop();
      
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Failed to remove item: ${e.toString()}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }

  Future<void> _toggleReservation(Product product) async {
    final isCurrentlyReserved = reservationStatus[product.id] == true;
    final reservedByMe = reservedByUsers[product.id] == currentProfile.id;
    
    if (isCurrentlyReserved && !reservedByMe) {
      // Show message that item is already reserved by someone else
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.info,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'This item is already reserved by another friend',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
      return;
    }

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: g.AppColors.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  isCurrentlyReserved ? 'Unreserving item...' : 'Reserving item...',
                  style: TextStyle(
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      );

      if (isCurrentlyReserved && reservedByMe) {
        // Unreserve the product
        await productHandler.unreserveProduct(selectedFriend.id, product.id);
        setState(() {
          reservationStatus[product.id] = false;
          reservedByUsers[product.id] = null;
        });
      } else {
        // Reserve the product
        await productHandler.reserveProduct(selectedFriend.id, product.id, currentProfile.id);
        setState(() {
          reservationStatus[product.id] = true;
          reservedByUsers[product.id] = currentProfile.id;
        });
      }
      
      // Close loading dialog
      Navigator.of(context).pop();
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  isCurrentlyReserved
                      ? '${product.name} unreserved successfully'
                      : '${product.name} reserved successfully',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    } catch (e) {
      // Close loading dialog if it's open
      Navigator.of(context).pop();
      
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Failed to ${isCurrentlyReserved ? 'unreserve' : 'reserve'} item: ${e.toString()}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
    }
  }
}
