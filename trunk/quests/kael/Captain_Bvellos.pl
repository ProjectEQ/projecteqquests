#Captain_Bvellos.pl
#Bvellos' Bounty, Mask of War

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. I am the captain of the Kael militia. I will be watching those of your kind who have come to Kael Drakkel as mercenaries and bounty hunters. You may have come here to serve king Tormax but Kael is my home and I intend to keep it a safe place for the Kromzek. Keep yourself out of trouble or you will end up in a world of pain.");
  }
  if ($text=~/work/i) {
    quest::say("Are you looking for work, Feninie? I may have a use for one of your kind. I believe that several nobles in this fine city are not all they appear to be. I have suspicions about that filthy Wenglawks. He will do whatever it takes to amass his own wealth. My sources tell me that he may very well be trading with the Coldain, or worse yet, the dragons. If you could find me proof of his underhanded dealings, I would be most pleased.");
  }
  if ($text=~/proof/i) {
    quest::say("The more convincing the proof is, the better. There must be a record of his actions somewhere.");
  }
  if ($text=~/keep safe/i) {
    quest::say("With the influx of mercenaries into Kael Drakkel, I have seen minor crimes increase. I have had to increase my militia patrols. A majority of my militia work longer hours than they did before. There was a time when we only had to watch for the dragons from the sky and the Coldain from the outside. Now we must watch within");
  }
  if ($text=~/mercenaries/i) {
    quest::say("I have several bounties open if you are interested. Bring me the head of a Coldain and I will reward you with a small sum of money and spread the word of your good work. There is also a bounty upon the nefarious Icepaw kobolds who serve the outcast Velketor. I require four of the paws of those little beasts.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 30081 => 1)) {
  	quest::say("Excellent, $name. Here is the bounty as promised.");
    quest::exp(10000);
    quest::givecash(0,0,5,10);
  }
  elsif (plugin::check_handin(\%itemcount, 25301 => 4)) {
  	quest::say("Excellent, $name. Here is the bounty as promised.");
    quest::exp(20000);
    quest::summonitem(quest::ChooseRandom(25077,25084));
  }
  elsif (plugin::check_handin(\%itemcount, 1718 => 1)) {#Wurmscale Scroll 
  	quest::say("This indeed points to Wenglawks being a traitor. If only there were more proof I could take this to the king. Thank you, $name, you have done a great service for Kael. Take this mask as a reward for your service to this city.");
    quest::exp(20000);
    quest::summonitem(25024);#Mask of War
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::faction(188,30); #kromrif
  quest::faction(189,30); #kromzek
  quest::faction(179,30); #tormax
  quest::faction(42,-90); #CoV
}

# EOF zone: kael ID: 113044 NPC: Captain_Bvellos