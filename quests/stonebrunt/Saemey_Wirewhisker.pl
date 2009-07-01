sub EVENT_SPAWN {
  my $RandInt = 0;   #Random integer variable
  my $LoopCount = 0; #Loop integer variable
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to Kejek friend. I am the seer of this village for I have been gifted by the spirits with an affinity for their realm. The barrier between the spirit and physical realms is thin in these lands. The heretics know this and must be prevented from committing [atrocities] similar to those that have been committed in the past.");
  }
  if($text=~/atrocities/i) {
    quest::say("Long ago when our noble ancestors the Vah Shir were destroyed by an explosion that devastated the warring Heretic and Erudin armies an evil creature by the name of Tserrina Syl'Tor was attracted to the sudden abundance of new spirits in these lands. Tserrina was capable of capturing these spirits before they were able to cross over beyond the mortal realm and through her dark magic transformed them into a [crystalline shadow] substance.");
  }
  if($text=~/crystalline shadow/i) {
    quest::say("The crystalline shadow substance was used as building blocks for Tserrina's tower on an Island near the frozen lands to the south as well as fashioned into armor and weapons for her mindless servants. Emylie Steelclaws has developed a means to purify the armor and weapons using the special properties of our Kejek forge and a smithy hammer blessed by the Titan Spirits. The purifying process transfers the imprisoned spirits into [soul orbs]. Ask Emylie about the purification process.");
  }
  if($text=~/soul orbs/i) {
    quest::say("I have perfected a ritual that will free the imprisoned spirits within the soul orbs. I simply require some kejek [spirit powder] to scrawl the proper sigils and a soul orb upon which to perform the ceremony. My apprentice will perform the ceremony on fading soul orbs. Simply bring him a fading soul orb and some kejek spirit powder.");
  }
  if($text=~/spirit powder/i) {
    quest::say("The spirit power of which I speak is composed of ground spiritling stones. I will grind some powder for you if you would bring me a Valley Spiritling Stone, a Jungle Spiritling Stone, and a Mountain Spiritling Stone. Collecting the stones does not truly harm the spiritlings for when slain in this realm their essence simply disperses until it eventually reforms into a new spiritling.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6970 => 1, 6971 => 1, 6972 => 1)) { #Valley Spiritling Stone, Jungle Spiritling Stone, Mountain Spiritling Stone
    quest::emote("grinds the spiritling stones in a mortar and pestle with foreign runes scratched into the ceramic. 'This powder will assist in matters concerning the contacting or freeing of spirits.'");
    $RandInt = int(rand(3)) + 1;
    for ($LoopCount = 1; $LoopCount >= $RandInt; $LoopCount++) {
      quest::summonitem(6980); #Kejek Spirit Powder x 1 to 3 (Random)
    }
  }
  elsif(plugin::check_handin(\%itemcount, 6980 => 1, 6977 => 1)) { #Kejek Spirit Powder, Soul Orb
    quest::say("I require a Soul Orb and Kejek Spirit Dust in order to perform the ritual that will free the imprisoned souls.");
    quest::emote("scrawls an arcane symbol on the ground with an odd powder and places the orb in its center. He then begins reciting an incantation and waving his arms over the symbol and orb. Moments later the orb shatters and an apparition appears.");
    quest::summonitem(2576); #Shattered Soul Orb
    #quest::spawn2(quest::chooserandom(XXXX,XXXX,XXXX,XXXX),$x+5, $y+5, $z+5, $h); #Apparitions
    quest::faction(172,10); #Kejek Village
    quest::faction(247,10); #Peace Keepers
    quest::exp(50000);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}