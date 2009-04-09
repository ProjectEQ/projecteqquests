sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Mmmph!!  Who you?  Oh. you $name.  You supposed to be promising Craknek.  Me need you.  There bad things in swamp.  You want [help Crakneks] or you [want Guntrik bash your face]!!?");
}
if($text=~/what help crakneks/i){
quest::say("Crakneks warriors!!  They be far back.  Through last caves.  They smash and bash.  They no like Greenbloods.  Bouncers keep thems from bashing.");
}
if($text=~/i want gruntrik to bash my face/i){
quest::say("OK!! Me bash!!  You hurt!!");
quest::say("Me strongest. You weak. Craknek best alwayss."); }
}
sub EVENT_ITEM { 
 if($itemcount{18787} == 1){
	quest::say("Ahh..  good..  good..  here. take..  now you Craknek! You bash good. Bash lizards. Bash froggies. Bash mushrooms. Remember. you no help Greenbloods. Crakneks stronger than Greenbloods.");
	quest::summonitem("13525");
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:oggok  ID:49043 -- Guntrik 

