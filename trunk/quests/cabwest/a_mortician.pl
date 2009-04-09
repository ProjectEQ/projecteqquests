#The mortician serves as a vendor and also as part of a few quests. I'm creating him for use in The Penance quest, which allows an iksar to replace their starting weapon if they've lost it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("stares at you with hollow eye sockets. As he opens his jaw to speak, you are overcome by the foul smell of a thousand rotted corpses. 'What is your desire, master?'");
  }
 elsif($text=~/mortar and pestle/i){ #The Penance quest
  quest::emote("moves with a mixture of creaks and clicks and produces a grotesque looking mortar and pestle set. He places the items in your hands and motions indicating you dismissal. You can feel the vile power of your god moving throughout the material that makes up the two items.");
  quest::summonitem(17092);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
  quest::say("I've no use for that.");
}

#Submitted by Jim Mills