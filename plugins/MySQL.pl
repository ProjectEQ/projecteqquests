#::: Akkadius
#::: Description: These plugins are MySQL loaders in use with Perl DBI
#::: For the best speed, manually define your variables instead of opening the XML file for every single connection establishment
#::: 	This means using LoadMysql_Fast and renaming it to LoadMysql and manually installing the credentials, name the other one to LoadMysql_Old otherwise the subroutines will conflict
#::: For plug and play, LoadMysql will load your database credentials from eqemu_config.xml

sub LoadMysql{	
	use DBI;
	use DBD::mysql;
	# CONFIG VARIABLES
	my $confile = "eqemu_config.xml"; #default
	open(F, "<$confile") or die "Unable to open config: $confile\n";
	my $indb = 0;
	while(<F>) {
		s/\r//g;
		if(/<database>/i) { $indb = 1; }
		next unless($indb == 1);
		if(/<\/database>/i) { $indb = 0; last; }
		if(/<host>(.*)<\/host>/i) { $host = $1; } 
		elsif(/<username>(.*)<\/username>/i) { $user = $1; } 
		elsif(/<password>(.*)<\/password>/i) { $pass = $1; } 
		elsif(/<db>(.*)<\/db>/i) { $db = $1; }
	}
	#::: DATA SOURCE NAME
	$dsn = "dbi:mysql:$db:localhost:3306";
	#::: PERL DBI CONNECT
	$connect = DBI->connect($dsn, $user, $pass);
	return $connect;
}

sub LoadMysql_Fast{	
	use DBI;
	use DBD::mysql;
	# CONFIG VARIABLES
	$host = 127.0.0.1;
	$user = "user";
	$pass = "pass";
	$db = "databasename";
	$dsn = "dbi:mysql:$db:localhost:3306";
	return DBI->connect($dsn, $user, $pass);
}