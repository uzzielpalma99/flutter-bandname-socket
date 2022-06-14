import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/services/socket_service.dart';



class StatusPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final socketService =Provider.of<SocketService>(context);
    // socketService.socket.emit(event);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status: ${socketService.serverStatus}'),
          ],
        ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: () {
        //Tarea:
        //emitir: emitir-mensaje
        //{nombre: 'Flutter', mensaje: 'Hola desde Flutter'}
        socketService.emit('emitir-mensaje',
         {'nombre': 'Flutter', 'mensaje': 'Hola desde flutter'});
      },
      child: const Icon(Icons.message),

     ),
   );
  }
}