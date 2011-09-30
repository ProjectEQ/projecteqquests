sub EVENT_COMBAT {
 if($combat_state == 1){
 quest::say("Prepare to greet your ancestors filth!");
 }
 if($combat_state == 0) {
 quest::say("Leave this corpse to scavengers. This scum deserves no burial.");
 }
}


sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Well met wanderer. Pay heed to the road you chose to travel on, for there are many [hazards] you may come across no matter which direction you chose.");
  }
  if($text=~/hazards/i){
    #Quest: Insect Carapace Shield (Start)
    quest::say("The western road passes through a dangerous part of the thickets. A rivalry between the strange Tegi clans is afoot. Pay close attention, for the darker ones seem much more hostile than the ones that came before them. The Northern road passes through to the [Paludal] caverns. Once it was a rather safe trade route to the city of Shadow Haven. It has since fallen to regular brigand attacks.. We still get traders coming to sell their wares, but the journey is far more treacherous these days.");
  }
  if($text=~/paludal/i){
    #Quest: Insect Carapace Shield 
    quest::say("What is Paludal? The Paludal caverns mark the trade route to Shadowhaven. A series of tunnels that burrow into the very heart of Luclin. I would be very careful of the creatures that burrow through these caverns. They are very dangerous and will show no mercy on young adventurers. If you come across these creatures bring me four different carapaces shells and I will reward you with a shield made from them.");
  }
}

sub EVENT_ITEM {
  #Handin: Mud Burrower Carapace, Muck Digger Carapace, Grime Tunneler Carapace, Sediment Delver Carapace
  if(plugin::check_handin(\%itemcount, 10644 => 1, 10645 => 1, 10646 => 1, 10647 => 1)){
    #Quest: Insect Carapace Shield (End)
    #Paludal Carapace Shield
    quest::summonitem(85054);
    quest::faction(132,5); # +Guardians of Shar Vahl
    quest::exp(250);
    quest::ding();
    } else {
      quest::say("I don't need these items, $name. You can have them back.");
      plugin::return_items(\%itemcount);
     }
}


#END of FILE Zone:shadeweaver  ID:165175 -- Sentry_Kedra_Kai 

