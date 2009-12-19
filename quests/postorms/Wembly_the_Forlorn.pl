#Wembly_the_Forlorn.pl
#Alternate Access: Plane of Tactics

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::emote("grumbles under his breath, 'Yes, yes, I see you there. No need for you to shout I can see you just fine! Now, what was I saying? Yes that's right... let me know when you are [done].");
	}
	
	if ($text=~/done/i) {
		quest::say("Yes done! Weren't you paying attention? Once you've gathered all the pieces of the [key] bring it to me and I'll put them back together for you.");
	}
	
	if ($text=~/key/i) {
		quest::say("THE Key, you really are as thick skulled as you look. You [agree to help] me and you aren't even paying attention.");
	}
	
	if ($text=~/agree to help/i) {
		quest::say("You agree to help? Great! I haven't even told you what I needed yet, or why. It is very noble of you to offer me your assistance. I've been trapped here for a little too long, I washed up on the shore still [tied to the mast] of my ship. Wonder that I even survived the storm.");
	}
	
	if ($text=~/tied to the mast/i) {
		quest::say("The Diaku Raiders, filthy sort if you ask me. I was out on a shipping run, when Diaku attacked, they pillaged all of my goods, then tied me to the mast and left me floating a sea. Then the storm came and ate my ship, and I woke up here, I swear that I saw some [Diaku] washed up on the shore with me.");
	}
	
	if ($text=~/Diaku/i) {
		quest::say("The Diaku that attacked me! Pay attention for Karana's sake! You appear to be the fighting sort. You can help me kill the Diaku at their source in [Drunder].");
	}
	
	if ($text=~/Drunder/i) {
		quest::say("Drunder! The Fortress of Zek, the Zeks don't trust any one mortal to have free access to the fortress. The Diaku come and go in fours, and four parts are needed for entry. Of course they won't part with them easily. If you find four, and bring me four, I can make the four into one, and with one, you can get into Drunder without three more. Then, with your one, you can kill all of them. I would do it myself, but with my bad knee and all. . .");
	}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 29216 => 1, 29219 => 1, 29218 => 1, 29217 => 1)) {#Quarter of a Diaku Emblem (The top right quarter),  Quarter of a Diaku Emblem (Bottom left quarter), Quarter of a Diaku Emblem (top left quarter),  Quarter of a Diaku Emblem (bottom right quarter)
		quest::say("What's this? Four pieces of a Diaku Emblem? Why ever would you give these to me? Well I think I can get them to fit back together. You know, while you have this, I would be quite happy if you would avenge the loss of my dear ship and kill every Diaku you find? Yes that would be very good indeed. Here is your key, and a key for all your companions as well.");
		# Flag for PoTactics, let player in.  Don't add globals though, this alternate access quest does not count towards PoTime access.
		# It counts for the whole group.
		# Saw something on the eqemu forums that made me think of doing it this way.  Kinda sloppy, but it works.
		#Flag the quest completer explicitly
		$client->SetZoneFlag(214);
		$client->Message(15, "You have received a character flag!");
		#Flag the group
		my $tmpclient = 0;
		for ($i = 0; $i < 2000; $i++) {
			$tmpclient = $entity_list->GetClientByID($i);
			if (defined($tmpclient)) {
				if ($tmpclient->GetGroup()->IsGroupMember($client)) {
					$tmpclient->SetZoneFlag(214);
					$tmpclient->Message(15, "You have received a character flag!");
				}
			}
			undef($tmpclient);
		}
		quest::faction(13, 10);#Askr the Lost
		quest::faction(315, 10);#Storm Guardians
		quest::say("Everyone should be flagged now.");
	}
   
	else {
		plugin::return_items(\%itemcount); #return items if not the ones required
	}
}#END of FILE Zone:postorms ID:210060 --Wembly_the_Forlorn.pl
