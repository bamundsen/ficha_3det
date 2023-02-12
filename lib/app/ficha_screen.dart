import 'package:ficha_3det/app/db/bd_conf.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FichasTela extends StatefulWidget {
  const FichasTela({super.key});

  @override
  State<FichasTela> createState() => _FichasTelaState();
}

class _FichasTelaState extends State<FichasTela> {
  List<Map<String, dynamic>> _listaTodos = [];

  bool _carregando = true;
  void _atualizarFichas() async {
    final fichas = await SQLConf.listarTodos();
    setState(() {
      _listaTodos = fichas;
      _carregando = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _atualizarFichas();
  }

  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _classeController = TextEditingController();
  final TextEditingController _forcaController = TextEditingController();
  final TextEditingController _habilidadeController = TextEditingController();
  final TextEditingController _resistenciaController = TextEditingController();
  final TextEditingController _armaduraController = TextEditingController();
  final TextEditingController _pdfController = TextEditingController();
  final TextEditingController _vantagensController = TextEditingController();
  final TextEditingController _desvantagensController = TextEditingController();
  final TextEditingController _periciasController = TextEditingController();
  final TextEditingController _especializacoesController =
      TextEditingController();
  final TextEditingController _expController = TextEditingController();

  Future<void> _adicionar() async {
    int forca = 0;
    int habilidade = 0;
    int resistencia = 0;
    int armadura = 0;
    int pdf = 0;
    try {
      forca = int.parse(_forcaController.text);
      habilidade = int.parse(_habilidadeController.text);
      resistencia = int.parse(_resistenciaController.text);
      armadura = int.parse(_armaduraController.text);
      pdf = int.parse(_pdfController.text);
    } catch (e) {}
    await SQLConf.criarFicha(
        _urlController.text,
        _nomeController.text,
        _classeController.text,
        forca,
        habilidade,
        resistencia,
        armadura,
        pdf,
        _vantagensController.text,
        _desvantagensController.text,
        _periciasController.text,
        _especializacoesController.text,
        _expController.text);
    _atualizarFichas();
  }

  Future<void> _editarFicha(int id) async {
    int forca = 0;
    int habilidade = 0;
    int resistencia = 0;
    int armadura = 0;
    int pdf = 0;
    try {
      forca = int.parse(_forcaController.text);
      habilidade = int.parse(_habilidadeController.text);
      resistencia = int.parse(_resistenciaController.text);
      armadura = int.parse(_armaduraController.text);
      pdf = int.parse(_pdfController.text);
    } catch (e) {}
    await SQLConf.editar(
        id,
        _urlController.text,
        _nomeController.text,
        _classeController.text,
        forca,
        habilidade,
        resistencia,
        armadura,
        pdf,
        _vantagensController.text,
        _desvantagensController.text,
        _periciasController.text,
        _especializacoesController.text,
        _expController.text);
    _atualizarFichas();
  }

  void _excluirFicha(int id) async {
    await SQLConf.excluirPorId(id);
    _atualizarFichas();
  }

  void showBottomSheet(int? id) async {
    if (id != null) {
      final fichaSalva =
          _listaTodos.firstWhere((element) => element['id'] == id);
      _urlController.text = fichaSalva['url'];
      _nomeController.text = fichaSalva['nome'];
      _classeController.text = fichaSalva['classe'];
      _forcaController.text = fichaSalva['forca'].toString();
      _habilidadeController.text = fichaSalva['habilidade'].toString();
      _resistenciaController.text = fichaSalva['resistencia'].toString();
      _armaduraController.text = fichaSalva['armadura'].toString();
      _pdfController.text = fichaSalva['pdf'].toString();
      _vantagensController.text = fichaSalva['vantagens'];
      _desvantagensController.text = fichaSalva['desvantagens'];
      _periciasController.text = fichaSalva['pericias'];
      _especializacoesController.text = fichaSalva['especializacoes'];
      _expController.text = fichaSalva['exp'];
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Container(
        color: const Color.fromARGB(255, 227, 230, 248),
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 18,
          right: 18,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Características',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      controller: _nomeController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Nome",
                        hintText: "Nome do personagem",
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: TextField(
                      controller: _classeController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Classe",
                        hintText: "Classe do personagem",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Link da Imagem",
                  hintText: "Link da Imagem",
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Atributos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _forcaController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Força",
                        hintText: "Força",
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _habilidadeController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Habilidade",
                        hintText: "Habilidade",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _resistenciaController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Resistência",
                        hintText: "Resistência",
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _armaduraController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: "Armadura",
                        hintText: "Armadura",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                controller: _pdfController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Poder de Fogo",
                  hintText: "Poder de Fogo",
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Adicionais',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              TextField(
                maxLines: 2,
                controller: _vantagensController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Vantagens",
                  hintText: "Vantagens",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 2,
                controller: _desvantagensController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Desvanragens",
                  hintText: "Desantagens",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 2,
                controller: _periciasController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Perícias",
                  hintText: "Perícias",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                maxLines: 2,
                controller: _especializacoesController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Especializações",
                  hintText: "Especializações",
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _expController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: "Pontos de Experiência",
                  hintText: "Pontos de Experiência",
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 214, 104, 170),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18),
                        child: Text("Sair"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () async {
                        if (_nomeController.text == null ||
                            _nomeController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "Erro: Nome está vazio",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16,
                          );
                        } else if (id == null) {
                          await _adicionar();
                          Navigator.of(context).pop();
                        } else {
                          await _editarFicha(id);
                          Navigator.of(context).pop();
                        }
                        _nomeController.text = "";
                        _urlController.text = "";
                        _classeController.text = "";
                        _forcaController.text = "";
                        _habilidadeController.text = "";
                        _resistenciaController.text = "";
                        _armaduraController.text = "";
                        _pdfController.text = "";
                        _vantagensController.text = "";
                        _desvantagensController.text = "";
                        _periciasController.text = "";
                        _especializacoesController.text = "";
                        _expController.text = "";

                        // Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(18),
                        child: Text("Salvar"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text("Fichas"),
      ),
      body: _carregando
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listaTodos.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: _listaTodos.elementAt(index)['url'] == null ||
                          _listaTodos.elementAt(index)['url'].isEmpty
                      ? const CircleAvatar(
                          child: Icon(Icons.person),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              NetworkImage(_listaTodos.elementAt(index)['url']),
                          // child: Image.network(
                          //   _listaTodos.elementAt(index)['url'],
                          //   fit: BoxFit.scaleDown,
                          // ),
                        ),
                  title: Text(_listaTodos.elementAt(index)['nome']),
                  subtitle: Text(_listaTodos.elementAt(index)['classe']),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            showBottomSheet(_listaTodos.elementAt(index)['id']);
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.green[300],
                        ),
                        IconButton(
                          onPressed: () {
                            _excluirFicha(_listaTodos.elementAt(index)['id']);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red[300],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
