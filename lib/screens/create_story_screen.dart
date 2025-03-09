import 'package:datingapp/models/businessLayer/base_route.dart';
import 'package:datingapp/models/businessLayer/global.dart' as g;
import 'package:flutter/material.dart';

class CreateStoryScreen extends BaseRoute {
  const CreateStoryScreen({super.key, super.a, super.o}) : super(r: 'CreateStoryScreen');

  @override
  BaseRouteState createState() => _CreateStoryScreenState();
}

class _CreateStoryScreenState extends BaseRouteState {
  _CreateStoryScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: _appBarWidget(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
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
                                      controller: TextEditingController(),
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
                                        onPressed: () {
                                          // Handle send invitation logic here
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Send Invitation',
                                          style: Theme.of(context)
                                              .textButtonTheme
                                              .style!
                                              .textStyle!
                                              .resolve({
                                            WidgetState.pressed,
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white),
                            gradient: LinearGradient(
                              colors: g.gradientColors,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        height: MediaQuery.of(context).size.height * 0.20,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                              child: Icon(
                                Icons.email,
                                color: const Color(0xFF33196B),
                                size: 28,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                'Send Invitation',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        fontSize: 14, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
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

  AppBar _appBarWidget() {
    return AppBar(
      title: Text('Create Story'),
      backgroundColor: g.gradientColors[0],
    );
  }
}