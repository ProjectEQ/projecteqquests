sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("startles and gazes up at you. 'Careful, careful... I am nearly out of [pyrrhotite].'");
 }
 elsif($text=~/pyrrhotite/i){
  #Start of Pyrrhotite Experiments
  quest::say("Pyrrhotite is the name of this ore I have my hands on here. Ye see, I may still look an able-bodied dwarf, full o' spit and fire, but the time is coming where'n I may lose a step or two and they will take me off post- I want to be prepared for that time. I have been doing some [experiments] on this piece of rock, trying to have something to bring to Toktonn and maybe secure a job in ore studies for meself after retirin' from the Validus Custodus.");
 }
 elsif($text=~/experiments/i){
  #Part of Pyrrhotite Experiments
  quest::say("Well, there is a powerful magnetic quality to this particular rock, but it is very inconsistent. If I can figure out what makes it tick, it'd sure be a boon to some o' that crazy engineering the gnomes're always doing. This sample is running out though, and it ain't easy to come by what with the durned grimlings hogging the mines, I'd sure appreciate it if someone were to bring me some more. Careful though, it's deceptively heavy.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x Pyrrhotite Sample (29843)
 if(plugin::check_handin(\%itemcount, 29843 => 1)){
  #End of Pyrrhotite Experiments
  quest::say("Aww, noice, this'll do just right. Thanks millions, $name. Yer ok by me, ye are.");
  quest::faction(206,10);  # +Magus Conlegium
  quest::faction(168,10);  # +Katta Castellum Citizens
  quest::faction(350,10);  # +Validus Custodus 
  quest::faction(55,-30);  # -Coterie of the Eternal Night
  quest::faction(96,-30);  # -Eye of Seru
  quest::faction(138,-30); # -Hand Legionnaries
  quest::faction(139,-30); # -Hand of Seru
  quest::faction(228,-30); # -Nathyn Illuminious
  quest::faction(284,-30); # -Seru
  quest::exp(500);
 }
 plugin::return_items(\%itemcount);
}


#Quest: Pyrrhotite Experiments (Submitted By: Senzo)

