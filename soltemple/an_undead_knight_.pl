# Quest for Darkforge Helm/Breastplate/Vambraces/Bracers
# items: 12283, 12284, 13921, 3140, 12285, 12286, 16507, 3141, 12288, 12287, 9023, 3142, 12290, 12289, 19075, 3143

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Leave this place or find yourself [bound to this land] as I am.");
  }
  if($text=~/bound to this land/i){
    quest::say("I was torn to pieces for my failure to complete a task for my master.  I lost my life, my precious [shadowknight armor] and most of all, my [lower body]!!");
  }
  if($text=~/shadowknight armor/i){
    quest::say("My darkforge armor!!  It was taken into the land of lizards by the lizardmen crusaders!!  It is worthless decayed armor now!! I cannot even wear it any more, but perhaps you can!!  Would you like me to make [darkforge armor] for you?");
  }
  if($text=~/lower body/i){
    quest::say("My lower body was taken from me, along with my hands.  I was pieced together using portions of other failed champions.  Now I can only create [darkforge armor] in the form of helms, breastplates, vambraces and bracers.");
  }
  if($text=~/darkforge armor/i){
    quest::say("Darkforge helms require my decayed helm and visor as well as two Freeport militia helms.  The breastplate requires the decayed breastplate, decayed mail and two enchanted platinum bars. Vambraces need both decayed vambraces and a Qeynos Guard kite shield.  The bracers require both decayed bracers and a horn from a minotaur lord.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12283 => 1, 12284 => 1, 13921 => 2)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3140); # Item: Darkforge Helm
  }
  elsif(plugin::check_handin(\%itemcount, 12285 => 1, 12286 => 1, 16507 => 2)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3141); # Item: Darkforge Breastplate
  }
  elsif(plugin::check_handin(\%itemcount, 12288 => 1, 12287 => 1, 9023 => 1)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3142); # Item: Darkforge Vambraces
  }
  elsif(plugin::check_handin(\%itemcount, 12290 => 1, 12289 => 1, 19075 => 1)) {
    quest::say("Well done, $name, here is your reward.");
    quest::summonitem(3143); # Item: Darkforge Bracer
  }
  else {
    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
      quest::givecash($copper, $silver, $gold, $platinum);
    }
  }
  plugin::return_items(\%itemcount);
}

# Edited and updated by mystic414
# END of FILE Zone:soltemple  ID:80001 -- an_undead_knight_