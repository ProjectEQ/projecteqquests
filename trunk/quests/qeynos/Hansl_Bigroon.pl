#####################################
#Quests: The Bridge
#NPC: Hansl Bigroon
#Zone: qeynos
#Original Author Unknown
#Heavily modified by RealityIncarnate
#####################################

sub EVENT_SAY { 
  if($text=~/Hail/i) {
    quest::say("Greetings, $name!  Are you a [citizen of Qeynos] or are you a [traveler of sorts]?");
  }

  if($text=~/traveler of sorts/i) {
    quest::say("Ah, yes! Traveling can be truly dangerous. Have you ever been to Erudin or do you not care for that place?");
  }

  if($text=~/have been to Erudin/i) {
    quest::say("The trip to Erudin takes far too long. I have been designing a [titanic bridge] which will shorten the trip. Well, I cannot take full credit, most of the plans are being designed by [three great engineers].");
  }  

  if($text=~/three great engineers/i) {
    #text made up
    quest::say("I'm keeping the list of the engineers to myself until the project is underway.  There has been some opposition to the idea, and we wish to protect them from harm.");
  }

  if($text=~/citizen of qeynos/i) {
    quest::say("Then you are aware of how few ships come and go to the continent of Erudin. The port authority is even planning to tax all passage aboard the ships. You will be happy to know that a few other engineers and I are designing a [titanic bridge].");
  }

  if($text=~/what titanic bridge/i) {
    quest::say("My grand plan has always been to erect a bridge which would span the distance between Qeynos and Odus. It would bypass the city of Erudin. Antonius Bayle would take full control of the bridge and its adjacent territories. This has had some opposition in Erudin, but for the most part, they just believe it is impossible to build such a bridge.");
  }
}

#This script handles the dropping of the sealed list of engineers.
#To simulate dropping the list, he creates a proximity when leaving his house and sends an emote to draw attention to it.  
#The proximity is cleared when either someone enters (gets the note) or he gets far enough away from the area.

sub EVENT_WAYPOINT {
  if ($wp == 0) {
    quest::emote("drops something as he walks away.  He doesn't seem to notice.");
    quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
  }

  if ($wp == 13) {
    quest::clear_proximity();
  }
}

sub EVENT_ENTER {
  $client->Message(15,"A note on the ground catches your eye.");
  quest::summonitem(18835);
  quest::clear_proximity();
}

#END of FILE Zone:qeynos  ID:1096 -- Hansl_Bigroon
