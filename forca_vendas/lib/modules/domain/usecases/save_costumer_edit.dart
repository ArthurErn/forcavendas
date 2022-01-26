import 'package:forca_vendas/modules/external/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class SaveCostumerEdit {
  Future save(
      id,
      cpfCnpj,
      nomeRazao,
      apelidoFantasia,
      rgInsc,
      inscMunicipal,
      fone1,
      fone2,
      fone3,
      cep,
      endereco,
      enderecoNumero,
      complemento,
      bairro,
      email,
      idStatus,
      idClienteTipo,
      idMunicipio) async {
    Database _db = await DatabaseConnection().get();
    var data = await _db.rawUpdate('''
        UPDATE clientes SET cpf_cnpj = '$cpfCnpj', nome_razao = '$nomeRazao',
         apelido_fantasia = '$apelidoFantasia', rg_insc = '$rgInsc',
          insc_municipal = '$inscMunicipal', fone1 = '$fone1', fone2 = '$fone2',
           fone3 = '$fone3', cep = '$cep', endereco = '$endereco',
            endereco_numero = '$enderecoNumero', complemento = '$complemento',
            bairro = '$bairro', email = '$email', id_status = $idStatus, id_cliente_tipo = $idClienteTipo, id_municipio = $idMunicipio, editado = 1 WHERE id = '$id';
        ''');
    return data;
  }
}
