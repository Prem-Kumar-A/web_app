import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  TextEditingController? passwordController;
  TextEditingController? emailController;
  String? selectedPlant;
  FocusNode passwordFocus = FocusNode();
  FocusNode plantFocus = FocusNode();
  bool showIcon = false;
  bool showList = false;
  TextEditingController? plantSelectController;
  final List<String> plant = [
    'U1 - SEL UNIT 1',
    'U2 - SEL UNIT 2',
    'U3 - SEL UNIT 3',
    'U4 - SEL UNIT 4',
    'U5 - SEL UNIT 5',
    'U6 - SEL UNIT 6',
    'AP - SEL ANNUR PLANT',
    'HS - SEL HOSUR PLANT',
    'NTC - NEWTEC CABLES',
  ];

  @override
  void initState() {
    super.initState();
    passwordFocus.addListener(() {
      setState(() {
        showIcon = passwordFocus.hasFocus;
      });
    });
    plantFocus.addListener(() {
      setState(() {
        showList = plantFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Container(
                constraints: BoxConstraints(maxHeight: 700, maxWidth: 600),

                foregroundDecoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Login to your User ID',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 100,
                          right: 100,
                          bottom: 20,
                        ),
                        child: userNameTextBox(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          right: 100,
                          bottom: 20,
                        ),
                        child: passwordTextBox(),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     left: 100,
                      //     right: 100,
                      //     bottom: 20,
                      //   ),
                      //   child: unitSelection(),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          right: 100,
                          bottom: 20,
                        ),
                        child: plantSelection(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          right: 100,
                          bottom: 20,
                        ),
                        child: AutoCompleteSearch(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: loginButton(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: forgetPassword(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: signUpButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userNameTextBox() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "User Name",
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        hintText: "Enter your User Name",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.person_rounded, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  Widget passwordTextBox() {
    return TextFormField(
      controller: passwordController,
      obscureText: hidePassword,
      focusNode: passwordFocus,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        hintText: "Enter your password",
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.lock_rounded, size: 20),
        suffixIcon: showIcon
            ? IconButton(
                icon: Icon(
                  hidePassword ? Icons.lock_open : Icons.lock_outline,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () {},
      child: Text(
        'Login',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget forgetPassword() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forget Password',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget plantSelection() {
    return TextFormField(
      autofillHints: plant,
      controller: plantSelectController,
      initialValue: selectedPlant,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        labelText: 'Plant',
        prefixIcon: Icon(Icons.factory_rounded, size: 20),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_drop_down),
        ),
      ),
    );
  }

  Widget unitSelection() {
    return DropdownButtonFormField<String>(
      initialValue: selectedPlant,
      menuMaxHeight: 200,
      style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
      borderRadius: BorderRadius.circular(25),
      decoration: InputDecoration(
        labelText: "Unit",
        enabled: true,
        // hint Text: showList? '--Select--':null ,
        prefixIcon: const Icon(Icons.factory),
        suffixIcon: IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {},
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      ),

      items: plant.map((plant) {
        return DropdownMenuItem(
          value: plant,
          child: Text(
            plant,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedPlant = value;
        });
      },

      validator: (value) {
        if (value == null) {
          return "Please select Plant";
        }
        return null;
      },
    );
  }

  Widget AutoCompleteSearch() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return plant.where(
          (item) =>
              item.toLowerCase().contains(textEditingValue.text.toLowerCase()),
        );
      },
    );
  }
}
