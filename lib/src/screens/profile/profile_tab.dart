import 'package:flutter/material.dart';
import 'package:greengrocer/src/screens/widgets/custom_text_field_widget.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        title: const Text("Perfil do usuário"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          // Email
          CustomTextField(
            readOnly: true,
            inicialValue: app_data.user.email,
            icon: Icons.email,
            label: "Email",
          ),
          // Nome
          CustomTextField(
            readOnly: true,
            inicialValue: app_data.user.name,
            icon: Icons.person,
            label: "Nome",
          ),
          // Celular
          CustomTextField(
            readOnly: true,
            inicialValue: app_data.user.phone,
            icon: Icons.phone,
            label: "Celular",
          ),
          // CPF
          CustomTextField(
            readOnly: true,
            inicialValue: app_data.user.cpf,
            icon: Icons.file_copy,
            label: "CPF",
            isSecret: true,
          ),
          // Botão para atualizar a senha
          SizedBox(
            height: 50.0,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.green,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                updatePassword();
              },
              child: const Text(
                "Atualizar senha",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              // botao de fechar
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Titulo
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Atulização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Senha atual
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock,
                      label: "Senha Atual",
                    ),
                    // Nova senha
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outline,
                      label: "Nova senha",
                    ),
                    // Confirmar nova senha
                    const CustomTextField(
                      isSecret: true,
                      icon: Icons.lock_outlined,
                      label: "Confirmar nova senha",
                    ),
                    // Botão de confirmar
                    SizedBox(
                      height: 45.0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Atualizar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
