class TodoListTable {
  TodoListTable._();

  static const String tableName = "todo_list";
  static const String idColumn = "id";
  static const String checkedColumn = "checked";
  static const String titleColumn = "title";

  static const String tableCreation = "CREATE TABLE IF NOT EXISTS $tableName ("
      "$idColumn TEXT PRIMARY KEY, $checkedColumn TEXT, $titleColumn INTEGER"
      ")";
}
