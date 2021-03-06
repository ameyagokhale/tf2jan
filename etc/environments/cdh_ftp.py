baseurl = 'http://node19.morado.com'
gateway_port = '9090'
sshuser = 'dttbc'
sshkey = '/root/.ssh/node30_id_rsa'
sshport = 22
dt_version = '2.1.0-RC2'
anothervar = 'testvar'
anothervar2 = anothervar + ' with additional string'
####Platform specific configurations:
dtserver  = 'node23.morado.com'
dtinstall = '/home/dttbc/datatorrent/current/'
dtbin     = dtinstall + 'bin/'
dtcpsh    = dtbin + 'dtingest'
dtcpjar   = '-j ' + dtinstall + 'apps/' + 'dtingest-1.0.0-RC4.apa'
####Ingestion specific configurations: Utilities
decyptor    = '/home/dttbc/IngestionAppTesting/decryptor-0.0.1-SNAPSHOT-jar-with-dependencies.jar'
decompactor = '/home/dttbc/IngestionAppTesting/ingestion-utils-0.0.1-SNAPSHOT-jar-with-dependencies.jar'
####Ingestion specific configurations: Server setups
#HDFS:
NN     =  'node34.morado.com'
NNPORT =  8020
#NFS:
NFS = 'file:///disk5/dt-nfs-mount/IngestionAppTesting'
#FTP: vsftpd
FTPUSER = 'ftp-dttbc'
FTPPSWD = 'dttbc'
	#FTPSRVR = 'node36.morado.com'
FTPPORT = 21
#Pure-FTP:
FTPSRVR = 'node29.morado.com'
#S3N:
S3NUSER = 'AKIAIUUYNR43F76GOFHA'
S3NPSWD = 'cYKXtma2DLmfb3eQck0gD3ZjJ7ZJt0kYIYs4KoVN'
S3NURL  = 'ingestion-s3n.datatorrent.com'
S3BCKT_S  = 'ingestion-qas-s3n.datatorrent.com'
S3BCKT_D  = 'ingestion-qad-s3n.datatorrent.com'

