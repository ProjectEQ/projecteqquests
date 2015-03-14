#  Rakshasa Skulls
#  Needs to be set to accept Globals.

sub EVENT_SAY {

   if($text=~/Hail/i){

   quest::say("Things slip my mind easily these days. Are you here for something specific or are you a one of our new recruits?");
}
   
   if($text=~/components/i){
   # if($Rakshasa == 1 && $text=~/components/i){ #global check replace

   quest::say("The legends instruct that the ritual requires an Amulet of Golden Rays crafted by a worshiper of the sun, Charcoal that burns with a Black Flame, and the Brain of a creature that can Leech the Thoughts of others. If you manage to procure these items please take them with the instructions I have provided to Spiritualist Roleko at the Grimling Forest Outpost. The Rakshasa shall be summoned and slain there away from the citizens of Shar Vahl.");
   
   quest::summonitem(10915); # Rakshasa Materialization Ritual
  }


}

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount, 31849 => 1)) {  # Rolekos Report of Occurrences
   
   quest::say("So it seems there is more truth to the legends of the Rakshasa than is commonly believed. I recall much of the tales of the wicked shaman who sold their souls and bodies to the dark spirits.  There is a ritual that must be performed to force the Rakshasa to fully materialize in our realm so that it may be slain. I will write down the instructions for the ritual but the [components] I'm afraid may be difficult to obtain.");
#   quest::setglobal("Rakshasa", 1, 5, "F"); # global to keep from starting at this point
   quest::faction(68,10); # Dar Khura
   quest::exp(500);
   quest::ding();
   
  }


}


#END of FILE Zone:sharvahl  ID:155098 -- Scribe_Cholsa.pl