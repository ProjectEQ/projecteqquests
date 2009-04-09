sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::emote("piercing eyes meets yours. ''Are ye a guest of Vornol's too? Have faith my friend but don't let that durn mage fool you, I know him better than anyone else. Well except for Valana of course.''");
 }
 if($text =~ /I am a cleric/i) {
	quest::say("I thought you might be. I have some armor to reward those that prove to be most holy.");
 }
 if($text =~ /armor/i) {
	quest::say("The armor I have is a helm, breastplate, vambraces, greaves, pauldrons, bracer, and boots. The rest you will have to get from my friend and guard Kayn. Just ask him about armor.");
 }
 if($text =~ /boots/i) {
	quest::say("For the boots you must prove yourself by bringing me a star jewel, a mark of belief and a light etched sapphire.");
 }
 if($text =~ /bracer/i) {
	quest::say("For the bracer you must prove yourself by bringing me a moon jewel, a mark of truth, and a light etched ruby.");
 }
 if($text =~ /breastplate/i) {
	quest::say("For the breastplate you must prove yourself by bringing me a sky jewel, a mark of faith, genuine leather padding, and a brazier of light.");
 }
 if($text =~ /greaves/i) {
	quest::say("For the greaves you must prove yourself by bringing me an astral jewel, a mark of purity, a lexicon of omens, and a candle of rites.");
 }
 if($text =~ /helm/i) {
	quest::say("For the helm you must prove yourself by bringing me a cloud jewel, a mark of remedy, a vial of holy water, and a holy statuette.");
 }
 if($text =~ /pauldrons/i) {
	quest::say("For the pauldrons you must prove yourself by bringing me a sun jewel, a mark of the divine, and decorative bracers of wistfulness.");
 }
 if($text =~ /vambraces/i) {
	quest::say("For the vambraces you must prove yourself by bringing me a meteor jewel, a mark of the holy, a tome of deities, and a restored tapestry.");
 }
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4490 => 1, 4839 => 1, 4840 => 1)) { #boots
    quest::summonitem(3742);
    quest::exp(10000);    
  }
  if(plugin::check_handin(\%itemcount, 4838 => 1, 4829 => 1, 4489 => 1)) { #bracer
    quest::summonitem(3741);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4798 => 1, 4797 => 1, 4796 => 1, 4492 => 1)) { #breastplate
    quest::summonitem(3737);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4494 => 1, 4818 => 1, 4810 => 1, 4809 => 1)) { #greaves
    quest::summonitem(3739);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4491 => 1, 4795 => 1, 4793 => 1, 4794 => 1)) { #helm
    quest::summonitem(3736);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4820 => 1, 4819 => 1, 4488 => 1)) { #pauldrons
    quest::summonitem(3740);
    quest::exp(10000);
  }
  if (plugin::check_handin(\%itemcount, 4799 => 1, 4493 => 1, 4808 => 1, 4800 => 1)) { #vambs
    quest::summonitem(3738);
    quest::exp(10000);
  }
    quest::say("I have no use for this.");
    plugin::return_items(\%itemcount);
    return 1;
    } 