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
    '1 - Sal',
    '2 - Açúcar',
    '3 - Trigo',
    '4 - Macarrão',
    '5 - Arroz',
    '6 - Feijão',
    '7 - Frango',
    '8 - Carne bovina',
    '9 - Carne suína',
    '10 - Cebola',
    '11 - Alho',
    '12 - Pimenta',
    '13 - Pimentão',
    '14 - Salsa',
    '15 - Cebolinha',
    '16 - Chocolate',
    '17 - Chocolate branco',
    '18 - Leite',
    '19 - Creme de leite',
    '20 - Leite condensado',
    '21 - Achocolatado',
    '22 - Manteiga',
    '23 - Tomate',
    '24 - Alface',
    '25 - Queijo',
    '26 - Presunto',
    '27 - Pepino',
    '28 - Milho',
    '29 - Ervilha',
    '30 - Batata',
    '31 - Palmito',
    '32 - Ovo',
    '33 - Camarão',
    '34 - Bacon',
    '35 - Calabresa',
    '36 - Canela',
    '37 - Cominho',
    '38 - Tomilho',
    '39 - Orégano',
    '40 - Manjericão',
    '41 - Alecrim',
    '42 - Azeitona',
    '43 - Shoyu',
    '44 - Creamcheese',
    '45 - Catupiry',
    '46 - Cheddar',
    '47 - Maionese',
    '48 - Pão',
    '49 - Azeite',
    '50 - Vinagre',
    '51 - Maçã',
    '52 - Banana',
    '53 - Laranja',
    '54 - Melancia',
    '55 - Pêssego',
    '56 - Manga',
    '57 - Cacau',
    '58 - Jabuticaba',
    '59 - Uva',
    '60 - Café',
    '61 - Cogumelo',
    '62 - Menta',
    '63 - Cerveja',
    '64 - Mel',
    '65 - Alcachofra',
    '66 - Amêndoa',
    '67 - Noz',
    '68 - Guaraná',
    '69 - Amendoim',
    '70 - Salsicha',
    '71 - Ameixa',
    '72 - Lentilha',
    '73 - Linguiça',
    '74 - Amido',
    '75 - Espinafre',
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
                                  'Selecione pelo menos 1 ingrediente'),
                              content: const Text('Sua busca não é valida'),
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
                                    'Selecione pelo menos 1 ingrediente'),
                                content: const Text('Sua busca não é valida'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
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
