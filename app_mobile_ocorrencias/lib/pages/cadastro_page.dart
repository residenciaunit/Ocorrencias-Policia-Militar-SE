import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();

  String? tipoRop;
  String? cidade;
  String? bairro;
  String? numAtendimento;
  String? destino;
  String? logradouro;
  String? numero;
  String? pontoReferencia;
  DateTime? data;
  TimeOfDay? hora;

  bool dinheiro = false;
  bool drogas = false;
  bool armas = false;
  bool veiculo = false;
  bool objeto = false;
  bool municao = false;
  bool individuo = false;

  final Map<String, List<String>> bairrosPorCidade = {
    "Aracaju": [
      "Atalaia",
      "Coroa do Meio",
      "Farolândia",
      "Aruana",
      "Jardins",
      "Salgado Filho",
      "São José",
      "Suíssa",
      "Centro",
      "13 de Julho",
      "Getúlio Vargas",
      "Cirurgia",
      "Pereira Lobo",
      "Dezoito do Forte",
      "Novo Paraíso",
      "Luzia",
      "Olaria",
      "Palestina",
      "Bugio",
      "Industrial",
      "Cidade Nova",
      "América",
      "Capucho",
      "Siqueira Campos",
      "São Conrado",
      "Jabotiana",
      "Santa Maria",
      "Aeroporto",
      "Porto Dantas",
      "Grageru",
      "Inácio Barbosa",
      "Marivan",
      "Ponto Novo",
      "Lamarão",
      "José Conrado de Araújo",
    ],
    "Itabaiana": [
      "Anízio Amancio de Oliveira",
      "Área Rural de Itabaiana",
      "Bananeiras",
      "Centro",
      "Doutor José Milton Machado",
      "Mamede Paes Mendonça",
      "Marcela",
      "Marianga",
      "Miguel Teles de Mendonça",
      "Oviedo Teixeira",
      "Porto",
      "Queimadas",
      "Riacho Doce",
      "Rotary Club de Itabaiana",
      "São Cristóvão",
      "Serrano",
    ],
    "Lagarto": ["Centro"],
    "Nossa Senhora do Socorro": [
      "Albano Franco",
      "Boa Viagem",
      "Castelo",
      "Centro Histórico",
      "Fernando Collor",
      "Guajará",
      "Itacanema",
      "Jardim",
      "João Alves",
      "Mangabeira",
      "Marcos Freire I",
      "Marcos Freire II",
      "Marcos Freire III",
      "Novo Horizonte",
      "Pai André",
      "Palestina de Dentro",
      "Palestina de Fora",
      "Parque dos Faróis",
      "Piabeta",
      "Porto Grande",
      "Santa Cecília",
      "Santa Inês",
      "Santo Inácio",
      "São Brás",
      "Sobrado",
      "Taboca",
      "Taiçoca de Dentro",
      "Taiçoca de Fora",
    ],
    "São Cristóvão": ["Centro", "Rosa Elze"],
    "Estância": ["Alagoas", "Centro", "Cidade Nova"],
    "Propriá": ["Centro"],
    "Tobias Barreto": ["Centro"],
    "Itaporanga D'Ajuda": ["Centro"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro ROP"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo_pmse.png", height: 120),
              const SizedBox(height: 16),
              const Text(
                "Cadastro ROP",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "TIPO DO ROP"),
                items: const [
                  DropdownMenuItem(
                    value: "contra_pessoa_vida",
                    child: Text("Contra a pessoa e a vida"),
                  ),
                  DropdownMenuItem(value: "transito", child: Text("Trânsito")),
                  DropdownMenuItem(value: "costumes", child: Text("Costumes")),
                  DropdownMenuItem(
                    value: "auxilio_publico",
                    child: Text("Auxílio ao público"),
                  ),
                  DropdownMenuItem(
                    value: "administracao_publica",
                    child: Text("Administração pública"),
                  ),
                  DropdownMenuItem(
                    value: "entorpecentes",
                    child: Text("Entorpecentes"),
                  ),
                  DropdownMenuItem(value: "presos", child: Text("Presos")),
                ],
                onChanged: (v) => setState(() => tipoRop = v),
                value: tipoRop,
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Cidade"),
                items: bairrosPorCidade.keys
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() {
                  cidade = v;
                  bairro = null;
                }),
                value: cidade,
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Bairro"),
                items: (cidade != null ? bairrosPorCidade[cidade]! : <String>[])
                    .map<DropdownMenuItem<String>>((String b) {
                      return DropdownMenuItem<String>(value: b, child: Text(b));
                    })
                    .toList(),
                onChanged: (v) => setState(() => bairro = v),
                value: bairro,
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Nº de atendimento",
                  hintText: "Ex.: 2024-00123456",
                ),
                onChanged: (v) => numAtendimento = v,
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Destino",
                  hintText: "Ex.: Comando Geral da PM de Sergipe",
                ),
                onChanged: (v) => destino = v,
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Logradouro do fato",
                  hintText: "Ex.: Rua Niceu Dantas",
                ),
                onChanged: (v) => logradouro = v,
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Número",
                  hintText: "Ex.: 100",
                ),
                onChanged: (v) => numero = v,
              ),
              const SizedBox(height: 12),

              // Ponto de referência
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Ponto de referência",
                  hintText: "Ex.: Ao lado do Residencial Costa do Atlântico",
                ),
                onChanged: (v) => pontoReferencia = v,
              ),
              const SizedBox(height: 12),

              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Data",
                  hintText: data == null
                      ? "Selecionar data"
                      : "${data!.day.toString().padLeft(2, '0')}/${data!.month.toString().padLeft(2, '0')}/${data!.year}",
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2035),
                  );
                  if (picked != null) {
                    if (!mounted) return;

                    if (picked.isAfter(DateTime.now())) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("A data não pode ser futura."),
                        ),
                      );
                      return;
                    }
                    setState(() => data = picked);
                  }
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Hora",
                  hintText: hora == null
                      ? "Selecionar hora"
                      : hora!.format(context),
                  suffixIcon: const Icon(Icons.access_time),
                ),
                onTap: () async {
                  FocusScope.of(context).unfocus();
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    if (!mounted) return;

                    if (data != null) {
                      final hoje = DateTime.now();
                      final isToday =
                          data!.day == hoje.day &&
                          data!.month == hoje.month &&
                          data!.year == hoje.year;

                      if (isToday) {
                        final now = TimeOfDay.now();
                        final pickedMinutes = picked.hour * 60 + picked.minute;
                        final nowMinutes = now.hour * 60 + now.minute;

                        if (pickedMinutes > nowMinutes) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Como a ocorrência foi hoje, a hora não pode ser futura.",
                              ),
                            ),
                          );
                          return;
                        }
                      }
                    }
                    setState(() => hora = picked);
                  }
                },
              ),
              const SizedBox(height: 24),

              const Text(
                "Itens apreendidos:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),

              CheckboxListTile(
                title: const Text("Dinheiro"),
                value: dinheiro,
                onChanged: (value) => setState(() => dinheiro = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Drogas"),
                value: drogas,
                onChanged: (value) => setState(() => drogas = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Armas"),
                value: armas,
                onChanged: (value) => setState(() => armas = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Veículo"),
                value: veiculo,
                onChanged: (value) => setState(() => veiculo = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Objeto"),
                value: objeto,
                onChanged: (value) => setState(() => objeto = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Munição"),
                value: municao,
                onChanged: (value) => setState(() => municao = value ?? false),
              ),
              CheckboxListTile(
                title: const Text("Indivíduo"),
                value: individuo,
                onChanged: (value) =>
                    setState(() => individuo = value ?? false),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("ROP cadastrado com sucesso!"),
                        ),
                      );
                    }
                  },
                  child: const Text("Salvar ROP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
