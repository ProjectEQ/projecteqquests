#BeginFile: everfrost\Magus_Delin.pl
#
#

sub EVENT_SAY {
	if(plugin::check_hasitem($client, 41000) || $client->KeyRingCheck(41000)) { #Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("You're going to need to have a fair amount of faith in me and my friends.  I make it a policy to tell all of the travelers that come to me that this is not a perfected magic and probably never will be.  The magic we are using is, in my opinion, not of Norrathian origins.  Or perhaps I'm simply an eccentric who hopes there is a greater force out there that is granting us the use of new magics.  Anyway, enough chatter.  Tell me where you would like to go and I will send you there.  I can send you to any of the other camps in [Butcherblock], [Commonlands], [Nedaria's Landing], [North Ro], or [South Ro].  Please be still as I do this.");
		} elsif($text=~/commonlands/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(22,-105,-1640,5,0); #East Commonlands
		} elsif($text=~/butcherblock/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(68,-2500,-1105,1,0); #Butcherblock Mountains
		} elsif($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		} elsif($text=~/north ro/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(34,900,2650,-24,0); #Northern Desert of Ro
		} elsif($text=~/south ro/i) {
			quest::emote("begins to cast a spell.");
			quest::movepc(35,1030,-1440,-23,0); #Southern Desert of Ro
		}
    }
    else { #PC does not have Adventurer's Stone
		if($text=~/hail/i) {
			quest::say("You will have to excuse me, I am quite busy studying this Farstone and the possibility of using the magic stored inside of it.  Perhaps you should talk to another at this camp to see if they have any use for you.  I have enough time to send you to [Nedaria's Landing], if you'd like.");
		} elsif ($text=~/nedaria/i) {
			quest::emote("begins to cast a spell.");
			quest::selfcast(4580); #Teleport Nedaria
		}	
	}  
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

#EndFile: everfrost\Magus_Delin.pl