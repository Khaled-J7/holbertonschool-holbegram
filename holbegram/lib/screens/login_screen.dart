import 'package:flutter/material.dart';
import 'package:holbegram/widgets/text_field.dart';
import 'package:holbegram/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers for each text field to manage their content
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // A boolean to toggle password visibility
  bool _passwordVisible = true; // To toggle password visibility

  /// This is called when the widget is created.
  /// This method runs automatically one time when the page is first created. It's the perfect place to set up any initial values (like : _passwordVisible = true)
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  /// This runs automatically when the page is closed and removed from the screen. This is a critical cleanup step.
  /// We must dispose() of our controllers to free up the memory they were using. Forgetting this can cause performance problems in larger apps
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Makes the screen scrollable
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 28),
                // Holbegram Title
                const Text(
                  'Holbegram',
                  style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
                ),
                // Logo Image
                SizedBox(
                  height: 60,
                  width: 80,
                  child: Image.asset('assets/images/logo.png'),
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
                      // setState() notifies the framework that the state has changed
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 28),
                // Log In Button
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // We will add login logic later
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(218, 226, 37, 24),
                      ),
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.grey),

                const SizedBox(height: 24),
                // "Forgot password?" section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Forgot your login details?'),
                    TextButton(
                      onPressed: () {}, // Leave empty for now
                      child: const Text(
                        'Get help logging in.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // OR Divider
                const Row(
                  children: [
                    Flexible(child: Divider(thickness: 2)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR'),
                    ),
                    Flexible(child: Divider(thickness: 2)),
                  ],
                ),
                const SizedBox(height: 10),
                // Sign in with Google
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/images/google-logo.png'),
                    ),
                    const SizedBox(width: 8),
                    const Text('Sign in with Google'),
                  ],
                ),
                const SizedBox(height: 10),
                // "Don't have an account?" section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // navigation Logic
                        // `context` is a reference to the current widget's location in the widget tree, which the Navigator needs to do its job.
                        Navigator.push(
                          context,
                          // `MaterialPageRoute` is a standard Flutter class that handles the transition animation between screens (like sliding up from the bottom or fading in)
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(218, 226, 37, 24),
                        ),
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
