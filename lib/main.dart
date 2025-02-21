import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:employee_client_management/authentication/mobile%20verify/biometric_authentications/biometric/biometric_auth.dart';
import 'package:employee_client_management/authentication/mobile%20verify/screen/login_screen.dart';
import 'package:employee_client_management/authentication/mobile%20verify/services/services_aws.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

// Razorpay configuration
const String RAZORPAY_KEY = 'rzp_test_JDsXimAMENWZ4Y';
const String RAZORPAY_SECRET = 'Hlrb9YJhhmvHF6TRDH3qy4Df';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthService authService = AuthService();
  bool isLoggedIn = await authService.isTokenValid();

  // Configure both Amplify and Razorpay
  await Future.wait([
    configureAmplify(),
    initializeRazorpay(),
  ]);

  runApp(MaterialApp(home: isLoggedIn ? BiometricAuthScreen() : LoginScreen()));
}

Future<void> configureAmplify() async {
  try {
    // Initialize Amplify plugins
    final dataStorePlugin = AmplifyDataStore(
      modelProvider: ModelProvider.instance,
    );
    await Amplify.addPlugins([
      AmplifyAPI(),
      AmplifyStorageS3(),
    ]);

    final apiPlugin = AmplifyAPI();

    await Future.wait([
      Amplify.addPlugin(dataStorePlugin),
      Amplify.addPlugin(apiPlugin),
    ]);

    await Amplify.addPlugin(AmplifyStorageS3());
    await Amplify.configure(amplifyconfig);
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyconfig);
    final auth = AmplifyAuthCognito();
    print('Amplify configured successfully');
  } catch (e) {
    print('Error configuring Amplify: $e');
  }
}

Future<void> initializeRazorpay() async {
  try {
    print('Razorpay initialized successfully');
  } catch (e) {
    print('Error initializing Razorpay: $e');
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Subscription App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: EmployeeListScreen()

        // routes: {
        //   '/subscription': (context) => SubscriptionScreen(),
        //   // Add other routes as needed
        // },
        );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
