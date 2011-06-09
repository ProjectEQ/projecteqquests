sub EVENT_ENTERZONE {
quest::settimer("spires",10);
$qglobals{nexus_dre} = undef;
$qglobals{spire_dre} = undef;
$qglobals{message_dre} = undef;
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
if ($timer eq "spires" && defined $qglobals{nexus_dre} && defined $qglobals{spire_dre} && $qglobals{spire_dre} == 1 && plugin::check_hasitem($client, 19720)) {
quest::selfcast(2433); #self only to avoid AE
quest::setglobal(spire_dre,0,1,"F");
quest::delglobal(message_dre);
$client->NukeItem(19720); #removes stone from inventory.
$qglobals{nexus_dre} = undef;
$qglobals{spire_dre} = undef;
$qglobals{message_dre} = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_dre} && defined $qglobals{spire_dre} && $qglobals{spire_dre} == 1 && !defined $qglobals{message_dre} && !plugin::check_hasitem($client, 19720)) {
$client->Message(15,"You don't have the correct component to travel to Luclin.");
quest::setglobal(message_dre,1,1,"M20"); #prevent component mssage from being spammed.
$qglobals{nexus_dre} = undef;
$qglobals{spire_dre} = undef;
$qglobals{message_dre} = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_dre} && defined $qglobals{spire_dre} && $qglobals{spire_dre} == 1 && defined $qglobals{message_dre} && !plugin::check_hasitem($client, 19720)) {
$qglobals{nexus_dre} = undef;
$qglobals{spire_dre} = undef;
$qglobals{message_dre} = undef;
}
if ($timer == 1) {
$whimsy_count++;
}
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