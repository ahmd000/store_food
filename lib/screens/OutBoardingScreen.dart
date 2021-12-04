import 'package:flutter/material.dart';
import 'package:store_app/Configers/Configers.dart';
import 'package:store_app/widgets/out_boarding_contents/out_boarding_content1.dart';
import 'package:store_app/widgets/out_boarding_contents/out_boarding_content2.dart';
import 'package:store_app/widgets/out_boarding_contents/out_boarding_content3.dart';
import 'package:store_app/widgets/out_boarding_indicator.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            image: DecorationImage(
              image: AssetImage(borderBackground),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Visibility(
                visible: _currentPage < 2,
                replacement: TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: Text(
                    'START',
                    style: TextStyle(
                      color: Colors.amber.shade900,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () => _pageController.animateToPage(
                    2,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  ),
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                      color: Colors.amber.shade900,
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 0,
                  maxWidth: double.infinity,
                  minHeight: 0,
                  maxHeight: 500),
              child: PageView(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                children: [
                  OutBoardingContent1(),
                  OutBoardingContent2(),
                  OutBoardingContent3(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: _currentPage > 0
                        ? Colors.amber.shade900
                        : Colors.amber.shade300,
                  ),
                ),
                Visibility(
                  visible: _currentPage < 2,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                    marginEnd: 10, selected: _currentPage == 0),
                OutBoardingIndicator(
                    marginEnd: 10, selected: _currentPage == 1),
                OutBoardingIndicator(selected: _currentPage == 2),
              ],
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _currentPage == 2,
              maintainAnimation: true,
              maintainState: true,
              maintainSize: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login_screen'),
                  child: const Text('START'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
