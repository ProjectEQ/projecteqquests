sub EVENT_SAY {
 if($text=~/Hail/i) {
   quest::say("Hello, my name is Seana Marsinger. I am here representing my loyalty to the League of Antonican Bards. It matters not to me whether you support the League or loathe it; propaganda is not my objective. Everyone must find their own truths in this life path. So says Quellious. To business then, are you [familiar with the Plane of Hate?]");
 }
 if($text=~/I am familiar with the Plane of Hate/i) {
   quest::say("Good, I need someone that has a bit of an eye for how things should look up there. My brother and I have been studying Innoruuk and his intricate dealings for years. Being raised in New Tanaan may lend us certain neutrality towards all people, yet the values our parents have instilled in us do not allow us to let him go unwatched. In fact, I have begun to believe that my paranoia may prove useful not only to the League, but to the Citizens of Tranquility and New Tanaan itself as well. We have received a simple [piece of intelligence] that may conceivably upset the entire balance of the Pantheon and have most dire repercussions here in Norrath.");
 }
 if($text=~/piece of intelligence/i) {
   quest::say("An old friend of our father's in Qeynos, Jusean Evanesque, has been very busy sorting out the information that is coming to him in droves. The first clue came from Kardin Nillic in Gunthak, and then in bits and pieces from many travelers moving through Qeynos. Piracy on the seas has grown, and somehow the Broken Skull Clan has gained power that should have been out of their grasp. Our informants there say that it can only come from Innoruuk. I am afraid that the Plane itself has shifted with this power. I do not believe that we will be able to uncover all that we need [alone] in time to warn people of the dangers.");
 }
 if($text=~/Alone/i) {
   quest::say("Our parents are back in Qeynos assisting Jusean with all that needs to be verified and ensuring that the League's network contacts are all still viable. They will need to stay there in case we must get the word out quickly. I do not believe that any of the residents of Tanaan would approve of our little quest, and would view it as biased. Thus we are here alone. Does this type of project [interest] you?");
 }
 if(($text=~/interested/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter") || ($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
   quest::say("Please speak to my brother, Stefan, for further information. He will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
   if(($text=~/interested/i) && (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid"))) {
     quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe those that call themselves clerics of hate and spite golems. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover a minor signet that shows you have indeed studied the priests, and truly wish to aid with this cause, bring it to me along with some vampire dust and a diamond. I can craft you protective item and may have some further work for you to do.");
 }
   if(($text=~/interested/i) && (($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
   quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the ghasts, scorn banshees, and haunted chests. They seem to share some qualities of your art and lie in the least dangerous areas. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some sort of minor signet that verifies you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some abhorrent powder and a jacinth. I can craft you protective item and may have some further work for you to do.");
 }
 if(($text=~/work/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter") || ($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
   quest::say("Please speak to my brother, Stefan, for further information. He will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
  if(($text=~/work/i) && (($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
     quest::say("Wonderful. Return to the plane and continue your studies of the tactical demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is a higher echelon of power that I will need to be familiar with. Seek out the Teir`Dal champions and warlords of hate, as well as the agents and assassins. All of these creatures should be within your area of study, but take care! Make sure to keep your protection with you at all times. Some of them should have a kind of soldiers crest symbolizing their rank; bring me this crest and some kiraikuei flesh, along with your Gem of War. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with a final reconnaissance errand.");
 }
   if(($text=~/work/i) && (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid"))) {
     quest::say("Wonderful. Return to the plane and continue your studies of the priestly demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is another echelon of power that I will need to be familiar with. Seek out the vengeance golems, and the higher priests of hate, the vicars, templars, and high priests. Make sure to keep your protection with you at all times. Some of the priests should have a kind of crest symbolizing their rank; bring me this crest and some vengeance dust from the golems, along with your Gem of Faith. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with a final reconnaissance errand.");
 }
 if(($text=~/final task/i) && (($class eq "Wizard") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Enchanter") || ($class eq "Ranger") || ($class eq "Paladin") || ($class eq "Shadowknight") || ($class eq "Beastlord") || ($class eq "Bard"))) {
   quest::say("Please speak to my brother, Stefan, for further information. He will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
   if(($text=~/final task/i) && (($class eq "Warrior") || ($class eq "Rogue") || ($class eq "Monk"))) {
     quest::say("In my personal studies I have heard rumor that there are four archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all four, I am not even certain that they exist. The fabled tomes are the Dissertation of Dark War, Texts on Pain, Writ of Agony, and Tactical Hatred. If they do indeed exist and you manage to find them, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own assassins or guards, and they seldom seem to cease training. It is possible the Prince of Hate himself holds the tomes close. Find me the Dissertation of Dark War; return it to me with your Gem of Contention and your work is finished.");
 }
   if(($text=~/final task/i) && (($class eq "Cleric") || ($class eq "Shaman") || ($class eq "Druid"))) {
     quest::say("in my personal studies I have heard rumor that there are four archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all four, I am not even certain that they exist. The fabled writings are the Tome of Dark Healing, Teachings of Innoruuk, Book of the Dead, and Applications of Suffering. If they do indeed exist and you manage to find them, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own priests, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tomes close. Find me the Tome of Dark Healing; return it to me with your Gem of Piety and your work is finished.");
 }
} 

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54062 => 1, 10053 => 1, 54048 => 1)) { #melee 1
    quest::summonitem(54033); #gem of war
    quest::say("Wonderful! I also have some more [work] for you to do in the plane of hatred if you wish."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54050 => 1, 54049 => 1, 54033 => 1)) { #melee 2
    quest::summonitem(54034); #gem of contention
    quest::say("Splendid work! Should you venture to the Plane of Hatred again, I have a [final task] that needs to be completed."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54051 => 1, 54034 => 1)) { #melee 3
    quest::summonitem(54035); #gem of victory
    quest::say("You are a far greater person than I. I must contact the League at once."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54040 => 1, 16537 => 1, 10037 => 1)) { #priest 1
    quest::summonitem(54027); #gem of faith
    quest::say("Wonderful! I also have some more [work] for you to do in the plane of hatred if you wish."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54042 => 1, 54041 => 1, 54027 => 1)) { #priest 2
    quest::summonitem(54028); #gem of piety
    quest::say("Splendid work! Should you venture to the Plane of Hatred again, I have a [final task] that needs to be completed."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54043 => 1, 54028 => 1)) { #priest 3
    quest::summonitem(54029); #gem of transcendence
    quest::say("You are a far greater person than I. I must contact the League at once."); #need real text
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54035 => 1, 54058 => 1, 54060 => 1, 54056 => 1)) { #melee 4
    quest::summonitem(54039);
    quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54029 => 1, 54059 => 1, 54061 => 1, 54057 => 1)) { #priest 4
    quest::summonitem(54039);
    quest::exp(60000);
  }
  
    quest::say("I have no use for this.");
    plugin::return_items(\%itemcount);
    } 