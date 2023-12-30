#Yes, we follow Live with the misspelling of this NPC. In the Guild Summons text, her name is "Whisperwalker".

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("As rogues of Crescent Reach, the Whisperwalkers live by a different code than most. Our laws bind us to practicing our art for good, not gain. Well, mostly. You might say we rob from those hording ill-gotten gains and give them to the poor. We use our gifts to serve Veeshan and The Six.");
  }
}

sub EVENT_ITEM {
  if (($class eq "Rogue") && (plugin::check_handin(\%itemcount, 58656 => 1))) { #Crescent Reach Guild Summons
    quest::emote("looks from side to side, assessing prying eyes and ears. 'Listen up, $name.  It is true that the Whisperwalkers are bound by a different code than many rogue guilds, but it's hard to practice and improve our skills when we're constantly looking for shady types -- very restricting. So, I won't tell you to go off and start robbing our citizens, but a few, uhm, mistakes can be overlooked.  Take this Whisperwalker tunic. It will help protect you. Take a minute and speak to Innkeeper Fathus and Initiate Dakkan. They will have work for you. Come back when you need training.");
    quest::faction(1129, 100); #Circle of the Crystalwing
    quest::summonitem(58760); #Whisperwalkers Apprentice Tunic*
  }
  plugin::return_items(\%itemcount);
}