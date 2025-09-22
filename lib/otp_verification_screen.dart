import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_flutter_project/dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber; 

  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(
      6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isOtpIncorrect = false;
  
  // No longer need Ticker or StreamSubscription
  // late Ticker _ticker;
  // late StreamSubscription _countdownSubscription;

  late int _countdownSeconds;

  @override
  void initState() {
    super.initState();
    _countdownSeconds = 30;
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    String enteredOtp = _otpControllers.map((controller) => controller.text).join();
    debugPrint('Entered OTP: $enteredOtp');
    
    // In a real app, you would make an API call to verify the OTP
    const correctOtp = '123456';

    if (enteredOtp == correctOtp) {
      debugPrint('OTP matches!');
      setState(() {
        _isOtpIncorrect = false;
      });
      // Navigate to Dashboard on success
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
        (Route<dynamic> route) => false,
      );
    } else {
      debugPrint('OTP does not match. Expected $correctOtp.');
      setState(() {
        _isOtpIncorrect = true;
      });
    }
  }

  void _resendOtp() {
    // TODO: Implement actual API call to resend OTP
    debugPrint('Resending OTP...');
    setState(() {
      _countdownSeconds = 30; // Reset timer
      // Clear OTP fields
      for (var controller in _otpControllers) {
        controller.clear();
      }
      _isOtpIncorrect = false;
    });
    _focusNodes.first.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'AgriNova',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.lock_outline, color: Colors.green, size: 40),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Verify your phone number',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Please enter the 6-digit code sent to',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            widget.phoneNumber, 
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(6, (index) {
                              return SizedBox(
                                width: 40,
                                child: TextField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(1),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    hintText: '-',
                                    hintStyle: const TextStyle(color: Colors.black26),
                                    filled: true,
                                    fillColor: _isOtpIncorrect ? Colors.red.shade50 : Colors.green.shade50,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: _isOtpIncorrect ? const BorderSide(color: Colors.red, width: 2) : BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: _isOtpIncorrect ? const BorderSide(color: Colors.red, width: 2) : const BorderSide(color: Colors.green, width: 2),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      if (index < 5) {
                                        _focusNodes[index + 1].requestFocus();
                                      } else {
                                        _focusNodes[index].unfocus();
                                        _verifyOtp(); 
                                      }
                                    } else if (value.isEmpty && index > 0) {
                                      _focusNodes[index - 1].requestFocus();
                                    }
                                    if (_isOtpIncorrect) {
                                      setState(() {
                                        _isOtpIncorrect = false;
                                      });
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                          if (_isOtpIncorrect)
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Incorrect OTP. Please try again.',
                                style: TextStyle(color: Colors.red, fontSize: 14),
                              ),
                            ),
                          const SizedBox(height: 20),
                          const Text(
                            'Resend code in ',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          TweenAnimationBuilder<Duration>(
                            duration: Duration(seconds: _countdownSeconds),
                            tween: Tween(begin: Duration(seconds: _countdownSeconds), end: Duration.zero),
                            onEnd: () {
                              setState(() {
                                _countdownSeconds = 0;
                              });
                            },
                            builder: (BuildContext context, Duration value, Widget? child) {
                              final seconds = value.inSeconds;
                              return Text(
                                '${seconds.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _verifyOtp,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Submit',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: _countdownSeconds == 0 ? _resendOtp : null,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.green),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Resend Code',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}