# Plugin file GetSpawn2IDs.pl created 03/28/10 by Qazzaz.   Put in your servers Plugins directory.

# Usage:   plugin::GetNPCsSpawn2GroupIDs(NPC ID,Min X,Max X,Min Y,Max Y,Min Z,Max Z)
#
# Return an array with a list of the spawn2 IDs for a NPC.  Uses quest::say_proximity X, Y and Z like parameters
# Examples:
# my @spawn2IDs = plugin::GetNPCsSpawn2GroupIDs(214000);   Return all spawn2 IDs in the zone for NPC ID 214000
# my @spawn2IDs = plugin::GetNPCsSpawn2GroupIDs(214000,-1000,1000,-500,500);   Return all spawn2 IDs in the zone for NPC ID 214000 in X -1000 to 1000 and Y -500 to 500 area
# my @spawn2IDs = plugin::GetNPCsSpawn2GroupIDs(0,-1000,1000,-500,500,-100,100);   Return all spawn2 IDs for *ALL* NPCs in the zone for the specified X,Y area and now Z of -100 to 100

sub GetNPCsSpawn2GroupIDs
{
use DBI;

my $confile = "eqemu_config.xml"; #default
my $db = "eq";
my $user = "eq";
my $pass = "eq";
my $host = "localhost";

open(F, "<$confile") or die "Unable to open config: $confile\n";
my $indb = 0;

while(<F>) {
   s/\r//g;
   if(/<database>/i) {
      $indb = 1;
   }
   next unless($indb == 1);
   if(/<\/database>/i) {
      $indb = 0;
      last;
   }
   if(/<host>(.*)<\/host>/i) {
      $host = $1;
   } elsif(/<username>(.*)<\/username>/i) {
      $user = $1;
   } elsif(/<password>(.*)<\/password>/i) {
      $pass = $1;
   } elsif(/<db>(.*)<\/db>/i) {
      $db = $1;
   }
}
if(!$db || !$user || !$pass || !$host) {
   die "Invalid database info, missing one of: host, user, password, database\n";
}
my $dbh = DBI->connect("DBI:mysql:database=$db;host=$host", $user, $pass) || die "Could not create db handle\n";

my($spawn2_id, $spawn2, @spawn2_groups_ids, $temp, $spawn2_area, $spawn2_search);
$spawn2_area = plugin::val('$zonesn');
$spawn2_area = " AND zone='$spawn2_area'";

if(defined $_[1]) { # Define the Spawn2 spawn point area search if one is specified.
   $spawn2_area =  $spawn2_area . " AND x>=$_[1] AND x<=$_[2] AND y>=$_[3] AND y<=$_[4]";
   if(defined $$_[5]) {
      $spawn2_area = $spawn2_area . " AND z>=$_[5] AND z<=$_[6]";
      }
   }

if($_[0]) {
my   $spawn_group_ids = $dbh->prepare("SELECT * FROM spawnentry WHERE npcID=$_[0]");
   $spawn_group_ids->execute(); #run the query the db to get list of spawn_group_ids using NPC ID that Spawn2 uses

   while ($temp = $spawn_group_ids->fetch()) { # Use the spawn_group_ids to build and array of the NPCs spawn2 IDs.
      $spawn2_search = "SELECT id FROM spawn2 WHERE id>0 AND spawngroupID=@$temp[0]" . $spawn2_area;
      $spawn2 = $dbh->prepare($spawn2_search);
      $spawn2->execute();
      $spawn2_id = $spawn2->fetch();
      if($spawn2_id) {
         push(@spawn2_groups_ids, @$spawn2_id);
         }
      }
} else {
   $spawn2_search = "SELECT id FROM spawn2 WHERE" . $spawn2_area; # Get all Spawn2 IDs within area from spawn2 table
   $spawn2 = $dbh->prepare($spawn2_search);
   $spawn2->execute();
   while ($spawn2_id = $spawn2->fetch()) {
      push(@spawn2_groups_ids, @$spawn2_id);
      }
   }

return @spawn2_groups_ids;
}


# Usage:   plugin::GetSpawn2GroupsFromArray(Pointer to your array,Min X,Max X,Min Y,Max Y,Min Z,Max Z)
#
# Has the same parameters as GetNPCsSpawn2GroupIDs except you give it a pointer to your array.
# Example:
# In your script you do:
# my @array_of_npcs = (214000,214001,214010,214023);
# then
# my @spawn2IDs = plugin::GetSpawn2GroupsFromArray(\@array_of_npcs,-1000,1000,-500,500);
#
# Which returns an array containing all spawn2 IDs of the NPCs in @array_of_npcs located in the X -1000 to 1000 and Y -500 to 500 area

sub GetSpawn2GroupsFromArray
{
my $array_ptr =  $_[0];
my (@spawn2_array, @temp_array, $npc_id, %seen, $spawn2);

foreach $npc_id (@$array_ptr) {
   @temp_array = GetNPCsSpawn2GroupIDs($npc_id,$_[1],$_[2],$_[3],$_[4],$_[5],$_[6]);
   foreach $spawn2 (@temp_array) {
      push(@spawn2_array, $spawn2) unless $seen{$spawn2}++;
      }
   }
return @spawn2_array;
} 