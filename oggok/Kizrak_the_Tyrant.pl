sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Yes? What do you want?! I have one [purpose] here, to speak with potential heroes that the gods send to me, not to make pointless chit chat with some base, frail mortal I could destroy in less time than it would take for me to unsheathe my weapon.");
  }
  if ($text=~/purpose/i) {
    quest::say("Are you as deaf as you are ugly? I had stated before what my purpose here is, and I will not repeat myself. You apparently know nothing of [Kizrak the Tyrant], nor of my glorious victories and domination among the heroes.");
  }
  if ($text=~/kizrak the tyrant/i) {
    quest::emote("sniffs once, his eyes blazing with impatience as he drums his large fingers on the hilt of the sword at his side. 'I am Kizrak the Tyrant, mighty warrior of Zek, and now champion of the Warlord. Once I brought fear and destruction to any who would stand in the path of the ogre nation, but now, they are all sniveling [fools] who cannot find their backside with both of their hands.");
  }
  if ($text=~/fools/i) {
    quest::say("The ogres, of course! I am not even sure if that is such a fitting name of these monstrous, fleshy bags of stupidity. Before the curse of Zek, the ogres were the strongest of the gods' creations upon Norrath. I am a product of our greatest years of glory, and it was then that I [ascended] to take my place within the Realm of Heroes. I am sure that my lack of third person speech had you a bit confused as to my origins.");
  }
  if ($text=~/ascended/i) {
    quest::say("I led a mighty army for several decades serving the powers of war. My deeds were recognized by The Warlord himself, and in return for my strengthening of his name in battle, I was chosen to walk the Realm of Heroes. Now, I find that I have returned to a nation of slobbering buffoons who have allied with the Teir`Dal, of all creatures. It is almost painful to be subjected to the witnessing of it, but, as The [Warlord commands], it shall be done.");
  }
  if ($text=~/warlord/i) {
    quest::say("My purpose, fool! My purpose is The Warlord's command! I grow tired of you. Bring forth the coin, if of course any god would be so out of their right mind as to bestow such honor to a creature as filthy and devoid of intelligence as yourself, or leave me be before I find a much more painful route to deliver you to the hand of your god."); 
  }
}

sub EVENT_DEATH_COMPLETE {
  my $killer = GetClientByID($killer_id);
  if (defined($qglobals{berserk_epic_pre}) && ($qglobals{berserk_epic_pre} == 3)) { #First kill
    $killer->Message(15, "You feel the rage well up deep inside you. Within moments, your mind becomes cloudy, your judgment impaired, and your actions more fierce with each swing.");
    quest::setglobal("berserker_epic_pre", 4, 5, "F");
  }
  elsif (defined($qglobals{berserk_epic_pre}) && ($qglobals{berserk_epic_pre} == 4)) { #Second kill
    $killer->Message(15, "The rage begins to subside, your thoughts returning to you, and the realization of your actions sets in.");
    quest::setglobal("berserker_epic_pre", 5, 5, "F");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49072 -- Kizrak_the_Tyrant 