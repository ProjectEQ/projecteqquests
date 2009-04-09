#zone: gunthak NPC:2_an_erudite_spirit (224239)
#Angelox
#note; I did this quest as per the original, "Titanium" version

sub EVENT_ITEM{
  if (plugin::check_handin(\%itemcount,59027 => 1)){
    quest::summonitem(59003);
    quest::summonitem(59028);
    quest::depop();
 }
}