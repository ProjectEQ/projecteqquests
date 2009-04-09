
sub set_data {
#cheap hack to reload our variables
$wage_start = 3;		#minutes before paymeny required.
$wage_rate = 10;	#in platinum
$wage_duration = 30*60;		#in minutes
#spells avaliable: {name, spell_id, cost}
@spells = (
[ "sow", 278, 1 ],
[ "pinzarn", 487, 1 ],
[ "bramble", 517, 1 ],

[ "soc", 220, 5 ],
[ "naltron", 487, 5 ],
[ "bramble", 518, 5 ]

);
}

sub EVENT_SPAWN {
	&set_data;
	my $min = 3;
	quest::settimer("pay$mname", $min*60);
	quest::say("$mname at your service, I need payment within $min minutes.");
#	quest::setglobal("balance", $balance, 2, "H6");
}

sub EVENT_TIMER {
	&set_data;
	if($balance < $wage_rate) {
		quest::say("Goodbye.");
		quest::depop();
		quest::stoptimer("pay$mname");
	} else {
		$balance -= $wage_rate;
		quest::settimer("pay$mname", $wage_duration*60);
		quest::say("Payment received, im yours for another $wage_duration minutes.");
		quest::setglobal("balance", $balance, 2, "H6");
	}
}

sub EVENT_SAY {
	&set_data;
	if(!$balance) {
		$balance = 0;
	}
	
	if($text =~ /bye/i) {
		quest::say("Goodbye.");
		quest::depop();
		quest::stoptimer("pay$mname");
	} elsif($text =~ /follow/i) {
		$npc->SetFollowID($client->GetID());
	} elsif($text =~ /stop/i) {
		$npc->SetFollowID(0);
	} elsif($text =~ /cast ([a-zA-Z0-9]+)/i) {
		my $found = 0;
		my $s;
		foreach $s (@spells) {
			if($s->[0] eq $1) {
				if($balance < $s->[2]) {
					quest::say("You do have not paid me enough to cast that.");
					last;
				}
				$balance -= $s->[2];
				quest::setglobal("balance", $balance, 2, "H6");
				quest::say("Casting spell ".$s->[1]." named ".$s->[0]." for ".$s->[2]." platinum.");
				#have the client self-cast to allow beneficial spells.
				$client->CastSpell($s->[1], $client->GetID());
				$found = 1;
				last;
			}
		}
		if(!$found) {
			quest::say("Unable to find a spell named $1");
		}
	} elsif($text =~ /balance/i) {
		quest::say("You have a balance of $balance platinum avaliable");
	} elsif($text =~ /spells/i) {
		my $s;
		foreach $s (@spells) {
			quest::say("I can cast spell ".$s->[1]." named ".$s->[0]." for ".$s->[2]." platinum.");
		}
	} elsif($text =~ /help/i) {
		quest::say("follow|stop - tell the npc to follow you or stop following you.");
		quest::say("balance - report your balance");
		quest::say("spells - list the spells avaliable for casting");
		quest::say("cast [spellname] - request a spell casting");
		quest::say("bye - tell the npc to go away");
	} else {
		quest::say("I dont understand that, just ask for [help] if you need it.");
	}
}

sub EVENT_ITEM {
	&set_data;
	my $money = ($copper + $silver*10 + $gold*100 + $platinum*1000)/1000;
	$balance = $balance + $money;
	
	quest::say("You have a balance of $balance platinum avaliable");
}


