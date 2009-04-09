# Rogue Epic NPC -- Malka_Rale



sub EVENT_SAY {

  if($text=~/hail/i) {

    quest::say("Whew! I thought you were one of Hanns' goons. These sewers are a mess, you never know what is going to turn up next. I really wish I could get out of here.");

 }

  if($text=~/i will help/i) {

    quest::say("Ok! I am trusting you. Take this pouch to Vilnius in West Karana. Last word I had from him, he was hanging out near one of the bandit camps. Be careful, since he does not know you. Just give him the pouch, and tell him I was..delayed. While you are doing that, I will be thinking of a way to get out of this slimehole. With any luck, the Circle will learn the pouch is out of Qeynos, and will assume I got away. That means they won't be looking for me here.");

    quest::summonitem(28014);

 }

}



#END of FILE  Quest by: Solid11  Zone:qcat  ID:45095 -- Malka_Rale



