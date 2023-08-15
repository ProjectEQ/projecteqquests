#::: Akkadius
#::: Description: These plugins are MySQL loaders in use with Perl DBI
#::: For plug and play, LoadMysql will load your database credentials from eqemu_config.json

sub LoadMysql {	
	use DBI;
	use DBD::mysql;
	use JSON;
	
    	my $json = new JSON();

	#::: Load Config
	my $content;
	open(my $fh, '<', "eqemu_config.json") or die "cannot open file $filename"; {
		local $/;
		$content = <$fh>;
	}
	close($fh);

	#::: Decode
	$config = $json->decode($content);

	#::: Set MySQL Connection vars
	$db = $config->{"server"}{"database"}{"db"};
	$host = $config->{"server"}{"database"}{"host"};
	$port = $config->{"server"}{"database"}{"port"};
	$user = $config->{"server"}{"database"}{"username"};
	$pass = $config->{"server"}{"database"}{"password"};

	#::: Map DSN
	$dsn = "dbi:mysql:$db:$host:$port";
	
	#::: Connect and return
	$connect = DBI->connect($dsn, $user, $pass);
	
	return $connect;
}
