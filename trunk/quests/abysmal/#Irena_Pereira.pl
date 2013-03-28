# The Fourteen Great Adventures
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("focuses her attention on $name.");
    quest::say("You must be the one De'van spoke to. I'm not looking for any of your help. I know that the mighty Absor will return someday and until I am proven wrong I will continue to wait for him to arrive.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67620 => 1)) { # Absor's Writings
    quest::emote("takes the dusty tome from $name's hands.");
    quest::emote("stops to look at the tome refusing to believe it is what it seems. As she leafs through each page she starts to get choked up. Slamming the book closed defying her want to shed tears she looks up at you and kneels. 'I thank thee mighty adventurer for helping place the spirit of Absor to rest. If you have already helped everyone please tell De'van that your task is complete and he will reward you.");
    quest::setglobal("writingsa", 1, 5, "F");
  }
  plugin::return_items(\%itemcount);
}
# END of FILE Zone:abysmal  ID:279032 -- #Irena_Pereira.pl