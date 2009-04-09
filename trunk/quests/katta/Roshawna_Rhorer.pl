#  Rakshasa Skulls


sub EVENT_SAY { 

	if($text=~/hail/i){

	quest::say("A pleasure to speak with you! You appear to be a foreigner to Katta Castellum as well. I hope your reasons for visiting this noble city are more leisurely than my own. In addition to my normal duties as a Shar Vahl Emissary to Katta Castellum there is the issue of the [Tormented Vah Shir] in Tenebrous Mountains that must be dealt with."); 

}

	if($text=~/tormented vah shir/i){
	
	quest::say("Recently the skeletons of Vah Shir have been spotted wandering the Tenebrous Mountains ferociously and blindly attacking the living. There are legends among my people that speak of Vah Shir warriors that were murdered dishonorably in their sleep by a traitor allied with [dark spirits]. The spirits of these murdered warriors become trapped in their decaying mortal shells for often many years before they are driven mad by the despair, rage, and torturous experience. When this negative spirit energy becomes strong enough the corpses rise and attempt to slaughter all that crosses their path in their state of eternal rage. Spirits tormented in such a manner must be assisted so that they may finally find peace in death. 
Will you [help the souls] find peace?");

}

	if($text=~/dark spirits/i){
	
	quest::say("Not all spirits that can be called upon by those who are in touch with the spirit realms are of good intentions. There are spirits who seek to destroy and corrupt.These dark spirits are best avoided and kept from manifesting their influence on the mortal realms.Unfortunately the foolish or the weak willed are tempted by their promises of power. Most who deal with the dark spirits are shortly driven mad by the spirits influence or destroyed by the very powers they were promised.  There are tales however of powerful shaman capable of harnessing and controlling the dark spirits and their evil powers of corruption. These wicked traitors to the Vah Shir teachings are called [Rakshasa].");
	
}

	if($text=~/rakshasa/i){
	
	quest::say("Like I said the Rakshasa are spoken of only in old tales. Whether they truly existed or not can not be proven for sure and the elder spiritualist insist they are nothing more than creatures of fiction. If there truly is a Rakshasa alive today it would be a powerful creature indeed. They are said to no longer have a physical body of their own, having traded it to a powerful evil spirit so that it may enter the mortal realm in exchange for dark gifts. Because the Rakshasa no longer has a physical body of its own it must take the forms of other creatures and can not be destroyed with conventional weapons.");

}

	if($text=~/help the souls/i){
	
	quest::say("The only way for a tormented undead Vah Shir to be put to rest is to destroy its body and take its skull to Shar Vahl where our spiritualists can perform a ritual to cleanse and free the imprisoned spirit. Fill this chest with skulls and return it to me and I will make the preparations for it to be sent to Shar Vahl.  The spiritualists there have just recently received word of the situation and will be prepared to perform the proper rituals when the time comes.");

	
	quest::summonitem(17079);  # Runed Iron Bound Chest
	
  }


}
	
	
	
sub EVENT_ITEM {

	if (plugin::check_handin(\%itemcount, 31836 => 1)) {  # Sealed Runed Iron Bound Chest

	quest::emote("purrs an incantation and waves her claws back and forth over the chest.");
    quest::say("You have done a great service for these poor souls. I have sent for a courier to come for the chest of skulls but he is quite late in his arrival.");
	quest::me("The runes inscribed on the chest and iron bands begin to softly glow with a golden light.");
	quest::say("I will keep it safe until the courier arrives.");
	quest::spawn2(160427,480036,0,-60.64,-0.86,4.06,60);  # A Vah Shir courier  ## GRIDID 480036 on mine
	quest::signal(160024,20000); # Centurion Manik
	quest::signal(160288,20000); # Centurion Goran
	quest::signal(160427,700000); # A Vah Shir Courier Depop signal
	quest::faction(132,10); # Guardians of Shar Vahl
	quest::exp(1500);
	quest::ding();
	
}

	elsif (plugin::check_handin(\%itemcount, 31839 => 1)) {  # Resealed Runed Iron Bound Chest
	
	quest::say("It appears this situation is much more dire than we had first presumed. It would be unsafe to send this crate within the walls of Shar Vahl should another innocent be possessed and the tormented Vah Shir be resurrected once more. I shall scribe a note explaining the occurrences for you to deliver along with the crate to Spiritualist Roleko at the Vah Shir outpost in Grimling Forest");
	
	quest::summonitem(31841);  # Roshawna's Report of Occurrences
	quest::summonitem(31839);  # Resealed runed iron bound chest
	quest::faction(132,10); # Guardians of Shar Vahl
	quest::exp(2000);
	quest::ding();
}

}

sub EVENT_SIGNAL {

#	if($signal == 2) { # Signal from the Courier showing up
	
#	quest::say("I hope your journey back to Shar Vahl is less eventful. Please make haste the spiritualists must receive this crate as soon as possible");
#	quest::signalwith(160427,3,10000); # Signal to get the first response back
#	quest::signalwith(160427,4,35000); # Signal to get the Courier to start his run out to the main room
	
#}

#	if($signal == 6) { # Signal from the Courier running out of the room
	
#	quest::shout("Stop him! Stop the courier!");
#	quest::shout("An evil spirit has possessed him!"); 
#	quest::shout("He must not escape with those skulls!");
#	quest::say("Catch him and bring back that crate of skulls!");

#}

#	if($signal == 7) { # Signal from Couriers death

	quest::spawn2(160461,0,0,-4.00,-36.31,4.06,10);  # a_reanimated_vah_shir -N
	quest::spawn2(160461,0,0,-4.00,32.89,4.06,125);  # a_reanimated_vah_shir -S
	quest::spawn2(160461,0,0,-44.76,-0.14,4.06,60);  # a_reanimated_vah_shir -E
	quest::spawn2(160461,0,0,25.63,-2.65,4.06,190);  # a_reanimated_vah_shir -W
	quest::spawn2(160461,0,0,17.85,-25.35,4.06,225);  # a_reanimated_vah_shir -NE
	quest::spawn2(160461,0,0,-35.98,28.26,4.06,90);  # a_reanimated_vah_shir -SW
	quest::spawn2(160461,0,0,19.31,21.24,4.06,160);  # a_reanimated_vah_shir -SE
	quest::spawn2(160461,0,0,-26.56,-24.31,4.06,30);  # a_reanimated_vah_shir -NW
	quest::signal(160461,600000); # Ten minutes to kill the 8 NPCs Might need adjusted

}

#END of FILE Zone:katta  ID:160126 -- Roshawna_Rhorer.pl 