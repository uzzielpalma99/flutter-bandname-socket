class Emprendimiento{

  String id;
  String emprendedor;
  String actividades;
  String emprendimiento;
  String descripcion;
  String localidad;

  Emprendimiento({
    required this.id, 
    required this.emprendedor, 
    required this.actividades, 
    required this.emprendimiento,
    required this.descripcion, 
    required this.localidad,
    });

  factory Emprendimiento.fromMap(Map<String, dynamic> obj) 
  => Emprendimiento(
    id: obj.containsKey('id') ? obj['id']  : 'no-id',
    emprendedor: obj.containsKey('emprendedor') ? obj['emprendedor'] : 'no-emprendedor',
    actividades: obj.containsKey('actividades') ? obj['actividades'] : 'no-actividades',
    emprendimiento: obj.containsKey('emprendimiento') ? obj['emprendimiento'] : 'no-emprendimiento',
    descripcion: obj.containsKey('descripcion') ? obj['descripcion'] : 'no-descripcion',
    localidad: obj.containsKey('localidad') ? obj['localidad'] : 'no-localidad',
  );

}