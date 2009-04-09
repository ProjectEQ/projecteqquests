sub EVENT_ENTERZONE {
quest::settimer("spires",10);
$nexus_gd = undef;
$spire_gd = undef;
$message_gd = undef;
}

sub EVENT_TIMER {
if ($timer eq "spires" && defined $qglobals{nexus_gd} && defined $qglobals{spire_gd} && $qglobals{spire_gd} == 1 && plugin::check_hasitem($client, 19720)) {
quest::selfcast(2433); #self only to avoid AE
quest::setglobal(spire_gd,0,1,"F");
quest::delglobal(message_gd);
$client->NukeItem(19720); #removes stone from inventory.
$qglobals{nexus_gd} = undef;
$qglobals{spire_gd} = undef;
$qglobals{message_gd} = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_gd} && defined $qglobals{spire_gd} && $qglobals{spire_gd} == 1 && !defined $qglobals{message_gd} && !plugin::check_hasitem($client, 19720)) {
$client->Message(15,"You don't have the correct component to travel to Luclin.");
quest::setglobal(message_gd,1,1,"M20"); #prevent component mssage from being spammed.
$qglobals{nexus_gd} = undef;
$qglobals{spire_gd} = undef;
$qglobals{message_gd} = undef;
}
elsif ($timer eq "spires" && defined $qglobals{nexus_gd} && defined $qglobals{spire_gd} && $qglobals{spire_gd} == 1 && defined $qglobals{message_gd} && !plugin::check_hasitem($client, 19720)) {
$qglobals{nexus_gd} = undef;
$qglobals{spire_gd} = undef;
$qglobals{message_gd} = undef;
}
 }