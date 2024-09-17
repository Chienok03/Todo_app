import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookAuth = FacebookAuth.instance;
  //Sign in with email and password
  Future<User?> _signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign up with email and password
  Future<User?> _registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with google
  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Google sign in was canceled by user.");
        return null;
      }
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Facebook
Future<UserCredential?> _signInWithFacebook() async {
  try {
    final LoginResult loginResult = await _facebookAuth.login();

    if (loginResult.status != LoginStatus.success) {
      print("Facebook sign-in failed: ${loginResult.message}");
      return null;
    }

    // Explicitly define AccessToken
    final AccessToken? accessToken = loginResult.accessToken;

    if (accessToken == null) {
      print("Facebook access token is null.");
      return null;
    }

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(accessToken.token);
    return await _auth.signInWithCredential(facebookAuthCredential);
  } catch (e) {
    print("Error signing in with Facebook: ${e.toString()}");
    return null;
  }
}

  //Signout
  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      await _facebookAuth.logOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
