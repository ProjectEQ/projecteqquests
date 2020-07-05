# Rogue Epic NPC -- Malka_Rale
# items: 28014

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Whew! I thought you were one of Hanns' goons. These sewers are a mess, you never know what is going to turn up next. I really wish I could get out of here.");
  }
  if($text=~/hanns/i) {
    quest::say("Hanns runs the Circle of Unseen Hands. They had an item someone hired me to.. reacquire. I managed to get the item, stealing it right from the heart of the guild hall. The problem is, I had to carve a way out, and left a few extra holes in several of Hanns' people. I have been trapped down here in these stinking catacombs and sewers for too long now, and I do not think I can get out of here without some help.");
  }
  if($text=~/help/i) {
    quest::say("Ok! I am trusting you. Take this pouch to Vilnius in West Karana. Last word I had from him, he was hanging out near one of the bandit camps. Be careful, since he does not know you. Just give him the pouch, and tell him I was..delayed. While you are doing that, I will be thinking of a way to get out of this slimehole. With any luck, the Circle will learn the pouch is out of Qeynos, and will assume I got away. That means they won't be looking for me here.");
    quest::summonitem(28014); # Item: Stanos' Pouch
  }
}
#END of FILE  Quest by: Solid11  Zone:qcat  ID:45095 -- Malka_Rale