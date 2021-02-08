# items: 57008
sub EVENT_SAY {
 if ($client->GetGlobal("beast_epic") ==5) {
  if ($text=~/survive/i) {
    quest::say("Well, da smarts is big clue, but how dey manage to build such pretty tings is mysery. Me been here many weeks and still [" . quest::saylink("learning") . "].");
  }
  if ($text=~/learning/i) {
    quest::say("Oh dear. Dere bad tings brewin. Me gots now and get prepared to help Muada. I sorta signed dat letter for you. Bye beastlord!");
    quest::summonitem(57008); # Item: Letter from Muada
  }
 }
}

sub EVENT_ITEM {
 if ($client->GetGlobal("beast_epic") ==4) {
  if (plugin::check_handin(\%itemcount, 57008 =>1 )) {
    quest::say("Ah, is letter from Muada! Have back! I gets bugged all da time out here. Me hates it lots. All my try to do study da lizards and how dey [" . quest::saylink("survive") . "] and grow in dis pretty and big place.");
	quest::setglobal("beast_epic", "5", 5, "F");
  }
 }
  plugin::return_items(\%itemcount);
  $qglobals{muadalet}=undef;
}