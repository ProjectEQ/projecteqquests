# Part of the quest for Tishan's Kilt

sub EVENT_SAY {
  if($text =~/hail/i) {
    quest::say("Hmmph.");
  }
  if($text =~/avenge your brother/i) {
    quest::say("My brother was part of a raiding party that adventured into the Caverns of Guk. Somewhere within he was betrayed and left for dead by the dastardly brother of Karg IceBear - Martar. I want you to find me what remains of my brothers body and bring it back to me. I am told that he died within a mine shaft.");
  }
}

sub EVENT_ITEM {
  if($itemcount{10528} == 1) {
    quest::say("You must be another one from Vilissia. I will tell you what I tell all the others--you must help me [avenge] my [brother] before I will help you attain Tishan's Kilt.");
    quest::summonitem(18797);
  }
  if($itemcount{10556} == 1) {
    quest::say("Oh Wulfthan, look what has become of you. I told you that you should not have trusted Martar.  $name, as a final service, I want you to kill Martar IceBear for me. He is known to roam these parts. Bring me the Warthread Kilt that he wears and my two reminder notes, and I will give to you Tishan's Kilt. ");
    quest::summonitem(18798);
  }
  if(($itemcount{1347} == 1) && ($itemcount{18797} == 1) && ($itemcount{18798} == 1)) {
    quest::say("Thank you for avenging my brother's death, friend.  Here is your reward."); # Unsure of text, made this up.
    quest::summonitem(2365);
    quest::exp(500);
  }
}

# Quest edited and updated by mystic414

