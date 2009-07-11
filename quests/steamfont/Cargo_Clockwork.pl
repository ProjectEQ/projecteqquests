  my $delivery = 0;
  my $bandit1id = 56178;
  my $bandit2id = 56179;
  my $bandit3id = 56180;

sub EVENT_SPAWN {
  quest::settimer("CargoTimer",5);
}

sub EVENT_SIGNAL {
  quest::emote("Chuga.. Chug..Chug..");
  quest::say("This unit requires maintenance.");
}

sub EVENT_TIMER {
  if(!defined($qglobals{CargoClockwork}) && ($zonehour == 8)) {
    quest::setglobal("CargoClockwork",1,1,"H2");
    quest::start(177); #Path to windmills
  }
  if($x == 700 && $y == -1783 && $delivery == 1) {
    quest::stop();
    $delivery = 0;
  }
  if($x == 550 && $y == -830) {
    quest::say("kachunk .. kachunk..");
    quest::signal(56066,1); #Watchman Grep
  }
  if($x == 90 && $y == -700 && $delivery == 0) {
    $delivery = 1;
    quest::emote("Chuga.. Chug..Chug..");
    quest::emote("The chugging of the Cargo Clockwork comes to a halt.");

    $bandit1 = quest::spawn2($bandit1id,0,0,30,-700,-109,62); #Hector
    $bandit1obj = $entity_list->GetMobID($bandit1);
    $bandit1npc = $bandit1obj->CastToNPC();
    $bandit1npc->AddToHateList($npc,1);

    $bandit2 = quest::spawn2($bandit2id,0,0,95,-732,-108,240); #Renaldo
    $bandit2obj = $entity_list->GetMobID($bandit2);
    $bandit2npc = $bandit2obj->CastToNPC();
    $bandit2npc->AddToHateList($npc,1);

    $bandit3 = quest::spawn2($bandit3id,0,0,53,-615,-107,113); #Jerald
    $bandit3obj = $entity_list->GetMobID($bandit3);
    $bandit3npc = $bandit3obj->CastToNPC();
    $bandit3npc->AddToHateList($npc,1);

    quest::say("This is highway robbery.");
  }
}

sub EVENT_DEATH {
  quest::stoptimer("CargoTimer");
  quest::signal($bandit1id,0); #Hector
  quest::signal($bandit2id,0); #Renaldo
  quest::signal($bandit3id,0); #Jerald
}