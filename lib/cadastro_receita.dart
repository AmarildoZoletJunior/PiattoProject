import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/resultado_pesquisa.dart';
import 'package:piattov2/minhas_receitas.dart';
import 'package:piattov2/Component/ButtonPages.dart';

class cadastroReceita extends StatefulWidget {
  @override
  _cadastroReceitaState createState() => _cadastroReceitaState();
}

class _cadastroReceitaState extends State<cadastroReceita> {
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  bool valor = true;
  var lista;

  List<String> ingredientes = [
    'Achocolatado',
    'Açúcar',
    'Alcachofra',
    'Alecrim',
    'Alface',
    'Alho',
    'Ameixa',
    'Amêndoa',
    'Amendoim',
    'Amido',
    'Arroz',
    'Azeite',
    'Azeitona',
    'Bacon',
    'Banana',
    'Batata',
    'Cacau',
    'Café',
    'Calabresa',
    'Camarão',
    'Canela',
    'Carne bovina',
    'Carne suína',
    'Catupiry',
    'Cebola',
    'Cebolinha',
    'Cerveja',
    'Champignon',
    'Cheddar',
    'Chocolate',
    'Chocolate branco',
    'Cominho',
    'Creamcheese',
    'Creme de leite',
    'Ervilha',
    'Espinafre',
    'Feijão',
    'Frango',
    'Guaraná',
    'Jabuticaba',
    'Laranja',
    'Leite',
    'Leite condensado',
    'Lentilha',
    'Linguiça',
    'Maçã',
    'Macarrão',
    'Maionese',
    'Manga',
    'Manjericão',
    'Manteiga',
    'Mel',
    'Melancia',
    'Menta',
    'Milho',
    'Noz',
    'Orégano',
    'Ovo',
    'Palmito',
    'Pão',
    'Pepino',
    'Pêssego',
    'Pimenta',
    'Pimentão',
    'Presunto',
    'Queijo',
    'Sal',
    'Salsa',
    'Salsicha',
    'Shoyu',
    'Tomate',
    'Tomilho',
    'Trigo',
    'Uva',
    'Vinagre',
  ];
  List<String> tempArray = [];

  @override
  Widget build(BuildContext context) {
    void open(String l, bool f) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => resultadoPesquisa(text: l, decisao: f)));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
        ),
        title: Text(
          'Cadastrar Receita',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(5, 6),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length > 3) {
                          return "Informe o nome da receita!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: "Nome da Receita",
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Ingrediantes",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ingredientes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(
                          () {
                            if (tempArray
                                .contains(ingredientes[index].toString())) {
                              tempArray.remove(ingredientes[index].toString());
                            } else {
                              tempArray.add(ingredientes[index].toString());
                            }
                          },
                        );
                        print('mvalue');
                        print(tempArray.toString());
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(ingredientes[index].toString()),
                          trailing: Container(
                            height: 25,
                            width: 80,
                            decoration: BoxDecoration(
                              color: tempArray
                                      .contains(ingredientes[index].toString())
                                  ? Colors.red
                                  : Colors.green.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                tempArray.contains(
                                        ingredientes[index].toString())
                                    ? 'Remover'
                                    : 'Selecionar',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(5, 6),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length > 3) {
                          return "Informe o rendimento da receita!";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: "Rendimento",
                        hintStyle: TextStyle(fontWeight: FontWeight.normal),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(5, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length > 3) {
                        return "Informe o modo de preparo da receita!";
                      }
                      return null;
                    },
                    maxLines: 15,
                    decoration: InputDecoration(
                      enabled: true,
                      hintText: 'Modo de preparo',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
                  child: Container(
                    height: 50,
                    width: 500,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade200),
                      ),
                      onPressed: () {
                        if (lista == null) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Selecione pelo menos um ingrediente',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              content: const Text(
                                  'Seu registro de receita não é valido!!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          var l = lista.join(",");
                          if (l.toString().length <= 0) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Selecione pelo menos um ingrediente',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                content: const Text(
                                    'Seu registro de receita não é valido!'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      primary: Colors.green.shade200,
                                    ),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            open(l, valor);
                          }
                        }
                      },
                      child: Text('Registrar Receita'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
