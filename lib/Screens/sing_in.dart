import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/Screens/sing_up.dart';
import 'package:untitled2/cubits/sing_in_up_cubti.dart';
import 'package:untitled2/cubits/sing_in_up_state.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<AuthCubit>().signInUser(
                      _emailController.text,
                      _passwordController.text,
                    );
              },
              child: Text('Sign In'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ));
              },
              child: Text('Don\'t have an account? Sign Up'),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return CircularProgressIndicator();
                } else if (state is AuthError) {
                  return Text(state.message);
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
