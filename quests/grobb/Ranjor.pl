sub EVENT_SAY { 
if($text=~/Hail/i){
   quest::say("Ya wanna be a member a Da Bashers. duz ya?  What making ya tink yooz is good nuff ta be one o' us?  Can ya proves ta me why I shouldn't oughtta just eat yer smelly hide?  I gonna tests ya. ya big. ugly peece o' meet.  Ya [willin ta test] or duz I just eats ya now?"); 
}
if($text=~/test/i){
   quest::say("Stoopid meat.  I gonna eats ya anyways sumday.  Brings me a froglok meat and two dem li'l froglok tadpole fleshes.  Dey berry good."); 
}
}
sub EVENT_ITEM { 
if ($item1=="18790"){ 
   quest::say("Arhh.. Ranjor mighty warrior.. Ranjor teach you warrior.. you fight for Ranjor now.");
quest::summonitem("13528");
quest::exp("100"); 
}
if (plugin::check_handin(\%itemcount, 5014 => 2, $gold >= 2)) {#correct text needed
  quest::say("Raar.. Ranjor give yous a good weapon...");
  quest::summonitem(quest::ChooseRandom(94201, 6022, 6025, 7014, 5026));
}
else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:grobb  ID:40024 -- Ranjor 

