# possible quest text given after the velium shipment quest or from the original
# skyshrine zone before revamp
# 
#sub EVENT_SAY { 
#if($text=~/Hail/i){
#quest::say("Ah. outsiders. I have heard word of your travel here.  Perhaps you #wish to become a friend of the kin?");
#}
#if($text=~/i wish to become a friend of the kin/i){
#quest::say("Good. then you would not mind assisting us with a matter of grave #importance.  We have received news of an alarming sort.  There walks amongst us a #spy of the storm giants. who feeds our every move to them and their accursed #strategist.  For the life of us. we cannot deduce whom the traitor is. however we #have received word from Wenglawks of Kael. an associate of ours. that he has #information concerning this.  For a measly sum of 100 platinum. he has offered to #give us the information to rid ourselves of this traitor.  If you are indeed #friend to the kin. take this note to Wenglawks and rid us of this traitor.");
#quest::summonitem("29068"); }
#}
#END of FILE Zone:skyshrine  ID:114093 -- Sentry_Kale 

# Velium Retreival - Friend of the Kin
#

sub EVENT_SAY {
  if ($faction <= 2) {
    if ($text=~/hail/i) {
      quest::say("Another $race, in the great shrine? Perhaps the times have gotten worse than we had expected -- I wonder if I will need to reactivate my [sentinel] for further use in my stead.");
    }
    if ($text=~/sentinel/i) {
      quest::say("It was not too long ago that I was merely a chunk of walking velium in the eyes of most who traveled through the shrine. However that golem was in fact one of my sentinels used to keep my identity secluded, and took on the tasks that I gave it. However, there has been a problem recently with our supplies, and I have had to take it offline until further notice.");
    }
    if ($text=~/problem/i) {
      quest::say("As you may have noticed, there are a great deal of golems and gargoyles within the shrine that consist of velium. These are our guards and they serve us well, however with extended use of these creatures comes extensive repair needed. It is because of this necessity to keep our sentries and lookouts working well that we require a great deal of velium ore stocked and ready for use. Unfortunately, our supplies have been running thin and we are in need of a new shipment of ore.");
    }
    if ($text=~/supplies/i) {
      quest::say("I may have been wrong in my initial thoughts about your race, $race. You may just prove to be worth my time. Take this note now and find Ungdin. Please hurry and remember to keep this information to yourself.");
      quest::summonitem(1725);
    }
    if (($text=~/i am interested/i) && ($friendofthekin == 1)) {
      quest::say("I'm glad to hear it. You see, we have received news that there is a spy amongst the kin, sending our movements and our defensive strategies to the giants. Every attempt of ours to decipher who the spy is have failed. It seems there is a great protective magic around them preventing us from centering on the source of the espionage. However, we do have a [source] of our own in the city of Kael who passes us information now and again.");
    }
    if (($text=~/source/i) && ($friendofthekin == 1)) {
      quest::say("He is an associate that holds ties to us, for the fact that he believes that the invasion against the kin is a non-profitable, overall bad endeavor. Wenglawks is his name and he has told us that he has information regarding the name of the spy here in the shrine. His price is 100 platinum, paid in full to reveal the spy to us. If you think you're capable of finding out the name of this spy, I have a piece of parchment that will show Wenglawks that you are there for the information.");
    }
    if (($text=~/i am capable/i) && ($friendofthekin == 1)) {
      quest::say("As I expected you would be. Take this note to Wenglawks and return to me when you have some -- any -- information on this spy among us.");
      quest::summonitem(29068);
    }
  }
  else {
    quest::say("You must prove your worth before I will discuss such matters with you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29064 => 1)) {
    quest::say("You've returned, and with the shipment of ore intact! It was wise to send you out on that mission, $name, and I'm glad you did not fail. If you're looking for more assignments to do, I may have something that is just right for you. If you're interested in it, just let me know and we'll talk.");
    quest::summonitem(1727);
    quest::exp(12500);
    quest::givecash(0,0,10,10);
    quest::faction(362,10); #Yelinak
    quest::faction(42,10); #CoV
    quest::faction(189,-30); #Kromzek
    quest::setglobal("friendofthekin",1,0,"D30");
  }
  if (plugin::check_handin(\%itemcount, 29065 => 1) && ($friendofthekin == 1)) {
    quest::say("You have shown us yet again your loyalty to our people. Please accept this token of our gratitude.");
    quest::summonitem(29050);
    quest::exp(32500);
    quest::givecash(0,0,10,10);
    quest::faction(362,10); #Yelinak
    quest::faction(42,10); #CoV
    quest::faction(189,-30); #Kromzek
    quest::delglobal("friendofthekin");
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: skyshrine ID: 114061 NPC: Sentry_Kale

