import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:band_names/providers/add_form_provider.dart';
import 'package:band_names/models/emprendimiento.dart';




class OrderDataTable extends StatefulWidget {
  
  final void Function(int columnIndex, bool ascending) onSort;
  final List<Emprendimiento> emprendimientos;

  const OrderDataTable({
    Key? key, 
    required this.onSort, 
    required this.emprendimientos,
    }) : super(key: key);

  @override
  State<OrderDataTable> createState() => _OrderDataTableState();
}

class _OrderDataTableState extends State<OrderDataTable> {
  final bool _sortAscending = true;
  final int _sortColumnIndex = 0;

  @override
  Widget build(BuildContext context) {
    final addFormProvider = Provider.of<AddFormProvider>(context);
    final socketService = Provider.of<SocketService>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: [
            DataColumn(
              label: const Text('ID'),
              // onSort: _onDataColumnSort,
            ),
            const DataColumn(
              label: Text('EMPRENDEDOR'),
            ),
            DataColumn(
              label: Text('EMPRENDIMIENTO'),
              numeric: true,
              // onSort: _onDataColumnSort,
            ),
            DataColumn(
              label: Container(),
              ),
          ], 
          rows: widget.emprendimientos.map(
            (emprendimiento) {
            return DataRow(
              cells: 
            [
              DataCell(
                Text(emprendimiento.id.toString()),
              ),
              DataCell(
                Text(emprendimiento.emprendedor),
                onTap: () {
                }
              ),
              DataCell(
                Text(emprendimiento.emprendimiento),
              ),
              DataCell(
                const Icon(Icons.delete),
                onTap: () {
                  addFormProvider.removerEmprendimiento(emprendimiento.id);
                  socketService.socket.emit('delete-emprendimiento', { 'id' : emprendimiento.id});
                },
              ),
            ]);
          }).toList(),
          ),
      ),
    );
  }
}