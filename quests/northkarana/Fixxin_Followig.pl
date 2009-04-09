# Fixxin Followigs Silvery Blades
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, $name! Fixxin is my moniker. Nice ta see ya. I am a member of the [Fangbreakers] and we are hunting [werewolves]. We run into lots of other [creepies] out here as well.");
  }
  if ($text=~/fangbreakers/i) {
    quest::say("Fangbreakers? You have not heard of us? We are the best [werewolf] hunters there are!");
  }
  if ($text=~/werewolves/i) {
    quest::say("Those blasted fiends hide among normal folk during the day, but at night their bloodlust is set free on an innocent populace. Some claim there is a cure for their condition but the only one we know of is an [enchanted blade] through the bellies of the beasts.");
  }
  if ($text=~/enchanted blade/i) {
    quest::say("Interested in an enchanted blade? You wouldn't be planning on hunting the moon beasts without a strong, well-oiled party to back you up, now, would you? Well, in any case, I'll gladly lend you a copy of my book, Fixxin Followigs Silvery Blades, if you will fetch me a bar of silver. My supply is running low and our weapons are in need of repair after the deaths of so many lycanthropes.");
  }
  if ($text=~/creepies/i) {
    quest::say("Besides the occasional werewolf, we also tend to run across many griffons and hill giants out this way. Those giants can be bruisers but against a trained team such as we, they don't stand a chance. Especially with my enchantments protecting us.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 16500 => 1)) {
    quest::emote("thanks $name heartily. 'Here is the book as promised. I wish you luck with your enchanted weapons. May they slay many lycanthropes before they go dull.'");
    quest::summonitem(18178);
    quest::faction(167,10); #karana residents
    quest::faction(135,10); #guards of qeynos
    quest::faction(257,10); #priests of life
    quest::faction(183,10); #knights of thunder
    quest::exp(500);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: northkarana ID: 13063 NPC: Fixxin_Followig 

