import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'customs/Textformfieldcustom.dart';
import 'customs/customclassforshared.dart';
 
 
final eyeofpassword = StateProvider<bool>((ref) {
  return true; // initial value of provider
});

class login extends HookConsumerWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool visibile = ref.watch(eyeofpassword); // access datat of provider
    final gmailcontroller = useTextEditingController();
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    User user;

    // final bool visibility = ref.watch(
    //     eyeofpassword); // check value of provider if changed rebuild ifelse continue

    debugPrint('build method');
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                    "https://png.pngtree.com/png-clipart/20230328/original/pngtree-international-women-s-day-8-march-with-frame-of-flower-and-png-image_9006378.png",
                    height: 300,
                    width: 600,
                  ),
                  Textformfieldcustom(
                    controller: gmailcontroller,
                    hintText: "gmail",
                    prefixIcon: const Icon(Icons.email),
                    border: const OutlineInputBorder(),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@") ||
                          value.length < 5) {
                        return "Please enter your gmail";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Textformfieldcustom(
                    controller: phoneController,
                    hintText: "number",
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.phone),
                    border: const OutlineInputBorder(),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.length != 11) {
                        return "cannot be left blank";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      debugPrint('textFormfiled');
                      final visibility = ref.watch(eyeofpassword);
                      return Textformfieldcustom(
                        obscureText:
                            visibility, // get value of provider to determine if displayed on or off
                        controller: passwordController,
                        hintText: "password",
                        suffixIcon: IconButton(
                            onPressed: () {
                              // change value of provider every time i clicked on icon
                              ref
                                  .watch(eyeofpassword.notifier)
                                  .update((state) => !state);
                              // ref.watch(eyeofpassword.notifier).state = !visibility;
                            },
                            icon:
                                visibility // if(visibility == true) {icon(icons.visbility)}else{icons(Icons.visbility_off)}
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                        border: const OutlineInputBorder(),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "your password must be at least 8 individuals";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          user = User(
                            username: gmailcontroller.text,
                            phone: int.parse(phoneController.text),
                            password: passwordController.text,
                          );
                          var shared = await SharedPreferences.getInstance();
                          await shared
                              .setString(
                                "userkey",
                                user.toJason(),
                              )
                              .whenComplete(
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Homescreen();
                                    },
                                  ),
                                ),
                              );
                        }
                      },
                      child: const Text("log in"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
