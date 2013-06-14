# Crystal Caverns' Ancient Artifacts
#

sub EVENT_SAY {
  if ($faction <= 3) {
    if ($text=~/hail/i) {
      quest::say("Huh? Don't you know better than to interrupt a Coldain enjoying his ale? I may be a user of priestly magic but that doesnt mean I can't bash your head in.");
    }
    if ($text=~/priestly magic/i) {
      quest::say("Aye. An old one not much taken with idle chit chat.");
    }
    if ($text=~/old one/i) {
      quest::say("Very old, very wise, and on and on. You must have some point to bothering me. I'm not a merchant and I don't contract myself out for work. I've performed works for the Dain. There isn't much I haven't done..");
    }
    if ($text=~/haven't done/i) {
      quest::emote("chuckles at you. 'If you want to impress me, and let me make certain you understand I doubt you can, then you can do what I never was able. For years I adventured and attempted to venture to the bottom of the Crystal Caverns in search of ancient artifacts from my people. Do that, show me that you have, and I will be impressed.'");
    }
  }
}

sub EVENT_ITEM {
  if(($faction <= 3) && (plugin::check_handin(\%itemcount, 30269 => 1))) { #Sceptre of the Coldain Ancients
    quest::emote("smirks at you. 'Hrm, you again eh? Did you come back to bother me with more...Wait a minute, let me see that. This is... This must be, yes it is. This is one of the ancient coldain priests sceptres of channeling. This is too good to be true. Haha! Oh, what I can do with this. Here, take this gem from the sceptre. If ancient lore proves right it will allow you to persuade beasts of many kinds.' He grins at you strangely and then leaves.");
    quest::summonitem(30270); #Gem of Persuasion
    quest::exp(25000);
    quest::ding();
    quest::depop_withtimer();
  }
  if(($faction <= 3) && (plugin::check_handin(\%itemcount, 30271 => 1))) { #Bottle of Karsin Acid
    quest::emote("turns his head long enough for you to slip the contens of the karsin bottle into his mug. As he drinks heavily his face turns even more pale until he looks as if in pain. He rushes from the bar and as he does a trinket slips from his pocket.");
    quest::summonitem(30270); #Gem of Persuasion
    quest::exp(25000);
    quest::ding();
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: thurgadina ID: 115120 NPC: Erdarf_Restil