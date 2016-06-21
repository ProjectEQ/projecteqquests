sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello Traveler, I do not see many this deep into the woods.");
  }
  elsif($client->GetGlobal("Fatestealer_shak") ==1 and $text=~/blue orb/i) {
    quest::emote("fishes a hemisphere of cerulean colored metal from his pocket. You must be referring to this? I recovered it from a charred spot of earth shortly after that fateful battle between the armies led by the Child of Hate and Tunare's Chosen. This abhorrent thing radiates evil and is an affront to nature. I must be rid of it, now. Take it! Please find a way to properly dispose of the hemisphere, $name. While you do not necessarily strike me as the trustworthy type, you do appear capable. I can only pray you make the correct choice.");
	quest::summonitem(9464);
  }
  
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20877 => 1)) {
    quest::say("Wow, this is certainly something I have not seen in a long time. It was said that this species of snake had been wiped out due to the poachers and griffins. It was very noble of you to help in saving this species. I will see that these are raised properly. Please wear this icon with pride so other rangers will know of the good deed you have done.");
    quest::faction( 182, 50);
    quest::faction( 265, 50);
    quest::faction( 159, 50);
    quest::faction( 347, 50);
    quest::summonitem(20878);
  }
}