#Hrelic_Reista.pl
#Draught of Thunder


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("glances over from his books for a moment. 'Greetings. Have you come to the realm of the tranquil to study as have? The chaotic energy of lightning has caught my interest of late. I've been trying to understand the magics that further refine my control of lightning and [thunder].");
  }
  if($text=~/thunder/i) {
    quest::say("The sages of Knowledge have been able to create useful powers by translating some of the ancient scripts found in the planes. I've been doing further research into the Draught of Thunder spell. I believe I can refine the power of the thunder and lightning into a bolt of pure destructive energy. I hear rumors that the giants of Torden have acute control of thunder and lightning. If you bring me one of their lightning spheres and a copy of the Draught of Thunder scroll I may be able to weave them into a new spell.");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28445 => 1, 9430 => 1)) {#Spell: Draught of Thunder, Lightning Sphere
    quest::say("Thank you $name!  May this spell serve you well.");#Text made up, no text listed on alla's
    quest::summonitem(59528);#Spell: Draught of Lightning
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
    
}#Done