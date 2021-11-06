import 'package:almost/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างบัญชีผู้ใช้"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("E-mail", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator: MultiValidator([
                    RequiredValidator(errorText: "กรุณาป้อนอีเมล์ด้วยงับ"),
                    EmailValidator(errorText: "รูปแบบอีเมลล์ไม่ถูกต้อง")
                  ]),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (String? email) {
                    profile.email = email!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Password", style: TextStyle(fontSize: 20)),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: "กรุณากรอกรหัสผ่านด้วยงับ"),
                  obscureText: true,
                  onSaved: (String? password) {
                    profile.password = password!;
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print(
                            "email = ${profile.email} password = ${profile.password}");
                        formKey.currentState!.reset();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
