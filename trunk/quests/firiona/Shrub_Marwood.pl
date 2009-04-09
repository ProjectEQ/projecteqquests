# Handy Shillelagh & Beguile Plants
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("brushes pollen off of his tunic. 'Aachoo!! Oh!! Hello. Please look around. Unless you are a [druid looking for work].'");
  }
  if ($text=~/druid looking for work/i) {
    quest::say("Good. I need a stout adventurer to go to the wilds and find me a few items. I need some tump stumps - one Kromdul and one Kromdek type. I also need a mantrap root. Get me those three things and I will give you this handy shillelagh I found in the forest.");
  }
  if ($text=~/fertile crop/i) {
    quest::say("Looking to get hold of my family druid spell, ehh? It doesn't come without a price. Lucky for you all I need is for you to run a small errand for me. Go fetch me a Sarnak farsight crystal, some Sarnak nightdust, some strathebone heal silk and some powder of Tsu. Do that and I will give you a copy of my family secret.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12960 => 1, 12955 => 1, 12958 => 1)) {
    quest::emote("tosses the mantrap root out the window.. SPLASH!! 'I made a mistake. I didn't need that one. Here is the shillelagh I told you about. I found it in some burned out woods far from here. I cleaned it up and found it had a spark of mana so I had it enchanted with a few charges of my spell, [Fertile Crop]. Hope you like it.'");
    quest::summonitem(12953);
  }
  elsif (plugin::check_handin(\%itemcount, 11579 => 1, 12753 => 1, 12957 => 1, 12959 => 1)) {
    quest::say("Great work! I wish I had the coin to hire you on permanently. Maybe I will, when I find the lost trade city of Torsis. Here is the spell I copied for you. Careful, the ink is still drying.");
    quest::summonitem(12954);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::exp(25000);
  quest::faction(418,10); #inhabitants of firiona
  quest::faction(92,10); #emerald warriors
  quest::faction(314,10); #storm guard
  quest::faction(193,-30); #legion of cabilis
  quest::faction(250,-30); #pirates of gunthak
}

# EOF zone: firiona ID: 84193 NPC: Shrub_Marwood

