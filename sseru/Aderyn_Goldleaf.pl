# Jeweled Quiver of the Hand
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am a Ranger of Seru. There are not many that follow our ways within the city, as there is only limited need for us. Tracking is an invaluable tool at times though so our ways continue to be passed on. There is no way that [Katta] Castellium can match our tracking skills. What are you look... ah, I see you are eyeing my quiver. It is the Jeweled Quiver of the Hand. It is given to each ranger that is in the Hand's Ranks. ");
  }
  if ($text=~/katta/i) {
    quest::say("Katta Castellium is a dreary place. To show how vile it is, they have vampyres living within the city! My point though, is that they would easily spot one of us entering their city. You are just right. They would not question one from Norrath. If you with to prove your worth and earn your own Quiver go to Katta. Galren Fuzzytoes is know to us to be a spy, but we can never catch him. Surely it will be easier to find him within his own city. Defeat him, and retrieve any report that he is taking back to their Governors.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29892 => 1)) {
    quest::say("You actually did it? You have done an invaluable service ridding us of that wretched little halfing. You deserve to be a soldier in Seru's army. Take this Quiver with my regard, $name.");
    quest::summonitem(17120);
    quest::faction(96,10); #eye of seru
    quest::faction(139,10); #hand of seru
    quest::faction(142,10); #heart of seru
    quest::faction(284,10); #seru
    quest::faction(141,-30); #haven smugglers
    quest::faction(350,-30); #validus custodus
    quest::faction(206,-30); #magus conlegium
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 159148 NPC: Aderyn_Goldleaf

