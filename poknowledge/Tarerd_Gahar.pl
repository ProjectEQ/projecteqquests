#Tarerd_Gahar.pl
#The Magic Pool



sub EVENT_SAY {
  if($text=~/hail/i) {
    if(quest::istaskactivityactive(13,2)) {
      quest::say("Thanks for contacting me, $name. Your information on this matter has been most useful.");
      $client->Message(7,"The ideal of burial grounds nearby is one that can not be easily overlooked. That's exactly why you were sent to check these areas out. Sadly none of them turned out to be the rumored burial grounds, but there's plenty more land to cover, so you maybe called upon again. You'll be recieving some payment, mostly for your time investment, but partially for the danger involved. Good job.");
    }
    else {
      quest::say("I'm sorry, I have neither the time nor the patience to chat right now.");
    }
  }
  if($text=~/pool/i) {
    quest::say("Oh Tatlan and Wicas sent you did they? I'll tell you what I told them, nothing is free. If you want to know about the pools then I need something [from you] first.");
  }
  if($text=~/from me/i) {
    quest::say("I'm sure it'll be easy for an adventurer as you. I am working on a potion, and I cannot currently travel to gather my last component. If you could bring me the blood of a Sarnak I'd be willing to share what I know.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 22519 => 1)) { #Sarnak Blood
    quest::say("Ahh this is exactly what I was looking for. All the information I've gathered from these pools has come from Myrist. Thiran will give you the book I used as a reference. Give him this note so he knows I sent you.");
    quest::summonitem(15958); #Note From Tarerd
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:poknowledge  ID:202060 -- Tarerd_Gahar