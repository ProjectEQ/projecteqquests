# Gleed's Bow
#

sub EVENT_SAY {
  if ($faction <= 4) {
    if ($text=~/hail/i) {
      quest::emote("sighs as he looks down at you. 'I grow tired of this city. I so long for the tundra and lands of the wild.'");
    }
    if ($text=~/lands of the wild/i) {
      quest::say("I enjoy training these animals, don't get me wrong, but the open wastes, where the great animals and dragons roam free are what I crave. Before I came to serve King Tormax, I wandered those wastes, hunting young dragons and elder wurms. The whistle of an arrow from my bow was like sweet music - each slash of my sword a sweet song.");
    }
    if ($text=~/young dragons/i) {
      quest::say("Yes, I hunted true dragons. The younger ones, at least. With my bow I could shoot them from such a distance they would never see what was coming.");
    }
    if ($text=~/bow/i) {
      quest::emote("unslings an intricately carved bow from his back and shows it to you. 'I crafted this bow myself. It was to be a great slayer of wurms and dragons and it was, for a time. Now it goes to waste in the city, far from the beasts I long to slay. Far from the hunt and the excitement.'");
    }
    if ($text=~/waste/i) {
      quest::say("It is such a shame, this bow deserves to be used. If only there were someone who would use it to hunt the beasts - someone to slay them and skin them like they should be.");
    }
    if ($text=~/hunt the beasts/i) {
      quest::say("You will, little one? One such as yourself is a hunter? I did not know your kind had any skill in such things. In fact, I do not believe your kind could hunt a wurm, not without my wonderful bow. I will not simply hand it to a foolish $race. Hunt down some big game before you bother talking to me again. Perhaps if you bring me the tail of the elusive Vluudeen.");
    }
  }
  else {
    quest::say("You need to prove your dedication to our cause before
I can discuss such matters with you.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 4) {
    if (plugin::check_handin(\%itemcount, 25137 => 1)) {
      quest::say("My, you do have a hunters spirit! If you could track down Vluudeen and slay him without the aid of my bow, you must be worthy. Take the bow, huntsman. Use it to slay others of Vluudeen's kind.");
      quest::summonitem(25033);
      quest::exp(35000);
      quest::faction(188,10); #kromrif
      quest::faction(189,10); #kromzek
      quest::faction(42,-30); #CoV
      quest::faction(49,-30); #coldain
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
}

# EOF zone: kael ID: 113127 NPC: Gleed_Dragonhunter

