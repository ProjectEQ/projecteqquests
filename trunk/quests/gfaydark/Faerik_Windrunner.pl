sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello. I am afraid I do not have time for small talk I have a very important job to do here and unless you are [interested in helping] me please leave me alone.");
  }
  if ($text=~/interested in helping/i) {
    quest::say("I didn't think I could get anyone to assist me with this, and you don't look like much but any help is good help. Allow me to introduce myself, I am Faerik Windrunner of the Emerald Warriors. I have been tasked with finding a party that is [willing to assist] us in investigating the disappearance of one of our own at sea.");
  }
  if ($text=~/willing to assist/i) {
    quest::say("I am very happy to hear this $name. I shall tell you what I know about this delicate situation. Gandak Whisperwind is one of the finest Emerald Warriors this town has ever seen. His weapon mastery skills are unmatched by anyone. Recently, his wife fell ill and there was a need for an antidote component that is grown by a well respected [farmer in the karanas]. Only if we receive these herbs from our friend in the karanas will Gandaks wife live.");
  }
  if ($text=~/farmer in the karanas/i) {
    quest::say("The farmer that I speak of is Tarnic McWillows, he runs a farm in the karanas that grows the herbs that we need for Lady Jernca`s medicine. So with that known we sent out 3 of our finest rangers and druids to obtain this herb and bring back the medicine but for the sake of if anything happened Gandak insisted to go along for the [ill-fated trip] because he loves his wife so very much");
  }
  if ($text=~/ill-fated trip/i) {
    quest::say("Well it would seem that something went terribly wrong not long after they set out on their journey to the karanas. We know this for sure because sadly we found their boat that washed up on shore with all of the bodies of the original party on board, except for Gandak's. So with this knowledge it is that we hope and believe somehow Gandak is still alive and is either making his way to the Karanas or is just somewhere that we cannot find him yet. We have heard of a group of Pirates originating from a [fortress in the sea] that might be responsible.");
  }
  if ($text=~/fortress in the sea/i) {
    quest::say("There are many talks of a fierce and deadly troll pirate clan that calls themselves Broken Skull. They are claiming responsibility for many of these sea hijackings and I believe that if Gandak is alive he might be there. If you wish to travel to attempt to gain knowledge about his disappearance seek out the mystical boat that docks in the Stonebrunt Mountains. If you should find Gandak please give him this medallion that he will know has come from us.");
    quest::summonitem(21986);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21988 => 1)) {#need correct text
    quest::say("Gandak is alive? That is excellent news, I will get this antidote to his wife right away.  The Emerald Warriors will not forget what you have done $name.  Here is a small token of our appreciation.");
    quest::summonitem(61004);
  }
}