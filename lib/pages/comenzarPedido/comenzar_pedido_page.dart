import 'package:delivery/models/cliente.dart';
import 'package:delivery/pages/comenzarPedido/modals/direcciones_modal.dart';
import 'package:delivery/pages/comenzarPedido/provider/pedido_provider.dart';
import 'package:delivery/widgets/stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../utils/colors/colors.dart';

class PedidoPage extends StatefulWidget {
  const PedidoPage({Key? key}) : super(key: key);

  //todo-> 1º NECESITO EL MODELO DE DATOS PARA CREAR UN OBJETO DE TIPO CLIENTE:


  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {

  //todo-> NECESITO UN FUTURE DE TIPO CLIENTE:
  late Future<Cliente> cliente;
  //todo-> TRAER EL SERVICIO:
  PedidoService pedidoService = PedidoService();
  //todo-> LLAMAR AL ENDPOINT DE LA API DE GET CLIENTE '/cliente/{id}' EN EL 'initState()':
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cliente = pedidoService.getCliente();
  }

  @override
  Widget build(BuildContext context) {
    return StackWidget(
      img: 'assets/images/login-fondo.jpeg',
      altoContenedor: 0.6,
      altoImg: 0.45,
      widgets: [
        const Text('Comienza tu pedido',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        const Text('Selecciona una dirección, el día y la hora de reparto',
          style: TextStyle(
            color: gris,
            fontWeight: FontWeight.w500,
            fontSize: 13.0,
          ),
        ),
        FutureBuilder(
          future: cliente,
          builder: (context, snapshot) {
            //todo-> 1º COMPROBAR SI HAY ERROR:
            if(snapshot.hasError) {
              return Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: Text(snapshot.error.toString()),
              );
            }
            //todo-> 2º SI TODO ESTÁ OK Y YA TENEMOS DATOS:
            else if(snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(height: 30.0),
                  const Text('Dirección de envío',
                    style: TextStyle(
                      color: gris,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  //todo-> 2.1 TEXTO QUE SE PUEDE PRESIONAR Y ABRE UN MODAL QUE MUESTRA LAS DIRECCIONES PARA SELECCIONAR UNA DE ELLAS:
                  GestureDetector(
                    onTap: (){
                      showBarModalBottomSheet(
                        expand: false,  //todo-> expand: false -> PARA QUE SE EXPANDA COMO MÁXIMO HASTA LO QUE OCUPE SU CONTENIDO
                        context: context,
                        builder: (context) => SelecDireccionPage(direcciones: snapshot.data!.direcciones!)
                      );
                    },
                    child: const Text('Seleccionar dirección',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              );
            }
            //todo-> 3º WIDGET QUE APARECE DURANTE LA CARGA:
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
