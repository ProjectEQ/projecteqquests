#Sentry_Ferin.pl
#Champion of the Vah Shir
# items: 17891, 30852, 30854

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hail, $name. Pardon, but I've no time for chit chat, the [poachers] never rest.");
  }
  if ($text=~/poachers/i) {
    quest::say("Some of the Loda Kai heathens have seen fit to trade in the pelts of our felidae cousins. It disgusts me to think what they are doing with the hides of the proud cats of this land. Were there only adventurers brave enough to [champion their cause]...");
  }
  if ($text=~/champion their cause/i) {
    quest::say("Fighting for the honor of our cause is no small undertaking. Go and hunt down this cowardly lot. Take back from them what they have stolen and fill this casket so that the fallen cats might be honored properly.");
    quest::summonitem(17891);#Venerated Cask
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30852 => 1)){ #Sealed Cask
    quest::say("You are truly a friend to the Felidae. Take this shroud as a small token of the honor you have done to our people - it is just a small step towards becoming a champion among our people.");
    quest::summonitem(30854); #Hero's Shroud
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadeweaver  ID:165134--Sentry_Ferin.pl