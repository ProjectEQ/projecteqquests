# earthcaller - ranger epic
# naturewalker's scimitar - druid epic
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, small one! I am Xanuusus of the Stormreapers. You are welcome to rest beneath my mighty branches.");
  }
}

sub EVENT_ITEM {
# earthcaller
  if (plugin::check_handin(\%itemcount, 20483 => 1, 20484 => 1)) {
    quest::emote("waves his hands over the gem of corruption and a wave of warm energy passes through the area. With care for such a huge creature, he melds the gem into the sword and seems to glow all over as he channels energy into the weapon. 'Thus is the link of hate broken between Innoruuk and the spirit of earth. Through your will has balance returned. Your deeds, your work for the good of all, will be remembered by anyone who walks beneath the canopy of a forest or roams the plains. Continue your vigil over nature's balance.'");
    quest::summonitem(20488);
    quest::exp(2500000);
  }
# naturewalker's scimitar
  elsif (plugin::check_handin(\%itemcount, 20699 => 1, 20697 => 1, 20698 => 1, 20440 => 1)) {
    quest::emote("pushes the spirits into the air, making them dance around the scimitar. With a wave of his hand they melt into the blade and hilt of the weapon. 'With this the spirits of the lands are now free from the corruption of the dark gods.  Through your strength and dedication was this possible, $name.  May the foul poison that once poured into the earth itself never do so again. Take this weapon that you may continue to watch over the balance of nature. Go now, with the gods' blessings.'");
    quest::summonitem(20490);
    quest::exp(2500000);
  }
# Hand in for Case of JumJum juice
  elsif (plugin::check_handin(\%itemcount, 13411 => 1)){
    quest::say("Heh heh! Excellent, small one!  My roots have been longing for some fresh jumjum juice!  Thank you!  Take this for your trouble.  Be sure to thank the Tagglefoots for me.");
    quest::summonitem(quest::ChooseRandom(13977,84004,13083)); #carrot, fishing pole, pine needles
    quest::givecash(0,1,0,0);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: northkarana ID: 13061 NPC: Xanuusus 

