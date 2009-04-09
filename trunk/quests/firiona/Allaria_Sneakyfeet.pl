# Rozzut's Whistler
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well hello, $name. What brings you to me? Are you one of the sneaky folk in search of the plans for the Whistler?");
  }
  if ($text=~/plans for the whistler/i) {
    quest::say("I must tell you first off, there was much bloodshed in getting these plans. Three of Rivervale's bravest warrior were killed by Rozzut's brother, Neezee in order to keep the plans out of the hands of the Goblins. Allaria sighs deeply. There was much sorrow over this. The only positive that seemed to come out of the whole ordeal, was the finding of the plans to make the weapon that Rozzut, Chief Zambooz's main assassin uses so effectively. I have now made it my calling to give a copy of these plans to those that are worthy of such knowledge. Do you believe yourself to be worthy of such an honor?");
  }
  if ($text=~/i am worthy/i) {
    quest::say("'Very well then. Here are the plans for the weapon that is said to cut holes into the enemy without much effort. Legend has it that if the wind is blowing, your enemy will be whistling after the fight. But they won't be whistling voluntarily.' Allaria smiles. 'Good luck to you friend.'");
    quest::summonitem(18347);
  }
}

# EOF zone: firiona ID: 84209 NPC: Allaria_Sneakyfeet

