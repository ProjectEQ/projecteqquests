sub EVENT_ENTERZONE {
quest::settimer("spires",10);
$qglobals{nexus_dre} = undef;
$qglobals{spire_dre} = undef;
$qglobals{message_dre} = undef;
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
}