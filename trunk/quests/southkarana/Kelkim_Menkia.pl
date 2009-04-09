#
#

sub EVENT_SAY { 
  if ($text=~/Hail/i) {
    quest::emote("sighs as she looks over her lute.");
    quest::say("My lute was mangled by those damnable gnolls. I have no idea how I'm going to get a new set of strings for it. They were so rare.");
  }
  if ($text=~/rare strings/i) {
    quest::say("I only use the finest lute strings on my lute. My uncle got them for me from across the world. His name was Zendrik the Wurmslayer. As his name implies, he killed many wurms and drakes. The strings for my lute were all made from the guts of the wurms and drakes he slew.");
  }
  if ($text=~/wurms and drakes/i) {
    quest::say("The strings were from a chromodrac, a red wurm, and a huge onyx drake. It always sounded so wonderful.");
    quest::emote("sighs, looking off into the horizon.");
    quest::emote("shakes her lute angrily");
    quest::say("I'll kill all of you dirty gnolls!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20527 => 1, 20528 => 1, 20529 => 1)) {
    quest::emote("snatches the gut strings from your hand and immediately begins to string her lute.");
    quest::say("This is wonderful, I will be able to play my lute again soon! Take this old sheet of music I found - I don't think I will have much use for it. My new desire is to bash gnoll heads in with my lute. Safe travels to you, $name.");
    quest::summonitem(20377);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:southkarana  ID:14082 -- Kelkim_Menika

