sub EVENT_ENTERZONE {
  quest::settimer("spires",10);
  $qglobals{nexus_tox} = undef;
  $qglobals{spire_tox} = undef;
  $qglobals{message_tox} = undef;
}

sub EVENT_TIMER {
  if (defined $qglobals{nexus_tox} && defined $qglobals{spire_tox} && $qglobals{spire_tox} == 1 && plugin::check_hasitem($client, 19720)) {
    quest::selfcast(2433); #self only to avoid AE
    quest::setglobal("spire_tox",0,1,"F");
    quest::delglobal("message_tox");
    $client->NukeItem(19720); #removes stone from inventory.
    $qglobals{nexus_tox} = undef;
    $qglobals{spire_tox} = undef;
    $qglobals{message_tox} = undef;
  }
  elsif (defined $qglobals{nexus_tox} && defined $qglobals{spire_tox} && $qglobals{spire_tox} == 1 && !defined $qglobals{message_tox} && !plugin::check_hasitem($client, 19720)) {
    $client->Message(15,"You don't have the correct component to travel to Luclin.");
    quest::setglobal("message_tox",1,1,"M20"); #prevent component message from being spammed.
    $qglobals{nexus_tox} = undef;
    $qglobals{spire_tox} = undef;
    $qglobals{message_tox} = undef;
  }
  elsif (defined $qglobals{nexus_tox} && defined $qglobals{spire_tox} && $qglobals{spire_tox} == 1 && defined $qglobals{message_tox} && !plugin::check_hasitem($client, 19720)) {
    $qglobals{nexus_tox} = undef;
    $qglobals{spire_tox} = undef;
    $qglobals{message_tox} = undef;
  }
}

sub EVENT_SIGNAL {
  if($signal == 666) {
    quest::updatetaskactivity(218,1,1);
  }
  if($signal == 667) {
    quest::failtask(218);
    $client->NukeItem(80038);
  }
}