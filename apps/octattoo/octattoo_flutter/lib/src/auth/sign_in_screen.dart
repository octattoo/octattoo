import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

import '../../main.dart';
import '../profile/profile_switcher.dart';

class SignInScreen extends StatefulWidget {
  final bool showGoogleSignIn;

  const SignInScreen({super.key, this.showGoogleSignIn = true});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  Future<void> _signInWithEmail() async {
    setState(() => _error = null);
    try {
      await client.emailIdp.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      await _loadProfiles();
      if (mounted) context.go('/appointments');
    } catch (e) {
      setState(() => _error = 'Invalid email or password');
    }
  }

  Future<void> _loadProfiles() async {
    final profiles = await client.artistProfile.listMyProfiles();
    profileState.setProfiles(
      profiles
          .map((p) => ProfileEntry(
                id: p.id.toString(),
                name: p.name,
                handle: p.handle,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'octattoo',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                if (widget.showGoogleSignIn) ...[
                  GoogleSignInWidget(
                    client: client,
                    onAuthenticated: () async {
                      await _loadProfiles();
                      if (!mounted) return;
                      // ignore: use_build_context_synchronously
                      context.go('/appointments');
                    },
                    onError: (e) =>
                        setState(() => _error = 'Google sign-in failed'),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                ],
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                ),
                if (_error != null) ...[
                  const SizedBox(height: 8),
                  Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: _signInWithEmail,
                  child: const Text('Sign in'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: const Text('Create account'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
