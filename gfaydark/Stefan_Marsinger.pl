sub EVENT_SAY {
 if($text =~ /Hail/i) {
   quest::say("Salutations, my name is Stefan Marsinger. My sister Seana and I are here on a mission for the League of Antonican Bards. Are you [interested] in assisting us in our task?");
 }
 if(($text=~/interested/i) && (($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
     quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the ghasts, scorn banshees, and haunted chests. They seem to share some qualities of your art and lie in the least dangerous areas. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some sort of minor signet that verifies you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some abhorrent powder and a jacinth. I can craft you protective item and may have some further work for you to do.");
 }
    if(($text=~/interested/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter"))) {
     quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the revenant, the ashenbone drake, and the loathing lich. They seem to be the main practitioners of your art in the least dangerous area. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some type of signet that proves you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some vampire dust and a diamond. I can craft you a protective item and may have some further work for you to do.");
 }
    if(($text=~/interested/i) && (($class eq "cleric") || ($class eq "Shaman") || ($class eq "Druid") || ($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
     quest::say("Please speak to my sister, Seana, for further information. She will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
 if (($text=~/what work/i) && (($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
   quest::say("Wonderful. Return to the plane and continue your studies of the hybrid demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is a higher echelon of power that I will need to be familiar with. Seek out the Teir`Dal knights and grave lords of hate. All of these creatures should be within your area of study, but take care! Make sure to keep your protection with you at all times. Some of them should have a kind of Knight's crest symbolizing their rank; bring me this crest and some ghast fingerbones, along with your Gem of Courage. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with a final reconnaissance errand.");
 }
    if (($text=~/what work/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter"))) {
     quest::say("Wonderful. Return to the plane and continue your studies of the demons of magic. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is another echelon of power that I will need to be familiar with. Seek out the minions of magic that seem to take Dark Elven form. These would be the sages, warlocks, and sorcerers. All of these creatures should be within your area of study, but take care! You may even find some that follow your particular discipline if that makes you more comfortable. Make sure to keep your protection with you at all times. Some of them should have a kind of Etched Sorcerer's Crest symbolizing their rank; bring me this crest and some hatebone drake bones, along with your Gem of Sorcery. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with a final reconnaissance errand.");
 }
    if (($text=~/what work/i) && (($class eq "cleric") || ($class eq "Shaman") || ($class eq "Druid") || ($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
     quest::say("Please speak to my sister, Seana, for further information. She will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
 if (($text=~/what final task/i) && (($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
   quest::say("In my personal studies I have heard rumor that there are four archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all four, I am not even certain that they exist. The fabled tomes are the Compendium of Classic Torture, Texts on Pain, Writ of Agony, and Tactical Hatred. If they do indeed exist and you manage to find them, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own confidantes, and they seldom seem to show their faces. It is possible the Prince of Hate himself holds the tomes close. Find me the Compendium of Classic Torture; return it to me with your Gem of Daring and your work is finished.");
 } 
    if (($text=~/what final task/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter"))) {
     quest::say("In my personal studies I have heard rumor that there are four archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all four, I am not even certain that they exist. The Concordance of Black Magic, Teachings of Innoruuk, Book of the Dead, and Applications of Suffering are the fabled tomes. If they do indeed exist and you manage to find them, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own advisors, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tomes close. Find me the Concordance of Black Magic; return it to me with your Gem of Enchantment and your work is finished.");
 }
    if (($text=~/what final task/i) && (($class eq "cleric") || ($class eq "Shaman") || ($class eq "Druid") || ($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
     quest::say("Please speak to my sister, Seana, for further information. She will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10037 => 1, 54044 => 1, 16537 => 1)) { #caster 1
    quest::summonitem(54036); #gem of sorcery
    quest::emote("inspects the items closely before transforming them into a small glimmering jewel. 'That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some more [work] for me?");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54036 => 1, 54045 => 1, 54046 => 1)) { #caster 2
    quest::summonitem(54037); #gem of enchantment
    quest::say("Very interesting, I must get to this at once. I am sure the bones will prove most valuable in learning of the drakes as well. Take this with you once more; the protective properties are even more powerful now. Are you up to a [final task]?");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54037 => 1, 54047 => 1)) { #caster 3
    quest::summonitem(54038); #gem of conquest
    quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. 'What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.' Seana turns and places the book carefully in a box covered in protective symbols. 'Thank you very much for all of your assistance. Please rest, I have much work to do informing the League and our city of these developments.");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 10053 => 1, 54052 => 1, 54062 => 1)) { #hybrid 1
    quest::summonitem(54030); #gem of courage
    quest::emote("inspects the items closely before transforming them into a small glimmering jewel. 'That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some more [work] for me?");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54030 => 1, 54053 => 1, 54054 => 1)) { #hybrid 2
    quest::summonitem(54031); #gem of daring
    quest::say("Very interesting, I must get to this at once. I am sure the bones will prove most valuable in learning of the drakes as well. Take this with you once more; the protective properties are even more powerful now. Are you up to a [final task]?");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54031 => 1, 54055 => 1)) { #hybrid 3
    quest::summonitem(54032); #gem of heroism
   quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. 'What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.' Stefan turns and places the book carefully in a box covered in protective symbols. 'Thank you very much for all of your assistance. Please rest, I have much work to do informing the League and our city of these developments.");
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54058 => 1, 54060 => 1, 54056 => 1, 54032 => 1)) { #hybrid 4
    quest::summonitem(54039); #glimmering gem
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54038 => 1, 54059 => 1, 54057 => 1, 54061 => 1, 54038 => 1)) { #caster 4
    quest::summonitem(54039); #glimmering gem
    quest::exp(60000);
  } 
  plugin::return_items(\%itemcount);    
}