#BeginFile: jaggedpine\#Guard_Finewine.pl
#
#Quest: Qeynos Badge of Nobility (Badge #5) (Incomplete)
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Yeah. Hi. Lovely place this. Humid, dark, wild animals all over the place, man eating plants, snakes and bugs finding their way into my armor and biting me where a man ought not be bit. And if [Bossamir] is right, we're soon to be cut down by ravaging gnolls. Why-oh-why did I get assigned to this job? Why wasn't I assigned to Qeynos where a man can get a decent meal and sleep in a nice bed at night? Oh I'm sorry. Did I say that out loud?");
  }
  if($text=~/Bossamir/i) {
    quest::say("Hmm. . . Yeah, I have this tendency to prattle on when I'm completely miserable. According to what my colleague Bossamir has heard, these gnolls may be tougher then we thought. But that would be par for the course anyway with the way my pitiful life is going. Woe is me. The people in this backward settlement hate me, Sergeant Caelin hates me and I assume Kane hates me too because he sent me to the armpit of Antonica on a suicide mission.");
  }
  if($text=~//i) {
    quest::say("");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 8283 => 1)) { #Official Warning
    quest::say("So he wants to send me to jail simply because I'm not filling out some silly reports? How can I be expected to think in such a decrepit state? Maybe you could help me. If I had a meal worthy of someone of my breeding then maybe I could think. Bring me something elegant, I don't want anything dull and pedestrian. I don't know what I want though. Do you have any suggestions?");
  }
  elsif(plugin::check_handin(\%itemcount, 8199 => 1) || plugin::check_handin(\%itemcount, 8198 => 1)) { #Dryad Pate or Potameid Pate
    quest::say("I like it... but it is not quite perfect. I need a better pate. Here, you will need some brandy. This is a special blend...");
    quest::summonitem(8284); #Finewine Family Brandy
  }
  elsif(plugin::check_handin(\%itemcount, 8278 => 1)) { #Panther Pate
    quest::say("You have done well. I guess you would like the report now.");
    quest::summonitem(8279); #Stack of Shift Reports
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:jaggedpine  ID:181173 -- #Guard_Finewine