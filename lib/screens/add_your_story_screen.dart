import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/product.dart';
import 'package:datingapp/models/user_profile.dart';
import 'package:datingapp/provider/products_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_relation_handler.dart';
import 'package:datingapp/screens/interest_screen.dart';
import 'package:datingapp/screens/invitation_dialog.dart';
import 'package:datingapp/generated/app_localizations.dart';
import 'package:datingapp/screens/notification_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final List<String> circleImageList = [
    'assets/images/img_circle_0.png',
    'assets/images/img_circle_1.png',
  ];

  _FriendsScreenState() : super();
  
  @override
  Widget build(BuildContext context) {
    
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: g.isRTL
                    ? const EdgeInsets.only(right: 15)
                    : const EdgeInsets.only(left: 10),
                child: Image.asset(
                  g.isDarkModeEnable
                      ? 'assets/images/swirl arrow.png'
                      : 'assets/images/swirl arrow_light.png',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: friends.length + 1, // Adjusted item count
                    itemBuilder: (ctx, index) {
                      if (index == 0) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const InvitationDialog();
                              },
                            );
                          },
                          child: Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(left: 10)
                                : const EdgeInsets.only(right: 10),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Color.fromARGB(255, 121, 8, 135),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            currentProfile = friends[index-1];
                            fetchProducts(currentProfile.id);
                          },
                          child: Padding(
                            padding: g.isRTL
                                ? const EdgeInsets.only(left: 10)
                                : const EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: const Color.fromARGB(255, 203, 52, 198),
                                child: Text(
                                  '${friends[(index - 1) % friends.length].firstName[0].toUpperCase()}${friends[(index - 1) % friends.length].lastName[0].toUpperCase()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TabBar(
                  labelPadding: const EdgeInsets.only(right: 30),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.only(right: 30),
                  isScrollable: true,
                  controller: _tabController,
                  indicatorColor: Theme.of(context).iconTheme.color,
                  onTap: (int index) async {
                    _currentIndex = index;
                    setState(() {});
                  },
                  tabs:  [
                    Tab(text: 'See the wished list of ${currentProfile.firstName} ${currentProfile.lastName}'), //todo
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                      ),
                      itemCount: products.length,
                      itemBuilder: (ctx, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => InterestScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                              color: g.isDarkModeEnable
                                  ? const Color(0xFF1D0529)
                                  : Colors.white54,
                            ),
                            child: GridTile(
                              header: const Align(
                                alignment: Alignment.topRight,
                              ),
                              

                              
                              footer: ListTile(
                                contentPadding:
                                    const EdgeInsets.only(left: 12, bottom: 4),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: g.isRTL
                                              ? const EdgeInsets.only(right: 6)
                                              : const EdgeInsets.all(0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  products[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),  
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    currentProfile = userProvider.userProfile ?? UserProfile(id: "", email: "");
    fetchFriends(userProvider);
    fetchProducts(userProvider.userProfile!.id);
    _tabController =
        TabController(length: 1, vsync: this, initialIndex: _currentIndex);
    _tabController!.addListener(_tabControllerListener);
    
  }


  Future<void> fetchFriends(UserProvider userProvider) async {
    UserRelationsHandler relationHandler = UserRelationsHandler();
    var fetchedFriends = await relationHandler.getUserProfileRelations(currentProfile.id);
    setState(()  {
      friends = fetchedFriends;
    });
}

  Future<void> fetchProducts(String id) async {
    ProductHandler productHandler = ProductHandler();
    var fetchedProducts  = await productHandler.getSuperLikedProductsByUser(id);
    setState(()  {
      products = fetchedProducts;
    });
}
  void _tabControllerListener() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  PreferredSizeWidget _appBarWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        AppLocalizations.of(context)!.lbl_add_friend,  
                        style: Theme.of(context).primaryTextTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: const Align(
                          alignment: Alignment.bottomRight,
                          child: Icon(
                            Icons.notifications_rounded,
                          ),
                        ),
                        color: Theme.of(context).iconTheme.color,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InvitationListScreen(
                                    a: widget.analytics,
                                    o: widget.observer,
                                  )));
                        },
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
