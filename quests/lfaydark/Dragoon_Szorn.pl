#Dragoon_Szorn.pl
#Part of Innoruuk Regent
#Some of this was done already (all the important bits, really).  
#Cleaned up what was there and added a response to quest text -Kilelen


sub EVENT_SAY{
	if($text=~/missing shipment/i) {
		quest::say("Seek out Ennixy and tell her [hate be my guide]. She typically works from her homeland in the steamfont mountains.");
	}
}
sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 19030 => 1)){#Crate of Teir`Dal Provisions
		quest::say("Finally!! We have been in dire need of these supplies for quite some time, $name!  Here is the receipt for the shipment. The last shipment never made it here and there is an item of great importance stored in the lost crate. Before you return to Neriak, your services are needed to retrieve our [missing shipment]. I command your obedience as is my right as a dragoon of Naythox Thex's personal regime.");
		quest::summonitem(19029);#Receipt for Provisions Crate
		quest::givecash(0,0,0,1);
	}
	elsif(plugin::check_handin(\%itemcount, 19028 => 1)){
		quest::say("What is this!! The items of importance have been removed from the crate!! This is most unfortunate. However, you have done well in your service to the Teir'Dal Empire. Take this voucher of services rendered under the command of Naythox Thex back to Ithvol along with the head of that slain Fier'Dal, the receipt for the provisions, and your disciple symbol of Innoruuk.");
		quest::summonitem(12499);#Voucher of Service to Naythox
		quest::givecash(0,0,0,1);
	}
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#END of FILE Zone:lfaydark  ID:57063 -- Dragoon_Szorn 

