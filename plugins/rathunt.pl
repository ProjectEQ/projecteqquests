#!/usr/bin/perl
use DBI;

sub GetRatLocation
{
	
	$dbh = plugin::LoadMysql();
	
	my $currentrat = $_[0];
	my $query = $dbh->prepare( "SELECT value from quest_globals where name = '$currentrat'");
	$query->execute( );
	my $currentlocation = 0;
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$currentlocation = $row2[0];
	}

	return $currentlocation;
}


sub GetRandomFreeLocation 
{
	
	my $restrict = $_[0];
	my $maxvalue = $_[1];

	if($restrict == 0){
		$all_values = "(0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40)";
	}

	if($restrict == 1){
		$all_values = "(0),(3),(4),(6),(7),(8),(9),(10),(12),(13),(16),(17),(20),(21),(22),(23),(24),(25),(27),(29),(30),(31),(32),(33),(34),(36),(37),(38),(40)";
	}
		
	$dbh = plugin::LoadMysql();

	my $data1 = "REPLACE into temp_globals VALUES $all_values";
	my $sth1 = $dbh->prepare($data1);
	$sth1->execute();
	
	my $data2 = "DELETE from temp_globals where value in (SELECT value from quest_globals where name like 'halloween_ratter_%') or value in (SELECT value from quest_globals where name like 'halloween_lock_%') or value > $maxvalue";
	my $sth2 = $dbh->prepare($data2);
	$sth2->execute();

	my $data3 = "SELECT * from temp_globals order by CAST(`value` AS SIGNED)";
	my $sth3 = $dbh->prepare($data3);
	$sth3->execute();

	if ($sth3->rows() > 0) {
		while($value = $sth3->fetchrow_array) {
       			push @free_values, $value;
   		}
	}

	my $data4 = "DELETE from temp_globals";
	my $sth4 = $dbh->prepare($data4);
	$sth4->execute();

	$sth1->finish();
	$sth2->finish();
	$sth3->finish();
	$sth4->finish();
	$dbh->disconnect();
	
	# choose random number from @free_values
	my $random_value = $free_values[rand @free_values];
	
	return $random_value;
}

sub GetRandomIndoorLocation 
{
	
	my $restrict = $_[0];
	my $maxvalue = $_[1];

	$all_values = "(0),(3),(4),(6),(7),(8),(9),(10),(12),(13),(16),(17),(20),(21),(22),(23),(24),(25),(27),(29),(30),(31),(32),(33),(34),(36),(37),(38),(40)";

		
	$dbh = plugin::LoadMysql();

	my $data1 = "REPLACE into temp_globals_indoor VALUES $all_values";
	my $sth1 = $dbh->prepare($data1);
	$sth1->execute();
	
	my $data2 = "DELETE from temp_globals_indoor where value in (SELECT value from quest_globals where name like 'halloween_ratter_%') or value in (SELECT value from quest_globals where name like 'halloween_lock_%') or value > $maxvalue";
	my $sth2 = $dbh->prepare($data2);
	$sth2->execute();

	my $data3 = "SELECT * from temp_globals_indoor order by CAST(`value` AS SIGNED)";
	my $sth3 = $dbh->prepare($data3);
	$sth3->execute();
	
	if ($sth3->rows() > 0) {
		while(($value) = $sth3->fetchrow_array) {
       			push @free_values, $value;
   		}
	}

	my $data4 = "DELETE from temp_globals_indoor";
	my $sth4 = $dbh->prepare($data4);
	$sth4->execute();

	$sth1->finish();
	$sth2->finish();
	$sth3->finish();
	$sth4->finish();
	$dbh->disconnect();
	
	# choose random number from @free_values
	my $random_value = $free_values[rand @free_values];
	
	return $random_value;
}

sub GetItemName
{
	
	$dbh = plugin::LoadMysql();
	
	my $itemid = $_[0];
	my $query = $dbh->prepare( "SELECT name from items where id = $itemid");

	$query->execute( );
	my $itemname = '';
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$itemname = $row2[0];
	}

	return $itemname;
}

