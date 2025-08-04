import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';
import 'package:holbegram/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers for each text field to manage their content
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  // A boolean to toggle password visibility
  bool _passwordVisible = true;

  // Set the initial state for password visibility
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  // Dispose of controllers when the widget is removed to free up memory
  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                // Holbegram Title (reused style)
                const Text(
                  'Holbegram',
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
                ),
                // Subtitle
                const Text(
                  'Sign up to see photos and videos from your friends.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                // Email Text Field
                TextFieldInput(
                  controller: _emailController,
                  hintText: 'Email',
                  ispassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                // Full Name (Username) Text Field
                TextFieldInput(
                  controller: _usernameController,
                  hintText: 'Full Name',
                  ispassword: false,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 24),
                // Password Text Field
                TextFieldInput(
                  controller: _passwordController,
                  hintText: 'Password',
                  ispassword: _passwordVisible,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Confirm Password Text Field
                TextFieldInput(
                  controller: _passwordConfirmController,
                  hintText: 'Confirm Password',
                  ispassword: _passwordVisible,
                  keyboardType: TextInputType.text,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 28),
                // Sign Up Button
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Signup logic will be added later
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(218, 226, 37, 24),
                      ),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.grey),
                // "Have an account?" section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?"),
                    TextButton(
                      onPressed: () {
                        // `context` is a reference to the current widget's location in the widget tree, which the Navigator needs to do its job.
                        Navigator.push(
                          context,
                          // `MaterialPageRoute` is a standard Flutter class that handles the transition animation between screens (like sliding up from the bottom or fading in)
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
