
# Standalone

<https://hbase.apache.org/2.3/book.html#quickstart_pseudo>

```sh
docker run -p 2181:2181 -p 16000:16000 -p 16010:16010 -p 16020:16020 -p 16030:16030 -d --name hbase ghcr.io/linianhui/hbase:2.3.7
```

```sh
# 建表
create 'account',{NAME=>'p'},{SPLITS=>['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']}

# 查看表信息
describe 'account'

  Table account is ENABLED
  account
  COLUMN FAMILIES DESCRIPTION
  {NAME => 'p', BLOOMFILTER => 'ROW', IN_MEMORY => 'false', VERSIONS => '1', KEEP_DELETED_CELLS => 'FALSE', DATA_BLOCK_ENCODING => 'NONE', COMPRESSION => 'NONE', TTL => 'FOR
  EVER', MIN_VERSIONS => '0', BLOCKCACHE => 'true', BLOCKSIZE => '65536', REPLICATION_SCOPE => '0'}

# 
describe 'hbase:meta'

```

# config

`/hbase/conf/hbase-site.xml`

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
  <!-- https://hbase.apache.org/2.3/book.html#quickstart_pseudo -->
  <property>
    <name>hbase.cluster.distributed</name>
    <value>false</value>
  </property>
  <property>
    <name>hbase.rootdir</name>
    <value>hdfs://localhost:8020/hbase</value>
  </property>
</configuration>
```