sub GetRandomApperance
{
	
	$dbh = plugin::LoadMysql();
	
	my $currentzone = $_[0];
	my $query = $dbh->prepare( "SELECT npc_types.race FROM (spawnentry INNER JOIN spawn2 ON spawn2.spawngroupID = spawnentry.spawngroupID) INNER JOIN npc_types ON npc_types.id = spawnentry.npcID WHERE spawn2.zone = '$currentzone' AND npc_types.bodytype NOT IN (11, 33, 66, 67) AND npc_types.race NOT IN (0,1,2,3,4,5,6,7,8,9,10,11,12,36,44,55,67,71,72,73,77,78,81,90,92,93,94,106,112,114,127,128,130,139,141,183,236,237,238,239,254,266,330,378,379,380,381,382,383,404,415,522) ORDER BY RAND() LIMIT 1");

	$query->execute( );
	my $newrace = 0;
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$newrace = $row2[0];
	}

	if($newrace eq ''){
		$newrace = 75;
	}

	return $newrace;
}

sub FindBestGender
{
	$dbh = plugin::LoadMysql();
	
	my $currentrace = $_[0];
	my $query = $dbh->prepare( "SELECT gender from npc_types where race = $currentrace ORDER BY RAND() LIMIT 1");

	$query->execute( );
	my $newgender= 0;
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$newgender = $row2[0];
	}

	return $newgender;
}

sub FindBestSize
{
	$dbh = plugin::LoadMysql();
	
	my $currentrace = $_[0];
	my $query = $dbh->prepare( "SELECT avg(size) from npc_types where race = $currentrace ORDER BY RAND() LIMIT 1");

	$query->execute( );
	my $newsize= 0;
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$newsize = $row2[0];
	}

	return $newsize;
}

sub GetCurrentTrigger
{
	$dbh = plugin::LoadMysql();
	
	my $currentzone = $_[0];
	my $query = $dbh->prepare( "SELECT npc_types.id FROM (spawnentry INNER JOIN spawn2 ON spawn2.spawngroupID = spawnentry.spawngroupID) INNER JOIN npc_types ON npc_types.id = spawnentry.npcID WHERE spawn2.zone = '$currentzone' AND npc_types.id > 998999 and npc_types.id < 999999 ORDER BY RAND() LIMIT 1");

	$query->execute( );
	my $npcid= 0;
	while ( my @row2 = $query->fetchrow_array( ) )  {
		$npcid = $row2[0];
	}

	return $npcid;
}

sub Get_rat_x_loc
{	
	my $location = $_[0];
	@all_locs = (-6227,616,-8,2766,512,-813,-995,-942,219,-247,302,679,120,1131,1699,-400,820,1272,-317,445,3667,-557,1792,383,-220,-1330,102,333,422,-1205,-1379,-1394,265,-492,2126,-623,-3,-804,-533,-279,-1682);
	my $x_loc = $all_locs[$location];

	return $x_loc;
}

sub Get_rat_y_loc
{	
	my $location = $_[0];
	@all_locs = (2739,1623,468,-6432,-1643,-439,43,-1223,407,1852,72,-697,272,1130,-372,-1371,1427,-147,-85,-119,-2277,576,282,987,-150,1134,-47,1351,1023,-534,1121,15,399,-391,1012,441,874,-585,344,-164,-447);
	my $y_loc = $all_locs[$location];

	return $y_loc;
}

sub Get_rat_z_loc
{	
	my $location = $_[0];
	@all_locs = (-56.6,-52,-3.8,-191,92,69.3,-536.2,18.2,-7.4,-452.8,706.5,2.2,-1.1,-206.4,-161.8,-1.9,-45.6,-427.9,3.1,23.1,7.2,3.1,206.6,-169,-123.1,18.9,-4.9,-142.4,-607.8,-27.5,122.6,-16.2,-193.2,1.2,419.9,1.7,6.9,6.2,2.2,-555.6,93.2);
	my $z_loc = $all_locs[$location];
	
	return $z_loc;
}

