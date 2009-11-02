# Quest for Scepter of Sorrow

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am Ssynthi, [Warder of Ro]. Would you do a simple [service] for me?");
  }
  if ($text=~/warder of ro/i) {
    quest::say("I have renounced my ties to the Shadowed Men and become a follower of the one True Flame, Solusek Ro. I have hopes that one day my brethren will see the errors of their ways and cease their mindless war.");
  }
  if ($text=~/service/i) {
    quest::say("The body of my true love lies within this tomb. I see a token to remember her by the flower which lies atop her coffin. I would get it myself, but the tomb is warded against my kind. Since I can not enter, I ask you to fetch it for me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14362 => 1)) { #Flower
    quest::say("Thank you. Since you have done me a service with no thought of reward, I offer you this small token of my favor.");
    quest::summonitem(14364); #Scepter
    quest::faction(320,15);  #Temple of Solusek Ro
    quest::faction(291,-15); #Shadowed Men
    quest::exp(1000);
  }
  else {
    quest::say("This is not the token I seek.");
    plugin::return_items(\%itemcount);
  }
}
# Quest by mystic414