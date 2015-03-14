
sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Rrraaarrr! Hello furless. You come to study from [mighty warrior] yes?");
  }
  elsif($text=~/mighty warrior/i){
    #The Luck of Allix (START)
    quest::say("Errr. Well, Allix not yet mighty warrior but soon yes. Allix just come of age and soon will enter training to become mighty Pasdar. Errr. Allix little nervous. Allix missing [one thing] to become mighty Pasdar.");
  }
  elsif($text=~/one thing/i){
    #The Luck of Allix
    quest::say("Well, Allix not have to have but is good. Is leaf. Ajrah leaf. Powerful magic in the leaf. Pasdar hold's next to body, keep's body strong and mind clear. Not have to have but Pasdar without Ajrah Leaf is poor Pasdar. Someday Allix travel to the mighty plain's of East Karana and get one from tree's.");
  }
}

sub EVENT_ITEM {
 #Handin: Ajrah Leaf
  if(plugin::check_handin(\%itemcount, 6349 => 1)){
    #The Luck of Allix (END)
    quest::say("Ajrah! Raaarrr! Ajrah Leaf! Allix destined to be mighty saiar now! Allix unsure how to thank you. Here, take this. Is my most treasured tunic.");
    #Summon: Erudehide Tunic
    quest::summonitem(1120);
    quest::exp(25);
   }
  plugin::return_items(\%itemcount);
}


#EOF
