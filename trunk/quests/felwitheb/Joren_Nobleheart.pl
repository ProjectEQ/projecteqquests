# Test of Illusion - enchanter epic - Chalice of Kings
# 


sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I hope you have been sent by the King. There is an urgent matter at hand.");
  }
  if ($text=~/i have been sent by the king/i) {
    quest::say("Our sources at the outpost have learned that the Chardokian royal family had a part in the disappearance of Firiona Vie. I have been ordered by King Tearis Thex to locate individuals familiar with the new lands and to order them to the gates of Chardok Mountain. Do you accept the king's order?");
  }
  if ($text=~/i accept/i) {
    quest::say("Gather your forces and march on the gates of Chardok. You are to strike deep into the home of Overking Bathezid. Your goal is not the overking himself, but his only living heir. His son's head will be the price to pay for their involvement in this kidnapping.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10627 => 1)) {
    quest::say("Vengeance has been fufilled! However, the King still has a heavy heart. Not until Firiona has been returned can this sadness be lifted. But in appreciation of your efforts, I am honored to present to you the King's Chalice.");
    quest::exp(100000);
    quest::summonitem(10608);
  }
  plugin::return_items(\%itemcount);
}

# EOF Zone: felwitheb ID: 62000 NPC: Joren_Nobleheart

