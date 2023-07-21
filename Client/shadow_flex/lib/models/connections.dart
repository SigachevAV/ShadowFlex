class Connection {
  String name = '';
  int connection = 0;
  int loyal = 0;
  Connection(this.name, this.connection, this.loyal);
  Map<String, dynamic> toJson() =>
      {'name': name, 'connection': connection, 'loyal': loyal};
  Connection.fromJson(Map<String, dynamic> json)
      : name = (json['name']),
        connection = json['connection'],
        loyal = json['loyal'];
}
