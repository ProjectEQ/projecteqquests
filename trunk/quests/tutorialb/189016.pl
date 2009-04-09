#zone: tutorialb
#Revised Angelox

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Maps are a wonderful thing you know. Any time you find yourself lost you can hit BACKSPACE to view your map , try it.");
    quest::say("Come back later if you have time to [help].");
  }
  if ($text=~/help/i) {
    quest::say("Greetings $name. I've been trying to find some Gloomingdeep mushrooms for some potions I'm making, but I can't seem to find any. If you happen upon some I can make you a potion if you bring one to me.");
  }
}

sub EVENT_ITEM{
  if(plugin::check_handin(\%itemcount, 59955 => 1)){
    quest::say("Excellent, Thank you, $name. Now I can finish my potions. Here take this sample I made earlier.");
    quest::summonitem("59765");
    quest::exp(10);
  }
}
