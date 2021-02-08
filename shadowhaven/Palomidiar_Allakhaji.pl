# The Pulsating Rock
#
# items: 4768

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day to you adventurer. Is there something I can assist you with? I have been quite busy as of late with the study of this [mysterious glowing rock] I was presented with and I do not have much time for small talk.");
  }
  if ($text=~/mysterious glowing rock/i) {
    quest::say("Well, if you look closely, I have it right here. It has been glowing since I first received it. But since it was delivered to me it has lost a lot of it's aura. I feel I will need another sample soon, it seems to lose its [energy] as time goes on.");
  }
  if ($text=~/energy/i) {
    quest::say("This I do not know and I am trying to discover. However, as I said before, this rock is slowly losing its energy it seems. I will need another [sample rock] soon.");
  }
  if ($text=~/sample rock/i) {
    quest::say("I believe these rocks are from the Paludal Caverns, if my sources were correct. Beetles that crawl over and feed off the rock structures there might explain the glowing, if they are the origins of these mysterious rocks. To further my studies I will need another pulsating rock. Will you [retrieve this rock] for me?");
  }
  if ($text=~/retrieve this rock/i) {
    quest::say("Fantastic, $name. Please return to me at once with a pulsating rock. We will conclude our dealings at that time.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4768 => 1)) {
    quest::say("This is it, this is what I am looking for to continue my studies. It is generating the same if not more energy then the rock before it! Excellent work, $name. You have my sincere thanks. Should you collect further samples in the future please bring them to me directly.");
    quest::exp(2500);
    quest::faction(1511,30); #house of midst
    quest::faction(1508,30); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadowhaven ID: 150088 NPC: Palomidiar_Allakhaji

