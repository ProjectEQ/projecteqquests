sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the new order of life. the life of service to our diseased Lord. Bertoxxulous.  Did you encounter any of my [pets] on the way here?  I hope not.");
}
if($text=~/what pets?/i){
quest::say("My pets are the skeleton guardians of these catacombs.  Some have been behaving erratically since the arrival of [Drosco].");
}
if($text=~/who is drosco?/i){
quest::say("Drosco used to be a loyal member of our shrine. until we learned the truth.  The truth was that he was a mole from the Knights of Thunder.  It appears they are assisting the Temple of Life in their pursuit of our eradication.  Drosco was apprehended and boiled alive.  I turned his boiled body into a zombie to march these halls.  Now he must be stopped.  He has begun to [compromise the shrine's location].");
}
if($text=~/how will he compromise the shrine/i){
quest::say("The problem is. he was strong in Karana's faith.  And as sometimes is the case. there is a resonance from his deity.  This causes him to wander in and out of our hidden shrine and I believe it also interferes with my control of the other pets.  Please find him and destroy him.  Bring me back the note I placed upon his body.  Go!!"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18805 =>1 )) {
    quest::say("Good work! You shall rise quickly in our ranks of evil. Let no man stand in your way and never betray the shrine or you to will join our collection of undead. You can also assist me with a [new task].");
    quest::summonitem(17002);
    quest::ding();
    quest::exp(1000);
    quest::faction(21,1);
    quest::faction(135,-1);
    quest::faction(235,-1);
    quest::faction(257,-1);
    quest::faction(53,1);
    quest::givecash(0,3,0,0);
      }
      plugin::return_items(\%itemcount);
}
#END of FILE Zone:qcat  ID:45067 -- Kurne_Rextula 

