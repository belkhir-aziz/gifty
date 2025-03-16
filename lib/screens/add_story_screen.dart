import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:datingapp/models/product.dart';
import 'package:datingapp/models/user_reactions.dart';
import 'package:datingapp/provider/products_handler.dart';
import 'package:datingapp/provider/user_provider.dart';
import 'package:datingapp/provider/user_reactions_handler.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tcard/tcard.dart';

@JsonEnum(alwaysCreate: true)
enum ReactionTypes { like, dislike, superLike }

class AddStoryScreen extends BaseRoute {
  const AddStoryScreen({super.key, super.a, super.o}) : super(r: 'AddStoryScreen');

  @override
  BaseRouteState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends BaseRouteState {
  final TCardController _controller = TCardController();
  int? _leftDirection;
  int? _rightDirection;
  ProductHandler productHandler = ProductHandler();
  UserReactionsHandler userReactionsHandler = UserReactionsHandler();
  UserProvider userProvider = UserProvider();
  List<Product> products = [];
  int _current = 0;
  
  Future<void> _loadProducts() async {
    try {
      products = await productHandler.getAllProducts();
      setState(() {}); // Update the UI after fetching products
    } catch (e) {
      print('Error loading products: $e');
    }
  }
  
  _AddStoryScreenState() : super();

    @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {
        exitAppDialog();
      },
      child: Scaffold(
        backgroundColor: g.isDarkModeEnable
            ? const Color(0xFF03000C)
            : Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                bottom: 18, left: 10, right: 10),
                            height:
                                MediaQuery.of(context).size.height * 0.53,
                            //MediaQuery.of(context).size.height * 0.54,
                            width: MediaQuery.of(context).size.width * 0.80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(g.isDarkModeEnable
                                    ? 'assets/images/cards_dark.png'
                                    : 'assets/images/cards_light.png'),
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.70,
                                width: MediaQuery.of(context).size.width *
                                    0.75,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Listener(
                                    onPointerMove:
                                        (PointerMoveEvent event) {
                                      if (event.delta.dy > 0) {
                                        setState(() {
                                          _leftDirection = 1;
                                          _rightDirection = null;
                                        });
                                      }
                                      if (event.delta.dx > 0) {
                                        setState(() {
                                          _rightDirection = 2;
                                          _leftDirection = null;
                                        });
                                      }
                                    },
                                    child: TCard(
                                      cards: _widgets(),
                                      controller: _controller,
                                      onForward: (index, info) {
                                        if (info.direction ==
                                            SwipDirection.Left) {
                                          setState(() {
                                            _current = index;
                                            _leftDirection = 0;
                                            _rightDirection = 0;
                                          });
                                        }
                                        if (info.direction ==
                                            SwipDirection.Right) {
                                          setState(() {
                                            _current = index;
                                            _leftDirection = 0;
                                            _rightDirection = 0;
                                          });
                                        }
                                      },
                                      onEnd: () {
                                        _controller.reset();
                                        _current = 0;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            alignment: Alignment.bottomLeft,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 35,
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            products[_current].imageUrl,
                                          ),
                                          radius: 32,
                                        ),
                                      ),
                                      Padding(
                                        padding: g.isRTL
                                            ? const EdgeInsets.only(
                                                right: 6)
                                            : const EdgeInsets.only(
                                                left: 6),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: products[_current].name != null
                                                    ? (products[_current].name!.length > 15
                                                        ? products[_current].name!.substring(0, 15) + '...'
                                                        : products[_current].name!)
                                                    : 'No name',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall
                                                    ?.copyWith(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight
                                                                .w400),
                                              ),
                                              TextSpan(
                                                text: products[_current].price.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                        color:
                                                            Colors.white70,
                                                        fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.forward(
                                direction: SwipDirection.Right);
                            _saveReaction(products[_current].id, ReactionTypes.like);
                          },
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF34F07F),
                            radius: 24,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: _leftDirection == 1
                                  ? const Color(0xFF34F07F)
                                  : Colors.white,
                              child: Icon(
                                Icons.thumb_up,
                                color: _leftDirection == 1
                                    ? Colors.white
                                    : const Color(0xFF34F07F),
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFBC7D),
                                    Color(0xFFEF5533),
                                  ],
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  _saveReaction(products[_current].id, ReactionTypes.superLike);
                                },
                                child: const CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        InkWell(
                          onTap: () {
                            _controller.forward(
                                direction: SwipDirection.Left);
                                _saveReaction(products[_current].id, ReactionTypes.dislike);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFFF0384F),
                              radius: 24,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: _rightDirection == 2
                                    ? const Color(0xFFF0384F)
                                    : Colors.white,
                                child: Icon(
                                  Icons.thumb_down,
                                  color: _rightDirection == 2
                                      ? Colors.white
                                      : const Color(0xFFF0384F),
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                              onTap: () {
                                _showInfoDialog(context);
                              },
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF2285FA),
                                Color(0xFF1B40C1),
                              ],
                            ),
                          ),
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              MdiIcons.informationVariant,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }


  _widgets() {
    List<Widget> widgetList = [];
    for (int i = 0; i < products.length; i++) {
      widgetList.add(
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  products[i].imageUrl,
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.70 - 1.5,
              width: MediaQuery.of(context).size.width * 0.75 - 1.5,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      );
    }
    return widgetList;
  }
  
  Future<void> _saveReaction(String productId, ReactionTypes reactionType) async {
    try {
      if (userProvider.userProfile != null){
        final reaction = Reaction(
        userId: userProvider.userProfile!.id,
        productId: productId,
        createdAt: DateTime.now(),
        reactionType: reactionType);

        await userReactionsHandler.saveReaction(reaction);
        print('Reaction saved successfully');
      }
    } catch (e) {
      print('Error saving reaction: $e');
    }
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Information'),
          content: Text('This is an empty dialog for now.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
