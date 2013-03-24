#zone: gunthak NPC: a_shipwrecked_hatestorm_sailor (224198)
#Started by Angelox, finished by Kilelen
#Rescue the Shipwrecked Sailor

sub EVENT_SAY { 
	if ($text=~/Hail/i){
  	quest::say("Wot do you want?  I be tired after [big trouble].'  This Troll's speech gives you the impression that he is not the smartest being you have ever dealt with");
  }
	if ($text=~/big trouble/i){
  	quest::say("Me's and me crew come to dock here but a big storm come and smash our ship. I thinks me the only one alive now. Da ship and all [loots] are now gone.");
  }
	if ($text=~/loots/i){
  	quest::say("Da loots from da other ship dat we attacked. Dat ship gone now too becuz of da big storm. ' An almost sly look seems to grow across the troll's scarred face. 'Yous wants da loots? Mebbe me can helps you if you can [help] me?");
  }
	if ($text=~/help/i){
  	quest::say("Now dat I have no ship, methinks dat I will have ta work in da mines agin. Me not want that. Dere be no ale in dere and me luvs da ale. You gets me da [safe passage] to da maynland and mebbe me can tell you more about da loots.");
  }
	if ($text=~/safe passage/i){
  	quest::say("I dunno. Mebbe you can gets me a note dat says me can ride on a ship to da maynland or sumthing.");
  }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55007 => 1)) {#A note of safe passage
    quest::say("Dis be gud. Better not trick me, becuz I get angry and it not good when me get angry. Me saw a lot of da loots come up to da beach. Da troll zombee mens come to da loots and take all. I not fights dem. Date be truble dere.");
    quest::givecash(6,0,0,0);#Everyone agrees that the reward is rather pathetic, only a few coppers.
  }	
  plugin::return_items(\%itemcount);
}#Done