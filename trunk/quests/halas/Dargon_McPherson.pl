#############
#Quest Name: "deliver an elixir to young warriors"
#Quest Name: aka "Magic Elixir for the Warriors"
#LAST EDIT: 11/15/11
#Author: Hamarabi, but I didn't write it, I just fixed it and completed the unfinished parts with the help of paaco, mrea, Muuss, and ylosh.
#revised by: robregen
#############

sub EVENT_SAY {
	if($text=~/Hail/i) {
		quest::say("Hail, mighty $name! I assume ye must be a [warrior o' the Wolves]. Why else would ye approach a trainer such as meself, then?");
	}
	if(($text=~/warrior o' the Wolves/i) && ($faction < 5)) {
		quest::say("Aye, 'tis as I thought. I'm glad t' see we've warriors such as yerself amongst the Wolves o' the North. Lately, Kylan's been allowing too many scrawny warriors in, methinks. Nor have they fared well in Everfrrost. Many frreeze to death, ye know... Will ye assist me and [deliver an elixir to young warriors] in Everfrost?");
	}
	if(($text=~/warrior o' the Wolves/i) && ($faction == 5)) {
		quest::say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
	}
	if(($text=~/warrior o' the Wolves/i) && ($faction > 5)) {
		quest::say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
	}
	if(($text=~/deliver an elixir to young warriors/i) && ($faction < 5)) {
		quest::say("Ach, 'tis good o' ye! Take this bottle of elixir to Everfrost Peaks. Find Talin O'Donal. He'll take the first sip, and then instruct ye on who else ye need to find. Do that, and I'll give ye a fine reward when ye return the empty elixir bottle. Good luck, then. Don't die.");
		quest::summonitem("13241");
	}
} 

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13245 => 1)) {
		quest::say("Ye've proven yerself to be a cut above the rest and aided yer fellow warriors, no matter how worthless they were. Ye may take this. It was found in the snow by one of our foraging parties. I hope it can be of use to a warrior like yerself.");
		quest::exp(125);
		quest::givecash(3,0,0,0);
		quest::summonitem(quest::ChooseRandom(2012,17001,10004,10017,1038,10016,13877,2135,7007,8008,10009,13007,5014,13003)); # random low level items
		quest::faction(213,10); # 213 : Faction Merchant's of Halas
		quest::faction(294,10); # 294 : Faction Shaman of Justice
		quest::faction(311,10); # 311 : Faction Steel Warriors
		quest::faction(361,10); # 361 : Faction Wolves of the North
	}
    #do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29055 -- Dargon_McPherson 