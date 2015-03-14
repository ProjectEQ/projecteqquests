sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Furrier Royale. Here you will find the finest skins from a variety of Norraths lesser creatures."); }
}

sub EVENT_ITEM { 
if (plugin::check_handin(\%itemcount, 16170 => 2)) {
   quest::emote("Medron Y`Lask stretches and fastened the basilisk skins across the shield frame and attaches a leather strap and grip to the back of the shield. Here is your new shield young Shadowknight. I have been paid in advance by the Lodge of the Dead for the shields assembly. May Innoruuk strengthen you in your service to Her Majesty Queen Cristanos.");
  quest::summonitem(19610);
  quest::exp(1000);
  quest::faction(69,10);
  quest::faction(87,10);
  quest::faction(88,10);
}
 }
#END of FILE Zone:neriakc  ID:42060 -- Medron_Y`Lask 

