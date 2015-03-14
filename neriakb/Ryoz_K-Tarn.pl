sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hm, I don't recognize you, but perhaps you are one that has come to help me exact [revenge]?");
  }
  if ($text=~/revenge/i) {
    quest::say("Yes, yes! Revenge is what I yearn. I want blood, amphibious blood, in the name of my brother who was killed many moons ago a [slimy swamp dweller]");
  }
  if ($text=~/slimy swamp dweller/i) {
    quest::say("You imbecile! Can you not tell by my words that he was killed by the webbed hands of a [froglok!]");
  }
  if ($text=~/froglok/i) {
    quest::say("The froglok I want to see dead is Dar Strategist Guib, a cherished froglok in that old troll city. He was in an elite troop of frogloks patrolling the Deserts of Ro during the invasion of Grobb. My brother was part of a small unit of Teir'dal tasked with assessing the capabilities of the Guktans for our king and queen. This Guktan discovered my brother's unit and attacked them. Most fled, but my brother was left behind to die. I need to exact my revenge, and I need to [assassinate] this foul froglok.");
  }
  if ($text=~/assassinate/i) {
    quest::say("I don't know. Perhaps you should speak to someone who does things like that for a living, like one of our local assassins. Come back and see me when you have found a way to kill it. Now quit pestering me before I grow angry!");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67001 =>1 )) {
    quest::say("You've done it! I'd thank the gods if I believed in them. Take this stone and it will allow you to travel amongst their ranks as one of them. Once you have infiltrated their city give this poisoned ale to Dar Strategist Guib. When the trolls hear of the strategist's death perhaps we can persuade them to leave our city and reclaim theirs. The stone will only work once so use it wisely. If you somehow make a mistake in using it return it to me and I will imbue it once again.");
    quest::summonitem(67008);
    quest::summonitem(67010);
  }
  if (plugin::check_handin(\%itemcount, 67009 =>1 )) {
    quest::say("EXCELLENT! This is the best news I've received since those dirty trolls moved in. You have done so well, I may have use for you in the future. For now, I will grant you a spell from my personal library.");
    quest::summonitem(67011);
  }
  plugin::return_items(\%itemcount);
}