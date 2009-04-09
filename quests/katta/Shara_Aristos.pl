sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings good $name! I am Shara Aristos. Governess of History and Lore. I aid the scholars and Magistrate Salic in keeping accurate and detailed records of the history of Katta Castellum and the Combine Empire as well as organize and record lore on an abundance of topics."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:katta  ID:160147 -- Shara_Aristos 
