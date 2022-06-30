import 'dart:io';

import 'package:band_names/pages/add_page.dart';
import 'package:band_names/providers/add_form_provider.dart';
import 'package:band_names/widgets/order_data_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:band_names/models/emprendimiento.dart';
import 'package:band_names/services/socket_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    final socketService =Provider.of<SocketService>(context, listen: false); //Listen en false porque no quiero redibujar nada
    
    // socketService.socket.on('active-bands', _handleActiveBands);
    super.initState();
  }

  // _handleActiveBands(dynamic payload) {
  //   this.bands = (payload as List)
  //   .map((band) => Band
  //   .fromMap(band)).toList();
  
  //   setState(() {});
  // }

  @override
  void dispose() {
    final socketService =Provider.of<SocketService>(context, listen: false); //Listen en false porque no quiero redibujar nada
    // socketService.socket.off('active-bands');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final socketService =Provider.of<SocketService>(context); 
     final addFormProvider = Provider.of<AddFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emprendimientos', style: TextStyle(color:Colors.black87)),
        backgroundColor: Colors.white, 
        elevation: 1,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: 
            (socketService.serverStatus == ServerStatus.Online)  
            ? (Icon(Icons.check_circle, color:Colors.blue[300]))
            : (const Icon(Icons.offline_bolt, color:Colors.red)),
          )
        ],
        ),
        body: Column(
          children: [
            // _showGrapg(),
            OrderDataTable(
            emprendimientos: addFormProvider.emprendimientos,
            onSort: (columnIndex, ascending) {
      
            }, 
          ),
          ]
        ),
          floatingActionButton: FloatingActionButton(
            elevation: 1,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddPage()),
              );
            },
            child: const Icon(Icons.add),
          ),
    );
  }

  // Widget _bandTile(Emprendimiento emprendimiento) {
  //   final socketService =Provider.of<SocketService>(context, listen: false); 

  //   return Dismissible(
  //     key: Key(emprendimiento.id.toString()),
  //     direction: DismissDirection.startToEnd,
  //     onDismissed: ( _ ) => socketService.socket.emit('delete-band', { 'id' : emprendimiento.id}),
  //     background: Container(
  //       padding: const EdgeInsets.only(left: 8),
  //       color: Colors.red,
  //       child: const Align(
  //         alignment: Alignment.centerLeft,
  //         child: Text('Delete Band', style: TextStyle(color: Colors.white)),
  //         ),
  //     ),
  //     child: ListTile(
  //       leading: CircleAvatar(
  //         backgroundColor: Colors.blue[100],
  //         child: Text(band.name!.substring(0,2),),
  //       ),
  //       title: Text(band.name!),
  //       trailing: Text('${band.votes}', style: const TextStyle(fontSize:20)),
  //       onTap: () => socketService.socket.emit('vote-band', { 'id' : band.id}),
  //     ),
  //   );
  // }

  addNuevoEmprendimiento() {

    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      return showDialog(
        context: context, 
        builder: ( _ ) {
          return AlertDialog(
            title: const Text('New band name'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                textColor: Colors.blue,
                onPressed: () => addBandToList(textController.text),
                child: const Text('Add'),
              )
            ],
          );
        });
    }
    showCupertinoDialog(
      context: context, 
      builder: ( _ ) {
        return CupertinoAlertDialog(
          title: const Text('New band name'),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Add'),
              onPressed: () => addBandToList(textController.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: const Text('Dismiss'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      });
    
  }

  void addBandToList(String name){

    if (name.length > 1) {
      final socketService = Provider.of<SocketService>(context, listen: false);
      socketService.emit('add-band', {'name' : name});
    }

    Navigator.pop(context);
  }
  // //Mostrar grafica
  // Widget _showGrapg() {
  //   Map<String, double> dataMap = {
  //     'Fultter' : 0,
  //   };
  
  // bands.forEach((band) { 
  // dataMap.putIfAbsent(band.name!, () => band.votes!.toDouble());
  // });
  

  // return Container(
  //   padding: const EdgeInsets.only(top: 10),
  //   width: double.infinity,
  //   height: 200,
  //   child: PieChart(
  //     dataMap: dataMap,
  //     chartType: ChartType.ring,));
  // }
}