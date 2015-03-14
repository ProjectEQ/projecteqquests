# Necromancer Epic NPC -- Emkel_Kabae

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I am Emkel Kabae, first apprentice to Kazen. If you have a symbol, tell me its name.");
  }
  if($text=~/symbol of the serpent/i) {
    quest::say("There are more reagents to be gathered. The time draws near for our master's ascension. Travel to the lands of Kunark and seek out Ssessthrass. He is a very wise Iksar herbalist helping me in my endeavor to please Master Kazen. Be careful not to insult his speech, or you may end up dead before you serve your purpose to the master. Be sure to show him the symbol as proof or he may consider you dinner.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20643 => 1, 20649 => 1)) {
    quest::emote("says, 'Very good, $name, you have done as the master asked yet again, take this as a reward.' Emkel reaches into his robes and pulls out a small symbol. He holds it out and the tiny symbol floats to your hand.");
    quest::ding();
    quest::exp(500);
    quest::summonitem(20644);
  }
  elsif(plugin::check_handin(\%itemcount, 20650 => 1)) {
    quest::say("'You are truly worthy of studying with our master. Bear this new symbol and contemplate what you wish from life before you let go of it. Ask the master about the symbol of testing and he will explain all. I too was tested by him.' Emkel pulls up his sleeve to show a grievous scar from his wrist to his shoulder.");
    quest::ding();
    quest::exp(1000);
    quest::summonitem(20647);
    quest::say("You must ask the master about the symbol of testing. Do not hand the symbol to him for he may interpret that as a breach of conduct.");
  }
    plugin::return_items(\%itemcount);
}
#END of FILE  Quest by: Solid11  Zone:lakerathe  ID:51047 -- Emkel_Kabae