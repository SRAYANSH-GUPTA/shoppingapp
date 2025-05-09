// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CartDao? _cartDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cart` (`id` INTEGER NOT NULL, `title` TEXT NOT NULL, `description` TEXT NOT NULL, `category` TEXT NOT NULL, `price` REAL NOT NULL, `discountPercentage` REAL NOT NULL, `rating` REAL NOT NULL, `stock` INTEGER NOT NULL, `tags` TEXT NOT NULL, `brand` TEXT NOT NULL, `sku` TEXT NOT NULL, `weight` INTEGER NOT NULL, `warrantyInformation` TEXT NOT NULL, `shippingInformation` TEXT NOT NULL, `availabilityStatus` TEXT NOT NULL, `reviews` TEXT NOT NULL, `returnPolicy` TEXT NOT NULL, `minimumOrderQuantity` INTEGER NOT NULL, `meta` TEXT NOT NULL, `images` TEXT NOT NULL, `thumbnail` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CartDao get cartDAO {
    return _cartDAOInstance ??= _$CartDao(database, changeListener);
  }
}

class _$CartDao extends CartDao {
  _$CartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _itemsModelInsertionAdapter = InsertionAdapter(
            database,
            'cart',
            (ItemsModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'category': item.category,
                  'price': item.price,
                  'discountPercentage': item.discountPercentage,
                  'rating': item.rating,
                  'stock': item.stock,
                  'tags': _stringListConverter.encode(item.tags),
                  'brand': item.brand,
                  'sku': item.sku,
                  'weight': item.weight,
                  'warrantyInformation': item.warrantyInformation,
                  'shippingInformation': item.shippingInformation,
                  'availabilityStatus': item.availabilityStatus,
                  'reviews': _reviewConverter.encode(item.reviews),
                  'returnPolicy': item.returnPolicy,
                  'minimumOrderQuantity': item.minimumOrderQuantity,
                  'meta': _metaConverter.encode(item.meta),
                  'images': _stringListConverter.encode(item.images),
                  'thumbnail': item.thumbnail
                }),
        _itemsModelDeletionAdapter = DeletionAdapter(
            database,
            'cart',
            ['id'],
            (ItemsModel item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'description': item.description,
                  'category': item.category,
                  'price': item.price,
                  'discountPercentage': item.discountPercentage,
                  'rating': item.rating,
                  'stock': item.stock,
                  'tags': _stringListConverter.encode(item.tags),
                  'brand': item.brand,
                  'sku': item.sku,
                  'weight': item.weight,
                  'warrantyInformation': item.warrantyInformation,
                  'shippingInformation': item.shippingInformation,
                  'availabilityStatus': item.availabilityStatus,
                  'reviews': _reviewConverter.encode(item.reviews),
                  'returnPolicy': item.returnPolicy,
                  'minimumOrderQuantity': item.minimumOrderQuantity,
                  'meta': _metaConverter.encode(item.meta),
                  'images': _stringListConverter.encode(item.images),
                  'thumbnail': item.thumbnail
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ItemsModel> _itemsModelInsertionAdapter;

  final DeletionAdapter<ItemsModel> _itemsModelDeletionAdapter;

  @override
  Future<List<ItemsModel>> getItems() async {
    return _queryAdapter.queryList('SELECT * FROM cart',
        mapper: (Map<String, Object?> row) => ItemsModel(
            id: row['id'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            category: row['category'] as String,
            price: row['price'] as double,
            discountPercentage: row['discountPercentage'] as double,
            rating: row['rating'] as double,
            stock: row['stock'] as int,
            tags: _stringListConverter.decode(row['tags'] as String),
            brand: row['brand'] as String,
            sku: row['sku'] as String,
            weight: row['weight'] as int,
            warrantyInformation: row['warrantyInformation'] as String,
            shippingInformation: row['shippingInformation'] as String,
            availabilityStatus: row['availabilityStatus'] as String,
            reviews: _reviewConverter.decode(row['reviews'] as String),
            returnPolicy: row['returnPolicy'] as String,
            minimumOrderQuantity: row['minimumOrderQuantity'] as int,
            meta: _metaConverter.decode(row['meta'] as String),
            images: _stringListConverter.decode(row['images'] as String),
            thumbnail: row['thumbnail'] as String));
  }

  @override
  Future<void> addItems(ItemsModel item) async {
    await _itemsModelInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteItems(ItemsModel item) async {
    await _itemsModelDeletionAdapter.delete(item);
  }
}

// ignore_for_file: unused_element
final _stringListConverter = StringListConverter();
final _reviewConverter = ReviewConverter();
final _metaConverter = MetaConverter();
