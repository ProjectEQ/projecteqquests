sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings.  Is not Kelethin the most glorious city you have seen?  A part of the forest itself. it is.  The forest is our life force.  It shelters us and we feed from its vegetation.  The [Soldiers of Tunare] have [harvesters] upon the grounds at all times.  We have our hunters.");
}
if($text=~/what soldiers of tunare/i){
quest::say("The Soldiers of Tunare are lovers of the forest.  They are druids who protect and nurture the forest.  The forest is the genesis of their mana.  The soldiers are comprised of Fier'Dal and Koada'Dal.  Imagine that!  A Koada'Dal not afraid to get dirt under his nails!!");
}
if($text=~/what harvesters/i){
quest::say("Just as our young warriors are employed as hunters to supply all the meat for Kelethin. the druids have their young scour the grounds of the forest for all the vegetation we need to survive."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54103 -- Sindl_Talonstrike 
