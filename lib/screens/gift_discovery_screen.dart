import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/product.dart';
import 'package:datingapp/models/user_reactions.dart';
import 'package:datingapp/provider/products_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_reactions_handler.dart';
import 'package:datingapp/utils/data_types/reaction_types.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tcard/tcard.dart';
import 'package:url_launcher/url_launcher.dart';

class GiftDiscoveryScreen extends BaseRoute {
  const GiftDiscoveryScreen({super.key, super.a, super.o}) : super(r: 'GiftDiscoveryScreen');

  @override
  BaseRouteState createState() => _GiftDiscoveryScreenState();
}

class _GiftDiscoveryScreenState extends BaseRouteState {
  final TCardController _controller = TCardController();
  ProductHandler productHandler = ProductHandler();
  UserReactionsHandler userReactionsHandler = UserReactionsHandler();
  UserProvider userProvider = UserProvider();
  List<Product> products = [];
  int _current = 0;
  bool _isLoading = true;
  bool _showHelpPopup = true; // Always show initially
  bool _isHelpExpanded = false; // Start collapsed
  
  Future<void> _loadProducts() async {
    try {
      products = await productHandler.fetchProducts(userProvider);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error loading products: $e');
      }
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  _GiftDiscoveryScreenState() : super();

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    
    // Show message if no products are available
    if (products.isEmpty) {
      return Scaffold(
        backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Header with modern design matching friends screen
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover Gifts',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // No products message
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard,
                          size: 80,
                          color: g.isDarkModeEnable ? Colors.white54 : Colors.grey,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'No Gifts Available',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Complete your profile to see personalized gift recommendations!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: g.isDarkModeEnable ? Colors.white70 : Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            _loadProducts(); // Retry loading products
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: g.AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text('Refresh'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        backgroundColor: g.isDarkModeEnable ? g.AppColors.darkBackground : Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              // Header with modern design matching friends screen
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover Gifts',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Main content
              Expanded(
                child: Stack(
                  children: [
                    // Cards
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TCard(
                          cards: _widgets(),
                          controller: _controller,
                          onForward: (index, info) {
                            setState(() {
                              _current = index;
                            });
                          },
                          onEnd: () {
                            _controller.reset();
                            _current = 0;
                          },
                          onBack: (index, info) {
                            setState(() {
                              _current = index;
                            });
                          },
                          size: Size(
                            MediaQuery.of(context).size.width * 0.9,
                            MediaQuery.of(context).size.height * 0.75,
                          ),
                        ),
                      ),
                    ),
                    // Help popup
                    if (_showHelpPopup) _buildHelpPopup(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    required double size,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Icon(
              icon,
              color: color,
              size: size,
            ),
          ),
        ),
      ),
    );
  }

  _widgets() {
    List<Widget> widgetList = [];
    for (int i = 0; i < products.length; i++) {
      widgetList.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  products[i].imageUrl,
                  fit: BoxFit.cover,
                ),
                // Action buttons at the bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Dislike button
                      Container(
                        decoration: BoxDecoration(
                          color: g.AppColors.error.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: g.AppColors.error.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            _controller.forward(direction: SwipDirection.Left);
                            _saveReaction(products[_current].id, ReactionTypes.dislike);
                          },
                        ),
                      ),
                      // Like button
                      Container(
                        decoration: BoxDecoration(
                          color: g.AppColors.success.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: g.AppColors.success.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.favorite),
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            _controller.forward(direction: SwipDirection.Right);
                            _saveReaction(products[_current].id, ReactionTypes.like);
                          },
                        ),
                      ),
                      // Buy Gift button
                      Container(
                        decoration: BoxDecoration(
                          color: g.AppColors.primary.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: g.AppColors.primary.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () => _goToMerchant(context),
                        ),
                      ),
                      // Save to wishlist button
                      Container(
                        decoration: BoxDecoration(
                          color: g.AppColors.warning.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: g.AppColors.warning.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.bookmark),
                          color: Colors.white,
                          iconSize: 32,
                          onPressed: () {
                            _controller.forward(direction: SwipDirection.Right);
                            _saveReaction(products[_current].id, ReactionTypes.superLike);
                            _showSaveConfirmation(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Product info overlay
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[i].name ?? 'No name',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: g.AppColors.primary.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '\$${products[i].price?.toStringAsFixed(2) ?? '0.00'}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (products[i].rating != null) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    products[i].rating!.toStringAsFixed(1),
                                    style: const TextStyle(
                                      color: Colors.white,
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
              ],
            ),
          ),
        ),
      );
    }
    return widgetList;
  }

  Future<void> _saveReaction(String productId, ReactionTypes reactionType) async {
    try {
      if (userProvider.userProfile != null) {
        final reaction = Reaction(
          userId: userProvider.userProfile!.id,
          productId: productId,
          createdAt: DateTime.now(),
          reactionType: reactionType,
        );
        userProvider.removeInteractedProduct(productId);
        await userReactionsHandler.saveReaction(reaction);
        if (kDebugMode) {
          print(reaction.reactionType.toString());
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error saving reaction: $e');
      }
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            products[_current].name ?? 'No name',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(products[_current].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: g.AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.local_offer,
                          color: g.AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${products[_current].price?.toStringAsFixed(2) ?? '0.00'}',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: g.AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (products[_current].affiliateLink != null && products[_current].affiliateLink!.isNotEmpty)
                InkWell(
                  onTap: () async {
                    final Uri url = Uri.parse(products[_current].affiliateLink!);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      if (kDebugMode) {
                        print('Could not launch ${products[_current].affiliateLink}');
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Could not open the product link'),
                          backgroundColor: g.AppColors.primary,
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: g.AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.link,
                          color: g.AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'View Product',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: g.AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
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
                )
              else
                Text(
                  'No affiliate link available',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: TextStyle(
                  color: g.AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _goToMerchant(BuildContext context) async {
    if (products[_current].affiliateLink != null && products[_current].affiliateLink!.isNotEmpty) {
      final Uri url = Uri.parse(products[_current].affiliateLink!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (kDebugMode) {
          print('Could not launch ${products[_current].affiliateLink}');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not open the merchant link'),
            backgroundColor: g.AppColors.error,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No merchant link available for this product'),
          backgroundColor: g.AppColors.warning,
        ),
      );
    }
  }

  void _showSaveConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Saved to your wish list!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        backgroundColor: g.AppColors.warning,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildHelpPopup() {
    return Positioned(
      top: 30,
      right: 20,
      left: _isHelpExpanded ? 20 : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        width: _isHelpExpanded ? null : 48,
        height: _isHelpExpanded ? null : 48,
        constraints: _isHelpExpanded
          ? BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 40,
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            )
          : const BoxConstraints(
              minWidth: 48,
              maxWidth: 48,
              minHeight: 48,
              maxHeight: 48,
            ),
        decoration: BoxDecoration(
          color: g.isDarkModeEnable ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(_isHelpExpanded ? 12 : 24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: _isHelpExpanded ? _buildExpandedHelp() : _buildCollapsedHelp(),
      ),
    );
  }

  Widget _buildCollapsedHelp() {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: () {
          setState(() {
            _isHelpExpanded = true;
          });
        },
        borderRadius: BorderRadius.circular(28),
        splashColor: g.AppColors.primary.withOpacity(0.2),
        highlightColor: g.AppColors.primary.withOpacity(0.1),
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Pulsing animation background
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: g.AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // Help icon with better styling
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: g.AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.help_outline_rounded,
                  color: g.AppColors.primary,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedHelp() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'How to Use',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Minimize button
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isHelpExpanded = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.minimize,
                        color: g.AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Close button
                  InkWell(
                    onTap: () {
                      setState(() {
                        _showHelpPopup = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        color: g.AppColors.error,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Help content - make it scrollable
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHelpItem(
                    icon: Icons.close,
                    color: g.AppColors.error,
                    title: 'Dislike',
                    description: 'Skip this product if you don\'t like it',
                  ),
                  const SizedBox(height: 12),
                  _buildHelpItem(
                    icon: Icons.favorite,
                    color: g.AppColors.success,
                    title: 'Like',
                    description: 'Show interest in this product',
                  ),
                  const SizedBox(height: 12),
                  _buildHelpItem(
                    icon: Icons.shopping_cart,
                    color: g.AppColors.primary,
                    title: 'Go to Merchant',
                    description: 'Visit the store to check and buy this product',
                  ),
                  const SizedBox(height: 12),
                  _buildHelpItem(
                    icon: Icons.bookmark,
                    color: g.AppColors.warning,
                    title: 'Save to Wishlist',
                    description: 'Save it so friends can see it and know what you like',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleHelpItem(IconData icon, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              icon,
              color: color,
              size: 14,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: g.isDarkModeEnable ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpItem({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: g.isDarkModeEnable ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: g.isDarkModeEnable ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
