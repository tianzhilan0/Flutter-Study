import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LCSqflite extends StatefulWidget {
  LCSqflite({Key key}) : super(key: key);

  @override
  _LCSqfliteState createState() => _LCSqfliteState();
}

class _LCSqfliteState extends State<LCSqflite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite'),
      ),
      body: Column(
        children:[
          RaisedButton(
            child: Text("insert"),
            onPressed: (){
            insert();
          }),
          RaisedButton(
            child: Text("update"),
            onPressed: (){
            update();
          })
        ]
      ),
    );
  }

  insert() async{
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel= UserModel();
    userModel.columnId=1143824942687547394;
    userModel.columnMobile="15801071158";
    userModel.columnHeadImage="http://www.img";
    provider.insert(userModel);
  }

  update() async{
    PersonDbProvider provider = new PersonDbProvider();
    UserModel userModel= await provider.getPersonInfo(1143824942687547394);
    userModel.columnMobile="15801071157";
    userModel.columnHeadImage="http://www.img1";
    provider.update(userModel);
  }


}

class SqlManager{

  static const _VERSION=1;

  static const _NAME="qss.db";

  static Database _database;
  ///初始化
  static init() async {
    var databasesPath=await getDatabasesPath();

    String path = databasesPath+_NAME;

    _database=await openDatabase(path,version: _VERSION,onCreate: (Database db,int version) async{});
  }

    ///判断表是否存在
  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res=await _database.rawQuery("select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res!=null && res.length >0;
  }

  ///获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if(_database == null){
      await init();
    }
    return _database;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }
  
}


abstract class BaseDbProvider {
  bool isTableExits = false;

  createTableString(){

  }

  tableName(){

  }

  ///创建表sql语句
  tableBaseString(String sql) {
    return sql;
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  ///super 函数对父类进行初始化
  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await SqlManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await SqlManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableString());
    }
    return await SqlManager.getCurrentDatabase();
  }

}

class PersonDbProvider extends BaseDbProvider{
  ///表名
  final String name = 'PresonInfo';

  final String columnId="id";
  final String columnMobile="mobile";
  final String columnHeadImage="headImage";


  PersonDbProvider();

  @override
  tableName() {
    return name;
  }

  @override
  createTableString() {
   return '''
        create table $name (
        $columnId integer primary key,$columnHeadImage text not null,
        $columnMobile text not null)
      ''';
  }

  ///查询数据库
  Future _getPersonProvider(Database db, int id) async {
    List<Map<String, dynamic>> maps =
    await db.rawQuery("select * from $name where $columnId = $columnId");
    return maps;
  }

  ///插入到数据库
  Future insert(UserModel model) async {
    Database db = await getDataBase();
    var userProvider = await _getPersonProvider(db, model.columnId);
    if (userProvider != null) {
      ///删除数据
      await db.delete(name, where: "$columnId = ?", whereArgs: [model.columnId]);
    }
    return await db.rawInsert("insert into $name ($columnId,$columnMobile,$columnHeadImage) values (?,?,?)",[model.columnId,model.columnMobile,model.columnHeadImage]);
  }

  ///更新数据库
  Future<void> update(UserModel model) async {
    Database database = await getDataBase();
    await database.rawUpdate(
        "update $name set $columnMobile = ?,$columnHeadImage = ? where $columnId= ?",[model.columnMobile,model.columnHeadImage,model.columnId]);

  }


  ///获取事件数据
  Future<UserModel> getPersonInfo(int id) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> maps  = await _getPersonProvider(db, id);
    if (maps.length > 0) {
      return UserModel.fromJson(maps[0]);
    }
    return null;
  }
}


class UserModel
{
  int columnId;
  String name;
  String columnMobile;
  String columnHeadImage;

  UserModel({this.columnId, this.name, this.columnMobile, this.columnHeadImage});

  factory UserModel.fromJson(Map json){
    return UserModel(
      columnId: json["columnId"],
      name: json["name"],
      columnMobile: json["columnMobile"],
      columnHeadImage: json["columnHeadImage"],
    );
  }
}