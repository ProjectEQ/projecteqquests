#Zone: Najena
#Short Name: najena
#Zone ID: 44
#
#NPC Name: Akksstaff
#NPC ID: 44063
#Quest Status: finished
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What do you want?! Foolish $race, I am in no mood to treat with beggars. I have half a mind to turn my pet here loose on you! Well, don't keep me waiting, state your business or be off with you!");
  }
  if ($text=~/tell me about magi'kot/i) {
    quest::say("Ah, that I can help you with. Magi'kot was a powerful elementalist, able to control the power of the elements which surrounded him. He was not able to fully master the elements when I was learning from him, but soon after my departure I heard rumors that he was going after the Orb of Mastery. At the time, I did not feel he was ready to harness all the elements, but Magi'kot listened to no one. He was in search of power beyond any held by a mortal. Do you wish to hear more?");
  }
  if ($text=~/wish to hear more/i) {
    quest::say("Then bring me the torn pages of Mastery, there are four pages that can be found upon the women In this keep, though have a care, Najena's followers guard her treasures carefully, and delight in punishing trespassers.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28027 => 1, 28028 => 1, 28029 => 1, 28030 => 1)) {
    quest::say("Very well. Take these words back to that shriveled old gnome, Rykas, if you wish to complete this quest. Now leave me, $name, it sickens me to be this cordial for so long. And my pet needs exercise. Go!");
    quest::summonitem(28004);
  }
  else {
    quest::say("I do not need these.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone: najena  ID:44063 -- Akksstaff

