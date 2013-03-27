sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hail, $name! Have ye come to train?  I train all warriors. All Wolves o' the North must be strong warriors and swift as well. Are ye a young wolf, then? If so, maybe ye can [assist Renth] with his wee problem, eh?");
	}
	if($faction < 5) {
		if($text=~/dangerous matter/i){
			quest::say("A murder was done in Halas recently.  A couple were killed by a pair o' rogues fer a mere pouch o' copper.  The shaman gave chase and the main rogue, Paglan, fell beneath an ice floe.  One got away.  We must [hunt the murderer].  Will ye help?"); 
		}
		if($text=~/hunt the murderer/i){
			quest::say("Twas good old Dok whose brother and wife were slain.  Speak with him at his shop.  Ask him if he has [any information about the crime].  Return the head of the murderer and I'll give ye a [Langseax]."); 
		}
		if($text=~/langseax/i){
			quest::say("The Langseax was crafted to be wielded by a warrior only.  Tis a one-handed slashing weapon with great balance to assist the warrior who masters it."); 
		}
	}
	if($faction <= 5) {
		if($text=~/assist/i) {
			quest::say("I was ordered by Kylan O'Danos to personally escort a young warrior sent to fetch the remains of his cousin, Ivan McMannus. I forgot and spent me greater time testing out the fine spirits. Now I must find the courier and the remains. Will ye [search fer the courier]?");
		}
		if($text=~/search fer the courier/i){
			quest::say("Thank ye, $name! Go to Everfrost Peaks and seek out Arnis McLish. Ask him where Megan, the courier, is. Once ye find Megan, would ye ask her where Ivan's remains are? Please go, at once!");
		}
	}
	if($faction == 5) {
		if(($text=~/dangerous matter/i) ||  ($text=~/hunt the murderer/i) || ($text=~/langseax/i)) {
			quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		}
	}
	if($faction > 5) {
		if(($text=~/assist/i) || ($text=~/search fer the courier/i) || ($text=~/dangerous matter/i) ||  ($text=~/hunt the murderer/i) || ($text=~/langseax/i)) {
			quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		}
	}
}

sub EVENT_ITEM {
	if ($faction <= 5){
		if (plugin::check_handin(\%itemcount, 13246 => 1)) {
			quest::say("Good work!! Kylan will never know o' me negligence. I owe ye one, young warrior. Let's call it even with this. Twas found by one of our foraging parties. It is still useful. And... I believe ye can assist with a more [dangerous matter] as well");
			quest::ding();
			quest::summonitem(quest::ChooseRandom(17009, 17001));
			quest::faction( 361, 5);
			quest::faction( 294, 5);
			quest::faction( 213, 5);
			quest::faction( 311, 5);
			quest::exp(2000);
		}
		elsif(plugin::check_handin(\%itemcount, 13249 => 1, 13248 => 1, 13247 => 1, 13233 => 1)) {
			quest::say("Thank ye, $name! I knew ye could do it. It is a sad thing, but at least now he can rest in peace. Here is something for your efforts. If ye are interested, there is a [dangerous matter] that needs to be looked into.");
			quest::ding();
			quest::exp(3000);
			quest::givecash(5,0,0,0);
		}
	}
	if ($faction < 5){
		if(plugin::check_handin(\%itemcount, 12227 => 1)) {
			quest::say("Nice work $name! Basil has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax for your efforts.");
			quest::ding();
			quest::faction( 361, -15);  #shows neg faction hit on live.   possibly to avoid exploits
			quest::faction( 294, -15);
			quest::faction( 213, -15);
			quest::faction( 311, -15);
			quest::exp(10000);
			quest::summonitem(5367);
		} 
		elsif(plugin::check_handin(\%itemcount, 12225 => 1)) {
			quest::say("Nice work $name! Paglan has always been an outcast of sorts. I'm glad to see you were able to stop him. Here is a Langseax of the Wolves for your efforts.");
			quest::ding();
			quest::faction( 361, -20);
			quest::faction( 294, -20);
			quest::faction( 213, -20);
			quest::faction( 311, -20);
			quest::exp(12000);
			quest::summonitem(5368);
		} 
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);			
}

