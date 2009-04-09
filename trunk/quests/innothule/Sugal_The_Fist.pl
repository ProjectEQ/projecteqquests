sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You're late! Feast of flies, what a weakling you are! We have no time to lose. [No rest] for the strong.");
  }
  if ($text=~/no rest/i) {
    quest::say("You've slept your last easy night, recruit. If you want to stay a common footman, then keep hopping. But if you think you can be elite, if you think you can hack being a commando, then you've come to the [right place]. Welcome to the Guja.");
  }
  if ($text=~/right place/i) {
    quest::say("First things first. You need weapon practice. The army will take anyone who knows how to hold a pointy stick. A Guja, however, must know every means of combat. Go. Find some fights. Return to me when all your skills with blunt, slashing and piercing weapons have been honed to at least 75. Tell me then that you are [truly ready].");
  }
  if ($text=~/truly ready/i) {
    quest::say("Good. That's a foundation we can build on. Now for your first round of training. A Guja must be adept at surviving in all forms of terrain. The swamp is warm, moist and comfortable. But you must learn to [live anywhere].");
  }
  if ($text=~/live anywhere/i) {
    quest::say("Extremes of temperature and humidity are the worst. Deserts, tundra and rocky terrain are our enemies. And so they shall be the first enemies you defeat. Take this pack. Go to Lavastorm, the Northern Desert of Ro, and distant Everfrost. Live in each for a time, taking your food from the land. Bring me back two [different examples] from each area to prove your skill.");
    quest::summonitem(17272);
  }
  if ($text=~/different examples/i) {
    quest::say("From North Ro collect Blackrock Lichen and Dry Eye Weed. From Everfrost collect Ice Blood and Winter Lilly. And finally, from Lavastorm collect Stonefruit and Lava Pears. Combine them into a useful bundle and return once you've learned your way.");
  }
}