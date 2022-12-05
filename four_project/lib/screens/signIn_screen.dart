import 'package:flutter/material.dart';
import 'package:four_project/common/data/repositories/auth_repository_implement.dart';
import 'package:four_project/domain/entity/roleEntity.dart';
import 'package:four_project/screens/admin_screen.dart';
import 'package:four_project/screens/signUp_screen.dart';
import 'package:four_project/screens/user_sceen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  GlobalKey<FormState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 15, 25, 10),
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerLogin,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Логин не должен быть пустым";
                          }
                          if (value.length < 2) {
                            return "Логин должен быть от 2 символов";
                          }
                          if (value.length >= 16) {
                            return "Логин должен быть до 16 символов";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Логин",
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(25, 5, 25, 20),
                      ),
                      TextFormField(
                        controller: controllerPassword,
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return "Пароль не должен быть пустым";
                          }
                          if (value.length < 2) {
                            return "Пароль должен быть от 2 символов";
                          }
                          if (value.length >= 16) {
                            return "Пароль должен быть до 16 символов";
                          }
                          return null;
                        }),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Пароль",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
              child: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!key.currentState!.validate()) return;
                        const snackBar = SnackBar(
                          content: Text('Ошибка'),
                        );
                        var user = AuthRepositoryImplementation().signIn(
                          controllerLogin.text,
                          controllerPassword.text,
                        );
                        user.then((value) {
                          if (value.isRight()) {
                            RoleEnum roleEnum =
                                value.getOrElse(() => RoleEnum.nobody);
                            switch (roleEnum) {
                              case RoleEnum.admin:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminScreen()));
                                break;
                              case RoleEnum.user:
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UserScreen()));
                                break;
                              case RoleEnum.nobody:
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                break;
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                      child: const Text("Войти"),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text("Зарегистрироваться"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
