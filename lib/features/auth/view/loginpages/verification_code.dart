// ignore_for_file: avoid_print
import 'package:nira/imports.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VerificationCodeState createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/register.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                      ),
                      body: Stack(children: [
                        SingleChildScrollView(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.40,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Enter Verification Code',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.02),

                              // Six boxes for verification code entry
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  6,
                                  (index) => Row(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: TextField(
                                          controller: controllers[index],
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp(
                                                    r'[0-9]')), // Allow only numbers
                                          ],
                                          maxLength: 1,
                                          decoration: InputDecoration(
                                            fillColor: Colors
                                                .white, // Set the fill color to white
                                            filled:
                                                true, // Enable the fill color
                                            contentPadding: EdgeInsets.zero,
                                            counterText: '',
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (value.length == 1 &&
                                                index <
                                                    controllers.length - 1) {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          },
                                        ),
                                      ),
                                      if (index < 5)
                                        const SizedBox(
                                            width:
                                                10), // Add spacing between the TextFields
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: screenSize.height * 0.02),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue.shade200,
                                ),
                                onPressed: () {
                                  String verificationCode = controllers
                                      .map((controller) => controller.text)
                                      .join();
                                  print('Verification Code: $verificationCode');
                                  // Navigate to the Dashboard page
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                },
                                child: const Text(
                                  'Confirm Code',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )),
              ),
            ],
          )),
    );
  }
}
