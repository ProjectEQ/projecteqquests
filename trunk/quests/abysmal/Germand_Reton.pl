# Germand's Problem
# Created by Gonner

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. Not much time to talk. We have a big [problem] on our hands.");
  }
  if($text=~/problem/i) {
    quest::say("Before the magical Buoys that produce the protective dome over the city were in place, a large sea creature damaged the bottom of the ship. The problem is we need some wood to repair it. There appears to be no wood on this new continent however. If you could perhaps [find some wood] and bring it to me I could find some sort of reward for you.");
  }
  if($text=~/find some wood/i) {
    quest::say("Very good. Please travel to the Jaggedpine Forest and find Ervonis Leaflow. He supplied us with a lot of the wood during the construction of the Queen of Thorns. Once you find him give him this note.");
    quest::summonitem(55558); # Note to Ervonis
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55536 => 1)) { # Bundle of wood
    quest::say("You found some wood! This will really help us with fixing the ship. Take this for your trouble. An enchanter friend of mine makes these little trinkets. Their magic doesn't last long, but it might help you out. You have my thanks and the thanks of the entire Wayfarers Brotherhood.");
    quest::exp(10000);
    quest::summonitem(55538); # Wood Friend Bauble
  }
  else {     
    quest::say("I have no use for this.");   
    plugin::return_items(\%itemcount);
  }
}
#END of FILE zone:abysmal ID:279265 -- Germand_Reton.pl