#Eirod_Haerod.pl
#Part of Charm of the Brotherhood
#While you can complete the main quest for the charm without doing this sub quest at all,
#you cannot do this subquest without the proper items from the main quest. -Kilelen

sub EVENT_SAY{
  if($text=~/Hail/i) {
    quest::say("Hello $name, you are definitely a newcomer to my castle. What brings you before me today? I have some [urgent matters] to attend too.");
  }
  if($text=~/urgent matters/i) {
    quest::say("Well you see, I am in charge of all [documents] here for Castle Mistmoore. I have a very important job and I would like to think that I do it well.");
  }
  if($text=~/documents/i) {
    quest::say("Many documents of war and other not so pleasant matters. I was wondering if you have anything important to say or are you just going to stand here and ask me questions all day. I am waiting for a delivery [from the Indigo Brotherhood].");
  }
  if($text=~/from the Indigo Brotherhood/i) {
    quest::say("I am afraid I don't believe you, anyone sent by the brotherhood would most certainly bear the appropriate symbol. Leave my presence now before I get upset. I will not ask you again.");
  }
  if($text=~/missing/i) {
  	if ($EirodBrother == 1){
  		quest::say("That is terrible indeed, I cannot believe that he is missing. I saw him just a few days ago when he gave me these [war scripts] to review. I haven't got a chance but I do have them here somewhere.");
  	}
  	else{
  		quest::say("I am afraid I don't believe you, anyone sent by the brotherhood would most certainly bear the appropriate symbol. Leave my presence now before I get upset. I will not ask you again.");
  	}
  }
 if($text=~/war scripts/i) {
  	if ($EirodBrother == 1){
  		quest::say("Secret war scripts of course but I would be willing to give them to you after all because Gerod seals them and I have not yet opened the last ones he brought me. I haven't even gotten a chance to open them up myself. If you will bring me 2 Brownie Torsos, I will be more than happy to present you with these documents in hopes that they will assist in the investigation.");
  	}
  	else{
  		quest::say("I am afraid I don't believe you, anyone sent by the brotherhood would most certainly bear the appropriate symbol. Leave my presence now before I get upset. I will not ask you again.");
  	}
  }
}
sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 21972 => 1)) {#Symbol of the Brotherhood
		quest::say("I see you must be trusted by the brotherhood to get this far. Well I would imagine that you are here to deliver [Gerod's] documents are you not? I have heard rumors of him also being [missing], I certainly hope those rumors were unfounded.");
		quest::setglobal("EirodBrother", 1, 0, "F");
	}
	elsif(plugin::check_handin(\%itemcount, 21973 => 2)) {#Brownie Torsos
		if ($EirodBrother == 1){
			quest::say("Well then it seems you are pretty driven on helping the brotherhood find out what has become of Gerod. I commend you on your persistence. Please take these sealed documents back to the brotherhood, I certainly hope that they can aid in the investigation.");
			quest::summonitem(21974);#Sealed War Documents
			quest::delglobal("EirodBrother");
		}
		else{
			quest::say("I don't need this.");
			plugin::return_items(\%itemcount);
			return 1;
		}
	}	
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}