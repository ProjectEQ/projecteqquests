sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Greetings friend $race! I'm afraid I am quite busy with all the transactions that occur and shipments that come and go from the city but if you have an official request form for some information from our library of records I will gladly assist you.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 31753 => 1)){
		quest::say("So you were sent by the Magistrates of Katta Castellum I see. It isn't very often we get requests for records as old as these.  'Ajar shuffles through several books on a cluttered shelf and a few minutes later procures the records and begins writing down the requested information.'  Here are the names that have been requested by Magistrate Dionicas. You can assure him when you deliver this record that it is quite accurate.");
		quest::ding();
		quest::summonitem(18352); #Old Merchant Records
		quest::exp(1000000);
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:shadowhaven  ID:150258 -- Record_Keeper_Ajar
