# Rogue Epic NPC -- #Brigadier_G'tav

sub EVENT_ITEM {
  if($itemcount {28057} == 1) {
    quest::say("The General will take care of you!");
    quest::ding();
    quest::exp(500);
    quest::spawn2(20205,0,0,2316,797,275,193.5);
 }
  else {
    quest::emote("will not accept this item.");
    plugin::return_items(\%itemcount);
 }
}

#END of FILE  Quest by: Solid11  Zone:kithicor  ID:20061 -- #General_G'tav

