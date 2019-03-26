sub EVENT_SPAWN {
	quest::spawn2(160447,0,0,-1519,-764,4,402); # NPC: #Rett_Jimmins
	quest::spawn2(160446,28,0,-1378,-694,4,0); # NPC: a_glyph_covered_corpse
	quest::spawn2(160446,29,0,-1699,-682,4,0); # NPC: a_glyph_covered_corpse
}

sub EVENT_COMBAT {
	quest::signal(160447,500); # NPC: #Rett_Jimmins
}

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Bah, this is insane.  We can't go through with this.  Maybe you'd like to pick up some coin, eh? Are you interested?");
	}
	if($text=~/interested/i){
		quest::say("We were supposed to go up to the graveyard and do a bit of digging, if you know what I mean.  There's a fellow that we met up with in a tavern in Shadowhaven that hired us to do this.");
	}
	if($text=~/fellow/i){
		quest::say("He was odd looking, but he seemed normal enough and he paid us half up front.  He said that we'd get the rest when we brought the item back to him.");
	}
	if($text=~/item/i){
		quest::say("We're not sure.  He said that we'd know it when we saw it.  He said to find a grave with a black flower on it and dig it up. Also, we said that we'd need to say a few words before digging.  Just in case it was trapped.  That's the scary part. He wrote the words down for us.");
	}
	if($text=~/words/i){
		quest::say("It just looks like a bunch of gibberish to me.  If you want them, I'll give them to you.  I'll warn you though.  The second that you take the scroll, this is your deal.  We want no part of this mess. Do you want the scroll?");
	}
	if($text=~/scroll/i){
		# quest::summonitem();  -Ale Stained Note- not yet available.
	}
}

