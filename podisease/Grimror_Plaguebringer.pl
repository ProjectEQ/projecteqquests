# Modified by greenbean 04/15/2010
# items: 9290, 9291, 9292, 9293, 9294

sub EVENT_SAY {
	if($text =~ /Hail/i) {
		quest::say("Grimror no have time ta talk. Gots stuffs ta do.");
	}
	if($text =~ /stuffs/i) {
		quest::say("I wuz sent here by Zulort to, err. . . To gadder some alchemy type stuffs. Him have big plan, and need me to travel lots.");
	}
	if($text =~ /big plan/i) {
		quest::emote("laughs. 'Me not tell you dat! Grimror keep secrets secret. You gonna help Grimror or no?'");
	}
	if($text =~ /help Grimror/i) {
		quest::say("Dat good!");
		quest::say("Grimror been getting compon ents for dayz now and Grimror still not finushed. You gonna get dem tings fur me?");
	}
	if($text =~ /dem tings/i) {
		quest::say("Grimror need bile, dat stuff es strong here! But Grimror keent seem to git eet all. Bile comz from da leetle bugs. Keel little bugs, and geeve Grimror dere leetel bodiez and Grimror give yuuz anyting dat yuuz want. Dere on four leetel buggiez dat Grimror still neez, two uf dem come from da fliez, one comez from da wurmiez, and one comez from the moss-skeeterz. Yuuz bring Grimror dere lavas and Grimror geeve yuuz, and yuuz freends, anyting yuuz want");
	}
}


sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 9290 => 1, 9291 => 1, 9292 => 1, 9293 => 1)){
		quest::say("Yuuz dun guud! But Grimror keent geeve you anyting, but Grimror have dis. Grimror also have seekret information. Krypt of Deekay in in here. Dunt tink yuuz wanna go in dere. Dere be mean old rotten keengs in dere, yuuz dunt want ta mess wif dem, dere also be udder sortz uf baddies in dere, be carefuul if yuuz goin dat way. I hurd stories dat Bertoshulus es in dere too, Grimror even saw him in here one time. In dis place yuuz only gots ta worry about Grummus, him fatter dan Grimror, got theek skin too. Him have key ta get inna de Krypt,but Grimror knew da seekret way een. Dat bracer keen make da portil into de Krypt tink dat yuuz belongz dere. Guud barshin!");

		if ( $client->IsGrouped() ) { 		
			$client_group = $client->GetGroup();	    		    	
			$nMembers = $client_group->GroupCount();	 	    	    

			# Summon Bangle of Disease Warding (9294) for client that turned in items
			quest::summonitem(9294); # Item: Bangle of Disease Warding

			# Flag each group member for Crypt of Decay	    		
			for ($i = 0; $i < $nMembers; $i++) {
				$member = $client_group->GetMember($i);    		
				$member_charid = $member->CharacterID();	    		
				quest::targlobal("pop_alt_access_codecay", 1, "F", 0, $member_charid, 0);
				$member->SetZoneFlag(200);
				$member->Message(15,"You receive a character flag!");
			}
		}
	}
}

