#Councilwoman_Kerasha.pl
#Essences of Power


sub EVENT_SAY { 
	if($AidEinoDone == 1) {#Can't do the turn in without getting the bowl, so I'm not worried about restricting the turn ins on the flag, just this text and getting the bowl.
		if($text=~/Hail/i){
			quest::say("Greetings $name! It pleases me very much that you were able to help Eino out in his time of need.' Councilwoman Kerasha glances at Eino, 'Tunare only knows what I would do without him at my side. There is another matter at hand that has come to the attention of the council that is beyond even our combined power and requires the aid of a powerful alliance. Would you be willing to aid Tanaan?");
		}
		if($text=~/aid/i){
			quest::say("A rift in this plane at the point of harmony upon which the city of Tanaan is built is crumbling. The other council members do not see it happening for they lack the sight that I possess. Granted it will take time but it is something that must be set to right or our home will fall to waste among the tides of the Planes.' Councilwoman Kerasha's body grows rigid. 'I did not spend my life in defense of this city to watch it crumble to dust! The way to repair the breach is difficult but I feel Tunare will grant me the strength once I have the four essences of power in my grasp.");
		}
		if($text=~/essences of power/i){
			quest::say("The powers that watch over the four elemental planes all guard their respective essence of power. You must defeat each of them in turn and place them all within this sacred bowl. Once I have the combined power of the planes I can begin the ceremony and set the foundation of the city to rights. Thank you for your offer to assist me $name.");
			quest::summonitem(17183);#Sacred Bowl
		}						
	}
	else {
			if($text=~/Hail/i){
			quest::say("Greetings $name.  I am Councilwoman Kerasha. representative of the Selia district.  I provide the voice of nature to the Council of Tanaan.  Woe is the city in any realm that forgets to heed Mother Tunare.  For where else could one draw strength from but the land?");
		}
	}

}
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 16266 => 1)) {#Power of the Planes
    quest::emote("takes the Power from you and hands it to Aid Eino. 'Thank you $name. The energy I must expend to perform such a task is days in the gathering. The city of Tanaan is forever in your debt. Take this, it is but a small token of the gratitude of the city. If it does not suit you, return it to me and I shall give you another reward.'");
    quest::summonitem(32106);#Jade Hoop of Speed
  }
  elsif(plugin::check_handin(\%itemcount, 32106 => 1)) {#Jade Hoop of Speed
  	quest::say("I understand.  Take this, may it serve you well, $name.");
  	quest::summonitem(17209);#Frizznik's Endless Coin Purse
  }
  elsif(plugin::check_handin(\%itemcount, 17209 => 1)) {#Frizznik's Endless Coin Purse
  	quest::say("I understand.  Take this, may it serve you well, $name.");
  	quest::summonitem(32107);#Cord of Invigoration
  }
  elsif(plugin::check_handin(\%itemcount, 32107 => 1)) {#Cord of Invigoration
  	quest::say("I understand.  Take this, may it serve you well, $name.");
  	quest::summonitem(32108);#Mace of the Ancients
  }
  elsif(plugin::check_handin(\%itemcount, 32108 => 1)) {#Mace of the Ancients
  	quest::say("I understand.  Take this, may it serve you well, $name.");
  	quest::summonitem(32109);#Ring of Farsight
  }
  elsif(plugin::check_handin(\%itemcount, 32109 => 1)) {#Ring of Farsight
  	quest::say("I understand.  Take this, may it serve you well, $name.");
  	quest::summonitem(32106);#Jade Hoop of Speed
  }  
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);

    
}#END of FILE Zone:poknowledge  ID:202125 -- Councilwoman_Kerasha

