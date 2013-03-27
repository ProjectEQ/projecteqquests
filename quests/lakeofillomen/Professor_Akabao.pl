# Part of quest for Veeshan's Peak key

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Salutations, traveler! I dont get many visitors in these isolated regions. Have you come to learn of the ancient tribes of the Iksar?");
  }
  if ($text=~/tribes/i) {
    quest::say("There were five tribes of Iksars that rose from the ashes of the Shissar Empire and founded their kingdoms on the continent of Kunark. Three of the tribes were extinguished many years later by the Kunzar tribe which is the tribe that the current Iksar are descendant from. I focus my studies on learning of the extinct tribe of Kylong.");
  }
  if ($text=~/kylong/i) {
    quest::say("The Kylong were a mountain dwelling tribe of Iksar that strove for esoteric knowledge. They had vast libraries of ancient magical tomes that had been acquired from the Shissar sorcerers, and strove to understand and put the rituals documented in the tomes to practical use. When the Kunzar armies marched upon the Kylong, the three greatest Kylong mystics shattered the Medallion of Kylong, a holy relic of their tribe, and fled their mountain homes in order to prevent the Kunzar from reassembling the Medallion of Kylong.");
  }
  if ($text=~/medallion/i) {
    quest::say("I have been attempting to learn of the destinations of the three Kylong leaders that held the fragments of the medallion. I know only that they sought shelters to hide and continue the practice of their mystical arts In order to one day return their tribe to it's former glory. Their remains may exist beneath some of the fortresses that are centers of Iksar and Sarnak necromancy. I have seen indications that some of the tomes within those fortresses are in fact the very tomes once cherished by the Kylong. Should you manage to recover the broken pieces of the Medallion of Kylong bring them to me so that I may restore the ancient artifact.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19962 => 1, 19963 => 1, 19964 => 1)) {
    quest::say("For ages this medallion has been scattered across these inhospitable lands, I had just about given up hope of locating the pieces and rebuilding this piece of Iksar history. You may keep it. It is enough to know that I have done my part to restore such an artifact to the people of Norrath.");
    quest::summonitem(19955);
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}
# Quest by mystic414