import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Tarefas'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(children: [
              TextField(
                controller: _textEditingController,
              ),
              Container(
                height: 400,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: tarefas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          tarefas.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  if (_textEditingController.text.length > 0) {
                    setState(() {
                      tarefas.add(_textEditingController.text);
                    });
                    _textEditingController.clear();
                  }
                  print(tarefas);
                },
                child: Icon(Icons.add),
                
              ),
              const SizedBox(width: 10),
              FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  setState(() {
                    tarefas = [];
                  });
                  _textEditingController.clear();
                },
                child: Icon(Icons.remove),
              ),
            ],
          ),
        );
  }
}
