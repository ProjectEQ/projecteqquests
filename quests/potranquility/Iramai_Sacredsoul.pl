#Iramai_Sacredsoul.pl
#Alternate Access: Plane of Torment

#I changed this, she should be kneeling, not dead.  Screenshot on Alla's is the source.  -Kilelen
sub EVENT_SPAWN
{
	quest::settimer("try_kneel", 5);
}


sub EVENT_TIMER
{
	if($timer eq "try_kneel")
	{
		$npc->SetAppearance(4);
	}
}

sub EVENT_DEATH
{
	quest::stoptimer("try_kneel");
}

#AA:PoTorment quest begins.
sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Oh, hello. I am sorry, I did not see you approach. I have been giving all of my attention to poor [Phanti] here.");
	}
	
	if ($text=~/Phanti/i) {
		quest::say("A few days ago Phanti started to get very ill, while she was preparing herself for another trip into [Saryrn's domain]. We are not sure exactly was caused her to fall into this malaise, although we do have our [suspicions].");
	}
	
	if ($text=~/suspicions/i) {
		quest::say("Torment, the Plane of Pain. She was doing some research on the denizens there, should you [help] us, I could grant you and your companions entry. The key will not do Phanti any good for quite some time.");
	}
	
	if ($text=~/help/i) {
		quest::say("Recently, the portal from the Plane of Disease has been unusually active. People have been reporting strange sounds from around the portal at night, and a few of our trackers have seen strange, almost rodent like, footprints. Our best guess is that one of the denizens of the Plane of Disease managed to make its way into our plane. If this is true, it may explain the unnaturally quick manifestation of the disease. Perhaps, the bile from one of the rodents will help us learn of the cause, and hopefully a cure.");
	}

}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 29295 => 1, 29302 => 1)) {#Vial of Opaque Fluid, Purified Bubonian Bile
		quest::say("Hmm, it looks like I will need both the cure and the purified bile in order to heal Phanti.");
		quest::say("You've done it! Praise the Tranquil! I can already see Phanti's condition improving. Take these, Phanti is not going to be doing any planar exploration any time soon. She was planning on using them to bring her research party into Torment, make good use of them, and stay safe. Thank you again for your help.");
		quest::summonitem(29213);#Symbol of Torment
		#Flag for potorment
		#Alternate access, flag only, no quest global.
		quest::set_zone_flag(203);
		$client->Message(15, "You have received a character flag!");
		quest::exp(10000);
	}
	
	elsif(plugin::check_handin(\%itemcount, 29315 => 1)) {#Bubonian Bile
		quest::emote("pours the bile into a small flask, there is a puff of green smoke, which turns white as it floats into the sky. 'This is good news. It appears that this is the cause for her disease, but I have neither the tools, nor the knowledge to create a cure. There is rumor of an indigo orc who may prove useful to us in this area, but he is imprisoned in the Plane of Justice. Ask him about rare diseases. He was known to have cured many, prior to his imprisonment.");#
		quest::summonitem(29302);#Purified Bubonian Bile
	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:potranquility ID:203432 --Iramai_Sacredsoul.pl