sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Fine day to ye, $name.  Welcome to me shop.  If ye're searchin' fer a [cigar], ye won't be findin' any, more's th' pity.");
	}
	if($text=~/cigar/i){
		quest::say("I was hoping to perfect me creation I was callin' the 'cigar.' but I'm afraid I just couldn't get it right.  To keep from settin' meself on fire, I switched me talents to makin' candles.  I could use help from a person such as yerself.  Ye could [collect the wax] fer me - the candle-makin's.");
	}
	if($text=~/collect the wax/i){
		quest::say("Grreatt!!  Take this wax jarr.  Head to any place ye can find the wee ones they call bixies. I'm afraid ye're going to hafta bash 'em and search to find out if they're carrying any honeycombs.  If they are, then ye can fill the jar with them and combine them, then return the full honeycomb jar to me. I'll be givin' ye a special candle if ye can do that fer me.");
		quest::summonitem(17958);
	}
	if($text=~/any information about the crime/i){
		quest::say("Aye. I happened upon the crime scene, but too late, more's the pity.  I grabbed fer one of the rogues and got only a handful of his shirt.  Before I knew it, I was left holding his sweaty shirt and he was far from the scene.  I called fer the guards and they summoned the shaman.  Methinks one died and one got away in the chase.  I've heard rumors that the leader of [Clan McMannus] has spotted the culprit.  Ye should go to the leader of Clan McMannus and tell him ye're [searching for the fugitive].");
	}
	if($text=~/clan mcmannus/i){
		quest::say("Clan McMannus were instructed by the Council to live far away from Halas.  They now live in the Western Plains of Karana and supply Halas with food and materials from the warmer regions.");
	}
	if($text=~/sweaty shirt/i){
		quest::say("Now, why would ye be wantin' that smelly thing?!!  I no longer have it.  [Tundra Jack] came into me shop and bought it from me.  He says he can wash it good and make a new collar for Iceberg out of it.");
	}
	if($text=~/tundra jack/i){
		quest::say("Well, now, let's see...  His name is Tundra Jack.. me first guess would be that ye might find him on the frozen tundra of Everfrost, eh?"); 
	}
}

sub EVENT_ITEM{
	if (plugin::check_handin(\%itemcount, 12222 =>1 )) {
		quest::say("Great work!! Now I can make more candles! Here ye are, me friend. I call this the Everburn Candle. It has a wee bit o' magic in it. I hope ye like it.");
		quest::summonitem(12220);
		quest::givecash(0,0,0,1);
		quest::exp(250);
		quest::ding();
		quest::faction( 213,3);
		quest::faction( 361,3);
		quest::faction( 294,3);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29030 -- Dok 

