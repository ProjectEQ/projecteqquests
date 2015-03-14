#Andara C'Luzz, Neriaka 41095 
#Need Ending Statement 
#Need Factions 
#Status: Not Complete 

sub EVENT_ITEM { 
  if(plugin::check_handin(\%itemcount, 16166 => 1, 19582 => 1, 19583 => 1)) {
    quest::exp(150);
    quest::summonitem(19611);
    quest::say("Here's your bow. Use it well, young rogue.");
  }
  plugin::return_items(\%itemcount);
}