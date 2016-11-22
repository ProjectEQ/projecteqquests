sub EVENT_SIGNAL {
	quest::say("Please bring me a dark beer.  Thank you");
}

sub EVENT_ITEM {
  if ($client->GetGlobal("paladin_epic_reiya") ==1 && plugin::check_handin(\%itemcount, 96937 => 1)) {
    quest::say("Aauuuugh. Ferubi. . .Ferubi is where I was taken. . .' In a bright flash, Reiya has withered away");
    quest::summonitem(69924);
	quest::delglobal("paladin_epic_reiya");	
  }
  plugin::return_items(\%itemcount);
}