sub Get_rat_heading
{	
	my $location = $_[0];
	@all_locs = (220,230,130,180,180,17,12,180,150,190,70,190,190,255,70,65,65,200,65,182,180,130,190,165,255,10,10,50,0,160,104,60,30,20,125,60,240,130,120,90,70);
	my $heading = $all_locs[$location];
	
	return $heading;
}

sub Get_rat_zonesn
{	
	my $location = $_[0];
	@all_locs = ("everfrost","poinnovation","abysmal","greatdivide","dawnshroud","crescent","overthere","gunthak","arena","postorms","natimbi","sleeper","umbral","burningwood","nadox","soldungb","podisease","yxtta","thurgadina","netherbian","fieldofbone","dulak","kithicor","pofire","barindu","growthplane","ssratemple","firiona","hatesfury","jaggedpine","ponightmare","qinimi","wakening","katta","dreadlands","torgiran","nektulos","potimea","riwwi","crystal","mischiefplane");
	my $zonesn = $all_locs[$location];
	
	return $zonesn;
}

sub Get_Zone_Trigger
{
	my $location = $_[0];
	@all_locs = (999100,999101,999102,999103,999104,999105,999106,999107,999108,999109,999110,999111,999112,999113,999114,999115,999116,999117,999118,999119,999120,999121,999122,999123,999124,999125,999126,999127,999128,999129,999130,999131,999132,999133,999134,999135,999136,999137,999138,999139,999140);
	my $trigger = $all_locs[$location];
	
	return $trigger;
}

sub Get_Location_By_Zone
{
	my $zone = $_[0];
	my $location = 0;
	
	if($zone eq "everfrost"){$location = 0;}
	if($zone eq "poinnovation"){$location = 1;}
	if($zone eq "abysmal"){$location = 2;}
	if($zone eq "greatdivide"){$location = 3;}
	if($zone eq "dawnshroud"){$location = 4;}
	if($zone eq "crescent"){$location = 5;}
	if($zone eq "overthere"){$location = 6;}
	if($zone eq "gunthak"){$location = 7;}
	if($zone eq "arena"){$location = 8;}
	if($zone eq "postorms"){$location = 9;}
	if($zone eq "natimbi"){$location = 10;}
	if($zone eq "sleeper"){$location = 11;}
	if($zone eq "umbral"){$location = 12;}
	if($zone eq "burningwood"){$location = 13;}
	if($zone eq "nadox"){$location = 14;}
	if($zone eq "soldungb"){$location = 15;}
	if($zone eq "podisease"){$location = 16;}
	if($zone eq "yxtta"){$location = 17;}
	if($zone eq "thurgadina"){$location = 18;}
	if($zone eq "netherbian"){$location = 19;}
	if($zone eq "fieldofbone"){$location = 20;}
	if($zone eq "dulak"){$location = 21;}
	if($zone eq "kithicor"){$location = 22;}
	if($zone eq "pofire"){$location = 23;}
	if($zone eq "barindu"){$location = 24;}
	if($zone eq "growthplane"){$location = 25;}
	if($zone eq "ssratemple"){$location = 26;}
	if($zone eq "firiona"){$location = 27;}
	if($zone eq "hatesfury"){$location = 28;}
	if($zone eq "jaggedpine"){$location = 29;}
	if($zone eq "ponightmare"){$location = 30;}
	if($zone eq "qinimi"){$location = 31;}
	if($zone eq "wakening"){$location = 32;}
	if($zone eq "katta"){$location = 33;}
	if($zone eq "dreadlands"){$location = 34;}
	if($zone eq "torgiran"){$location = 35;}
	if($zone eq "nektulos"){$location = 36;}
	if($zone eq "potimea"){$location = 37;}
	if($zone eq "riwwi"){$location = 38;}
	if($zone eq "crystal"){$location = 39;}
	if($zone eq "mischiefplane"){$location = 40;}

	return $location;
}
	

return 1;
