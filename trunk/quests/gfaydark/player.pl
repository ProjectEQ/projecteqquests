sub EVENT_ENTERZONE {
quest::settimer("spires",10);
$nexus_gf = undef;
$spire_gf = undef;
$message_gf = undef;
  #Adventurer's Stone
  if(($ulevel >= 15) && (!defined($qglobals{Wayfarer})) && ($client->GetStartZone()==$zoneid)) {
    $client->Message(15, "A mysterious voice whispers to you, 'Enyaanuia Windancer in the tavern by Trueshots Bows has just joined the Wayfarers Brotherhood and has some information about them, and how you can start doing odd jobs for them. You looked like the heroic sort, so I wanted to contact you . . . discreetly.'");
  }
  if (defined $qglobals{whimsy}) {
    quest::delglobal("whimsy");
  }
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}

sub EVENT_TIMER {
if ($timer eq "spires" && defined $qglobals{nexus_gf} && defined $qglobals{spire_gf} && $qglobals{spire_gf} == 1 && plugin::check_hasitem($client, 19720)) {
quest::selfcast(2433); #self only to avoid AE
quest::setglobal("spire_gf",0,1,"F");
quest::delglobal("message_gf");
$client->NukeItem(19720); #removes stone from inventory.
$nexus_gf = undef;
$spire_gf = undef;
$message_gf = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_gf} && defined $qglobals{spire_gf} && $qglobals{spire_gf} == 1 && !defined $qglobals{message_gf} && !plugin::check_hasitem($client, 19720)) {
$client->Message(15,"You don't have the correct component to travel to Luclin.");
quest::setglobal("message_gf",1,1,"M20"); #prevent component mssage from being spammed.
$nexus_gf = undef;
$spire_gf = undef;
$message_gf = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_gf} && defined $qglobals{spire_gf} && $qglobals{spire_gf} == 1 && defined $qglobals{message_gf} && !plugin::check_hasitem($client, 19720)) {
$nexus_gf = undef;
$spire_gf = undef;
$message_gf = undef;
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

