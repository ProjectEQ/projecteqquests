# Xanthe's earring of nature/earring of the solstice - spell: protection of the
# cabbage

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("seems lost in thought and looks up only briefly from her work. 'Oh, hello $name, welcome to the New Thicket Inn! If you'll excuse me, I'm a bit busy copying this [scroll]. I'll be with you in a moment to chat, or to trade if you've come about the [earring]'");
  }
  if ($text=~/scroll/i) {
    quest::emote("looks up again with a quiet smile, 'I'm making a copy of a new Protection spell, it's very exciting! The druids of Norrath have just completed an important ritual, and the gods have blessed us with this new spell! I'd be happy to scribe you a copy, if you were to fetch me the [ingredients].'");
  }
  if ($text=~/ingredients/i) {
    quest::say("Oh, let me see... I'll need a sheet of fancy Blessed parchment, a small flask of Dark Root ink, and of course a large quill. I think a Stormraven's quill would be best, certainly better than this one I've been using so far. Bring those items to me and I'll be happy to make you a copy for yourself. I'm not sure where you'll find all of those, I seem to have bought up the last of the stock in several places. Someone's bound to have them for sale, good luck with it!");
  }
  if ($text=~/earring/i) {
    quest::emote("looks up again, 'Oh, have you come about the earring then? That's wonderful! As you probably know, the druids have recently completed an ancient ceremony, and some delightful people who weren't druids were able to participate. Sadly though, only druid's were able to use the Earrings of Nature that were created with the ceremony. I've been collecting spare earrings of Nature from those who can't use them, and giving an Earring of the Solstice in return. It's a good deal all around, as we both can benefit from the trade. If you have an earring of Nature to trade, just give it to me and I'll happily swap you, and if you don't like it, you can give it back.'");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5761 => 1, 5762 => 1, 5766 => 1)) { #turn in for spell only
    quest::emote("smiles warmly, 'Brilliant, you've brought me some more supplies! Here, please take this last copy I've made. I'd planned to use it for myself, but I'll let you use it so you don't have to wait for me to make a new one. I do hope you enjoy it!'");
    quest::summonitem(9722);
  }
  elsif (plugin::check_handin(\%itemcount, 9721 => 1)) {
    quest::say("Here you are friend, Xanthe's Earring of Nature. I'll see that your old earring goes to someone who can make better use of it. Safe travels, friend!");
    quest::summonitem(28771);
  }
  elsif (plugin::check_handin(\%itemcount, 28771 => 1)) {
    quest::say("Here you are friend, an earring of the Solstice. I'll see that your old earring goes to a druid who can make better use of it. Safe travels, friend!");
    quest::summonitem(9721);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: fungus ID: 157046 NPC: Rebecca_Cabbageleaf

