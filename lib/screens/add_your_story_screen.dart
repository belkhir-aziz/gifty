import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/product.dart';
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/products_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:datingapp/screens/interest_screen.dart';
import 'package:datingapp/screens/invitation_dialog.dart';
import 'package:datingapp/screens/notification_list_screen.dart';
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
  List<Product> products = [];
  late UserProfile currentProfile;
  ProductHandler productHandler = ProductHandler();
  bool _isLoading = true;
  bool _showFriendSelection = true;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    currentProfile = userProvider.userProfile ?? UserProfile(id: "", email: "");
    fetchFriends();
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
        // Header with gradient background
        Container(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [g.AppColors.primary, g.AppColors.secondary],
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wishlist Network',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            IconButton(
                    icon: const Icon(
                Icons.notifications_outlined,
                      color: Colors.white,
              ),
              onPressed: () {
                      Navigator.of(context).push(
                  MaterialPageRoute(
                          builder: (context) => InvitationListScreen(
                            a: widget.analytics,
                            o: widget.observer,
                          ),
                  ),
                );
              },
            ),
                ],
              ),
              const SizedBox(height: 16),
              // Wishlist Description
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Share Your Wishlist',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
            ),
          ],
        ),
                    const SizedBox(height: 12),
                    Text(
                      'Connect with friends to share wishlists and discover perfect gifts for each other.',
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
        // Search and Add Friend Section
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search friends...',
                      prefixIcon: Icon(
                        Icons.search,
                                  color: g.AppColors.primary,
                                ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    ),
                    onChanged: (value) {
                      // Implement search functionality
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: g.AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
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
        // My Wishlist Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            _isLoading = true;
                _showFriendSelection = false;
          });
          fetchProducts(currentProfile.id);
        },
        child: Container(
              padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    g.AppColors.primary.withOpacity(0.1),
                    g.AppColors.secondary.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: g.AppColors.primary.withOpacity(0.2),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          g.AppColors.primary,
                          g.AppColors.secondary,
                        ],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                child: Text(
                  '${currentProfile.firstName[0].toUpperCase()}${currentProfile.lastName[0].toUpperCase()}',
                  style: TextStyle(
                    color: g.AppColors.primary,
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
                          'My Wishlist',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'View and manage your wishlist items',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: g.AppColors.primary,
                    size: 16,
              ),
            ],
          ),
        ),
      ),
        ),
        const SizedBox(height: 20),
        // Friends List Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Friends\' Wishlists',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: g.isDarkModeEnable ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Friends List
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
    final friend = friends[index];
    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          setState(() {
            _isLoading = true;
                            _showFriendSelection = false;
          });
          fetchProducts(friend.id);
        },
        child: Container(
                          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                            borderRadius: BorderRadius.circular(16),
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
                                      g.AppColors.primary,
                                      g.AppColors.secondary,
                                    ],
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundColor: g.isDarkModeEnable ? g.AppColors.darkSurface : Colors.white,
                child: Text(
                  '${friend.firstName[0].toUpperCase()}${friend.lastName[0].toUpperCase()}',
                  style: TextStyle(
                    color: g.AppColors.primary,
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
                                      'View wishlist',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: g.AppColors.primary,
                                size: 16,
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
        // Header with back button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: g.AppColors.primary,
                ),
                onPressed: () {
                  setState(() {
                    _showFriendSelection = true;
                  });
                },
              ),
              const SizedBox(width: 8),
              Text(
                'Wishlist',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Products List
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: g.AppColors.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              MdiIcons.giftOpen,
                              size: 48,
                              color: g.AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No saved items yet',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white70 : Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Start adding items to your wishlist',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: g.isDarkModeEnable ? Colors.white54 : Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
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

  Future<void> fetchFriends() async {
    var fetchedFriends = await UserRelationsHandler().getUserProfileRelations(currentProfile.id);
    setState(() {
      friends = fetchedFriends;
      _isLoading = false;
    });
  }

  Widget _buildProductCard(Product product) {
    return InkWell(
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
      child: Container(
        height: 120,
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
            // Product Image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
              child: SizedBox(
                width: 120,
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
            // Product Info
            Expanded(
              child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name ?? 'No name',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: g.isDarkModeEnable ? Colors.white : g.AppColors.lightText,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: g.AppColors.primary.withOpacity(0.1),
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
                      fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (product.rating != null) ...[
                          const SizedBox(width: 8),
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                    ),
                  ),
                ],
                            ),
                          ),
                        ],
                      ],
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

  Future<void> fetchProducts(String id) async {
    try {
      setState(() {
        _isLoading = true;
      });
      products = await productHandler.getSuperLikedProductsByUser(id);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
