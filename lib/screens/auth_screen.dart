import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sg_finance/screens/nav_screen.dart';
import 'package:sg_finance/utils/color_utils.dart';
import 'package:sg_finance/utils/image_utils.dart';
import 'package:sg_finance/utils/style_utils.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  List<int> authNumber = [];
  List<String> artesteries = [];

  void validateAuth(int number) {
    
    if (authNumber.length < 6) {
      setState(() {
        authNumber.add(number);
        artesteries.add('*');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:const Icon(
              Icons.arrow_back_ios,
              size: 26,
            )),
        centerTitle: true,
        title: SvgPicture.asset(
          svgSg,
          // height: 30,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Text(
            artesteries.join(),
            style: st00002B60020,
          ),
          const Divider(thickness: 4, color: kcC7C4C4),
          Row(
            children: [
              Text(
                'Se souvenir de moi',
                style: st73737360020.copyWith(
                    color: Colors.black.withOpacity(0.56)),
              ),
              const SizedBox(width: 14),
              Icon(
                Icons.info_outline,
                color: Colors.black.withOpacity(0.39),
              ),
              const Spacer(),
              Transform.translate(
                  offset: const Offset(14, 0),
                  child: Switch(value: false, onChanged: (value) {}))
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.14),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Saisissez votre code secret',
                  style: st73737360020.copyWith(
                      fontSize: 18, color: Colors.black.withOpacity(0.64)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circleIcon(authNumber.isEmpty ? kcE0E0E0 : kc387E3C),
                    circleIcon(authNumber.length >= 2 ? kc387E3C : kcE0E0E0),
                    circleIcon(authNumber.length >= 3 ? kc387E3C : kcE0E0E0),
                    circleIcon(authNumber.length >= 4 ? kc387E3C : kcE0E0E0),
                    circleIcon(authNumber.length >= 5 ? kc387E3C : kcE0E0E0),
                    circleIcon(authNumber.length >= 6 ? kc387E3C : kcE0E0E0),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 120,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: numberData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => validateAuth(numberData[index]),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kcEDEDED,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: kcDFDFDF,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              '${numberData[index]}',
                              style: st4D4D4D50024,
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (contex) {
                    return const NavScreen();
                  })),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 226,
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text('Valider',
                        style: stBlcak60017.copyWith(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 30),
                Text('Code secret oublié',
                    style: st73737360020.copyWith(
                        decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  List<int> numberData = [5, 6, 2, 3, 9, 4, 1, 8, 7, 0];

  Widget circleIcon(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Icon(
        Icons.circle,
        size: 14,
        color: color,
      ),
    );
  }
}
