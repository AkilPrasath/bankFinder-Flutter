import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

class Bankrecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get branch => text()();
  TextColumn get code => text()();
  TextColumn get address => text()();
  TextColumn get city => text()();
  TextColumn get district => text()();
  TextColumn get state => text()();
  TextColumn get ifsc => text().customConstraint("NOT NULL UNIQUE")();
  TextColumn get contact => text().nullable()();
  TextColumn get stdCode => text()();
  BoolColumn get neft => boolean()();
  BoolColumn get upi => boolean()();
  BoolColumn get rtgs => boolean()();
  BoolColumn get imps => boolean()();

  // @override
  // Set<Column> get primaryKey => {ifsc};

  // @override
  // // TODO: implement customConstraints
  // List<String> get customConstraints => ['PRIMARY KEY (ifsc)'];
}

@UseMoor(tables: [Bankrecords])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Stream<List<Bankrecord>> getBanks() => select(bankrecords).watch();
  Future deleteBank(bankrecord) => delete(bankrecords).delete(bankrecord);
  Future insertBank(bankrecord) => into(bankrecords).insert(bankrecord);
}
