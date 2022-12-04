import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/resultado_pesquisa.dart';
import 'package:toggle_switch/toggle_switch.dart';

class principalPesquisa extends StatefulWidget {
  @override
  _principalPesquisaState createState() => _principalPesquisaState();
}

class _principalPesquisaState extends State<principalPesquisa> {
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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Pesquisar Receita',
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
                height: 50,
              ),
              Center(
                child: ToggleSwitch(
                  minWidth: 250,
                  minHeight: 40.0,
                  fontSize: 16.0,
                  initialLabelIndex: 0,
                  activeBgColor: [Colors.green.shade100],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey.shade200,
                  inactiveFgColor: Colors.grey[900],
                  totalSwitches: 2,
                  labels: ['Contém', 'Exata'],
                  onToggle: (index) {
                    if (index == 1) {
                      valor = false;
                    } else {
                      valor = true;
                    }
                    ;
                  },
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
                              content: const Text('Sua busca não é valida!'),
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
                                content: const Text('Sua busca não é valida!'),
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
                      child: Text('Pesquisar Receitas'),
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
