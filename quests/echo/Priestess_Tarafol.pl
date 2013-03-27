# Helping the Forsaken
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Oh, these poor forsaken souls. We must do whatever we can to help them. So far I've been unable to find anything that can cure their afflictions. I'm not even certain there is a cure. The least I've been able to do is ease some of their suffering.");
  }
  if ($text=~/cure/i) {
    quest::say("I'm not certain what causes the disease that inflicts most of these people. I believe it's from living down in these caverns for so long. It seems most people have a natural immunity, but the few who are stricken are cursed to slowly rot to death. A most horrible and painful way to die. I wish I could do more than just ease their pain.");
  }
  if ($text=~/help/i) {
    quest::say("You would be willing to do that? That would be great! I've heard of the possible curative powers of many things here on Luclin. I've been so busy here that I haven't been able to go out and search for any of the needed compounds. If you would be so kind as to collect some things for me I would be very appreciative.");
  }
  if ($text=~/collect/i) {
    quest::say("Ok, I need you to find these things... Underbulk Bile, Razorfungus Spores and Saprophyte Spores. You should be able to be find them within the nearby cavern systems. Please return to me once you have acquired all the ingredients. Thank you very much for assisting. Good luck.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 32403 => 1, 32510 => 1, 19836 => 1)) {
    quest::say("Thank you so much!! These will help so much in trying to find a cure for these people. Here, take this as a token of my gratitude.");
    quest::summonitem(19842);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: echo ID: 153039 NPC: Priestess_Tarafol

