sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings adventurer. I am Phenic Dionicas, Magistrate of the Loyalist Combine Empire. I hope the [vampyres] did not cause you troubles on your journey here.");
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18330 => 1)) {
    quest::say("I was afraid of this. I do not know how much Halle managed to tell you, but we have had our suspicions about one of the Legionnaires ever since she overheard him talking in his sleep. She was meant to get close to him, I guess she found something out... I should have been more careful! Take this to Governor Markil, it concerns his men and I've no doubt he can handle it. Thank you much for your help.");
    quest::faction(52,50);
    quest::faction( 284, -50);
    quest::faction( 142, -50);
    quest::summonitem(18331); #Sealed Message
  }  
 }
}