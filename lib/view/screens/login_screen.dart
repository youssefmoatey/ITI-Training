part of '../../utils/import-pass/import_pass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 176, 176),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // space
                const SizedBox(height: 70),
                // image
                const ClipOval(
                  child: Image(
                    fit: BoxFit.fill,
                    width: 160,
                    height: 160,
                    image: AssetImage('assets/images/nurse_image.jpg'),
                  ),
                ),
                // space
                const SizedBox(height: 30),
                // TextField to number
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.contains('@') == false) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                ),
                // Space
                const SizedBox(height: 20),
                // TextField to password
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'Please enter valid password';
                    }
                    // return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                  ),
                ),
                // space
                const SizedBox(height: 40),
                // button to (login)
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 20,
                    fixedSize: const Size(250, 40),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // to save email

                      bool result = await fireBaseLogin(
                          emailController.text, passwordController.text);
                      if (result == true) {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('email', emailController.text);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    email: emailController.text,
                                  )),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Login faild"),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Login'),
                ),
                // space
                const SizedBox(height: 40),

                // text in row to forget password
                const Text('Forget Password? No yawa.Tap me'),
                // space
                const SizedBox(height: 50),
                // container to create account
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 212, 209, 209),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 360,
                  height: 40,
                  child: const Center(child: Text('No Account? Sign Up')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> fireBaseLogin(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return false;
  }
}
