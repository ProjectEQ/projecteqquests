# Paladin Epic 1.0
# NPCID: 61013
# Zone: felwithea

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::say("Hail to you, friend. If you require assistance, please ask, if not I must return to my tasks.");
  }
  if ($text=~/tasks/i) {
    quest::say("It is here that the light shines brightest in our fair city. Here I sit, transcribing scrolls of luminescence. Spells to light the dark, to blind the evil with purity, or to heal those in pain. I find it so much easier to work with such spells if I am in the light itself.");
  }
  if ($text=~/purity/i) {
    quest::say("Cleansing and such. Often our temple will cleanse evil. If you have need of such a thing, I can help. Merely let me examine the item.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29002 => 1)) { #tainted darksteel shield
    quest::emote("squints and turns her head. 'By the gods, such a twisted aura this has! To see it hurts my eyes. I will help you if for no other reason than to remove such a twisted thing from existence.' She unrolls a scroll from her pack and softly chants over the dark metal shield. She hands it back to you with an exhausted smile on her face. 'Your heart seems pure. If I was able to help at all, I am honored. May the light shine warmly upon you.'");
    quest::summonitem(29005); #gleaming crested shield
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:felwithea  ID:61013 -- Elia_the_Pure