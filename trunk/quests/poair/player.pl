sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_CLICKDOOR { 
	my $d_id = ($doorid % 256);
	if($d_id == 1)
	{
		if($client->KeyRingCheck(28638))
		{
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
			quest::setglobal("Xegkey",1,2,"M5");
		}
		elsif(plugin::check_hasitem($client, 28638))
		{
			$client->KeyRingAdd(28638);
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
			quest::setglobal("Xegkey",1,2,"M5");
		}
		elsif(defined $qglobals{Xegkey})
		{
			quest::movepc(215,-599.6,3.5,1447.5);
			$client->Message(15, "You got the door open!");
		}
	}
}
