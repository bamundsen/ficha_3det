import 'package:sqflite/sqflite.dart' as sql;

class SQLConf {
  static Future<void> criarTabelas(sql.Database database) async {
    await database.execute("""CREATE TABLE fichas(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
      url TEXT, 
      nome TEXT NOT NULL, 
      classe TEXT, 
      forca INTEGER NOT NULL, 
      habilidade INTEGER NOT NULL, 
      resistencia INTEGER NOT NULL, 
      armadura INTEGER NOT NULL, 
      pdf INTEGER NOT NULL, 
      vantagens TEXT, 
      desvantagens TEXT, 
      pericias TEXT, 
      especializacoes TEXT, 
      exp TEXT
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("database_name.db", version: 1,
        onCreate: (sql.Database database, int version) async {
      await criarTabelas(database);
    });
  }

  static Future<int> criarFicha(
      String? url,
      String nome,
      String? classe,
      int forca,
      int habilidade,
      int resistencia,
      int armadura,
      int pdf,
      String? vantagens,
      String? desvantagens,
      String? pericias,
      String? especializacoes,
      String? exp) async {
    final db = await SQLConf.db();
    final ficha = {
      'url': url,
      'nome': nome,
      'classe': classe,
      'forca': forca,
      'habilidade': habilidade,
      'resistencia': resistencia,
      'armadura': armadura,
      'pdf': pdf,
      'vantagens': vantagens,
      'desvantagens': desvantagens,
      'pericias': pericias,
      'especializacoes': especializacoes,
      'exp': exp
    };
    final id = await db.insert('fichas', ficha,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> listarTodos() async {
    final db = await SQLConf.db();
    return db.query('fichas', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> buscarPorId(int id) async {
    final db = await SQLConf.db();
    return db.query('fichas', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> editar(
      int id,
      String? url,
      String nome,
      String? classe,
      int forca,
      int habilidade,
      int resistencia,
      int armadura,
      int pdf,
      String? vantagens,
      String? desvantagens,
      String? pericias,
      String? especializacoes,
      String? exp) async {
    final db = await SQLConf.db();
    final ficha = {
      'url': url,
      'nome': nome,
      'classe': classe,
      'forca': forca,
      'habilidade': habilidade,
      'resistencia': resistencia,
      'armadura': armadura,
      'pdf': pdf,
      'vantagens': vantagens,
      'desvantagens': desvantagens,
      'pericias': pericias,
      'especializacoes': especializacoes,
      'exp': exp
    };
    final result =
        await db.update('fichas', ficha, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> excluirPorId(int id) async {
    final db = await SQLConf.db();
    try {
      await db.delete('fichas', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }
}
