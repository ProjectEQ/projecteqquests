#Zone: butcher
#Short Name: Butcherblock Mountains
#Zone ID: 68
#
#NPC Name: Walnan
#NPC ID: 68087
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hallo, $name! I am Walnan, elementalist, summoner, wanderer, and sometimes teacher. Might you be a elementalist in search of the truth?");
  }
  if ($text=~/i am in search of the truth/i) {
    quest::say("The truth is something not all people can handle or understand. If the truth of the elements is what you seek then the Power of the Elements shall reveal all. Have you come to learn of Magi'kot?");
  }
  if ($text=~/i have come to learn/i) {
    quest::say("Magi'kot was the most powerful elementalist of his age. He may have been the most powerful mortal mage of all time, such was his mastery. He wished to obtain infinite knowledge and wisdom in order to further expand the arcane art of Summoning. Do you know what became of Magi'kot?");
  }
  if ($text=~/no/i) {
    quest::say("Only a few elementalists and followers outside our circle know what truly happened to Magi'kot. Even now, many are fearful to speak of his name. If you truly wish to continue, here is what you must do. Gather the Power of the Earth, warded by a fae creature. Then seek the Power of Fire, held by an elemental. Next you will need the Power of Wind, held by a twirling and prancing wanderer who has been corrupted. Finally, the Power of Water, held by a ravenous beast who is the minion of a fallen Sarnak. Bring them all to me, and I shall give you the Power of the Elements.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28036 => 1, 28037 => 1, 28038 => 1, 28039 => 1)) {
    quest::say("The arcane art of Summoning is derived from the power of the elements which surround us. Continue your journey across the Ocean of Tears. In a dark fortress, you should find Akksstaf lurking about. Be wary, but tell him that you seek Magi'kot. Hurry now $name, you do not wish to miss the ship!");
    quest::summonitem(28031);
    quest::exp(500);
  }
  else {
    quest::say("I do not need these.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: butcher ID:68087 -- Walnan

