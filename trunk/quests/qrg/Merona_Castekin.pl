# NPC: Merona_Castekin
# Zone: Qrg
# By Andrew80k

sub EVENT_SAY {
    if($text =~ /Hail/i) {
	   quest::say("Oh, hello! Welcome to Surefall Glade. Are you planning a trip to Qeynos? If you are, I could use some help finding my [brother].");
    }
    if($text =~ /brother/i) {
	     quest::say("My brother Ronn went to Qeynos several days ago for supplies. He was just going to Sneed's and back. But he hasn't been seen since. I can't leave the Glade because the Sabertooths could attack at any minute. Could you please find out what happened to my brother? Ask Sneed about [Ronn Castekin]");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount,18014=>1)) {
     quest::say("Oh Tunare why!?!? Those foul Bloodsabers will pay for my brother's death!! Here. You have given us valuable information about a new threat to our homes. Take this a token of our appreciation.");
     quest::faction(265,10);
     quest::faction(159,10);
     quest::faction(279,-30);
     quest::faction(135,10);
     quest::exp(1000);
     quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));

  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}