import 'package:flutter/material.dart';
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
                },
              ),
            ]);
          }).toList(),
          ),
      ),
    );
  }
}