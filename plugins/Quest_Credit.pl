###Usage: plugin::QCreditCheck("Creditname", 0=Player 1=Account 2=Guild);
###This will return the amount of credit in the account specified for "Account-based" credits in a single integer
sub QCreditCheck {
	my $CreditName = $_[0];
	my $AP = $_[1];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $uguild_id = plugin::val('$uguild_id');
	my $qglobals = plugin::var('qglobals');
	my $name = plugin::val('$name');
	my $space = "_";
		if(!$AP){
			$Ident = $name;
		}
		elsif($AP == 1){ #Account
			$Ident = $client->AccountID();
			$space = "_";
		}
		elsif($AP == 2){ #Guild
			$Ident = $uguild_id;
			$space = "_";
		}
			my $CreditAmnt = $qglobals->{"$CreditName$space$Ident"};
			return $CreditAmnt;
			$space = undef;
			$Ident = undef;
}

###Usage: plugin::QCreditWithdraw("Creditname", Amount, 0=Player 1=Account 2=Guild, [1 = Give to Player], [0=Nothing 1=Show Window 2=Show Text 3=Show Both Window/Text]);
sub QCreditWithdraw {
	my $CreditName = $_[0];
	my $AddTo = $_[1];
	my $AP = $_[2];
	my $Window = $_[3];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $class = plugin::val('$class');
	my $uguild_id = plugin::val('$uguild_id');
	#####################################################
	my $qglobals = plugin::var('qglobals');	
	my $space = "_";
		if(!$AP){
			$Ident = $name;
			$accountname = "in your personal credit";
		}
		elsif($AP == 1){ #Account
			$Ident = $client->AccountID();
			$accountname = "in Account ";
			$accountname .= $client->AccountName();
		}
		elsif($AP == 2){ #Guild
			$Ident = $uguild_id;
			$accountname = "in the Guild Account";
		}
		
	my $CreditAmnt = $qglobals->{"$CreditName$space$Ident"};
	$CreditAmnt += $AddTo;
	my $CreditAmnt2 = plugin::commify($CreditAmnt);
	$client->SetGlobal("$CreditName$space$Ident", "$CreditAmnt", 7, 'F');
	$timestamp = localtime(time);
	my $npc_name = $npc->GetCleanName(); 
	my $accountname1 = $client->AccountName();
	QCredit::write("CreditLogs/$name.txt","[$timestamp] : [$name] has given $Cost from account with [$npc_name], this player now has [$CreditAmnt2] in [$accountname]");
	$space = undef;
	$Ident = undef;
	plugin::QCreditStatus("BankCredit", $AP, $Window);
}

###Usage: plugin::QCreditDeposit("Creditname", Cost, 0=Player 1=Account 2=Guild, [1 = Give to Player], [0=Nothing 1=Show Window 2=Show Text 3=Show Both Window/Text]);
###This will take credit from the QGlobal account, if you enable Give to Player with the 4th arguement, it will give Platinum to the player instead of just pulling credit away
sub QCreditDeposit {
	my $CreditName = $_[0];
	my $Cost = $_[1];
	my $AP = $_[2];
	my $GiveToPlayer = $_[3];
	my $Window = $_[4];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $uguild_id = plugin::val('$uguild_id');
	my $accountname = $client->AccountName();
	#####################################################
	my $qglobals = plugin::var('qglobals');
	my $space = "_";
		if(!$AP){
			$Ident = $name;
			$accountname = "in your personal credit";
		}
		elsif($AP == 1){ #Account
			$Ident = $client->AccountID();
			$accountname = "in Account ";
			$accountname .= $client->AccountName();
		}
		elsif($AP == 2){ #Guild
			$Ident = $uguild_id;
			$accountname = "in the Guild Account";
		}
		
		my $CreditAmnt = $qglobals->{"$CreditName$space$Ident"};
		
		if ($CreditAmnt < $Cost){
			$client->Message(315,"Insuffient funds... You need "
				. ($Cost - $CreditAmnt) . " more credit(s).");
		}
		else {
				if($GiveToPlayer == 1){
					QCredit::givecash(0, 0, 0, $Cost);
				}
				
			$CreditAmnt -= $Cost;
			$CreditAmnt2 = plugin::commify($CreditAmnt);
			$client->SetGlobal("$CreditName$space$Ident", "$CreditAmnt", 7, 'F');
			$timestamp = localtime(time);
			my $npc_name = $npc->GetCleanName();
			QCredit::write("CreditLogs/$name.txt","[$timestamp] : [$name] has taken $Cost from account with [$npc_name], this player now has [$CreditAmnt2] in [$accountname]");
			plugin::QCreditStatus("BankCredit", $AP, $Window);
		}
		$space = undef;
		$Ident = undef;
		$accountname = undef;
}

###Usage: plugin::QCreditStatus("Creditname", 0=Player 1=Account 2=Guild, [0=Nothing 1=Show Window 2=Show Text 3=Show Both Window/Text]);
sub QCreditStatus{
	my $CreditName = $_[0];
	my $AP = $_[1];
	my $UseWindow = $_[2]; #Set to 0 or off for no window option
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $space = "_";
	# Import the reference to qglobals - Must use $qglobals->{name} to access them (Thanks Trevius)
	my $ClientCheck = plugin::ClientCheck();
	my $Center = plugin::PWAutoCenter(27, 2);
	my $Break = plugin::PWBreak();
	my $Indent = plugin::PWIndent();
		if(!$AP){
			$Ident = $name;
			$accountname = "$name\'s Account";
		}
		elsif($AP == 1){ #Account
			$Ident = $client->AccountID();
			$accountname = $client->AccountName();
			$accountname .= " - Player Account";
		}
		elsif($AP == 2){ #Guild
			$Ident = $uguild_id;
			$accountname = "Guild Account";
		}
		my $qglobals = plugin::var('qglobals');	
		my $CreditAmnt = $qglobals->{"$CreditName$space$Ident"};
		my $CreditAmnt2 = plugin::commify($CreditAmnt);
		if($UseWindow == 1 || $UseWindow == 3){
			QCredit::popup("Account Balance", "
			<c \"#FFFF66\">Client: </c> $ClientCheck <br>
			<c \"#FFFF66\">Credit Source: </c> $accountname <br>
			<c \"#FFFF66\">Character: </c> $name <br>
			<c \"#FFFF66\">Current Balance: </c><c \"#33FF99\"> $CreditAmnt2 </c><br>");
		}
		if($UseWindow == 2 || $UseWindow == 3){
			$client->Message(315, "You now have $CreditAmnt2 credit in $accountname");
		}
}

return 1;

###Usage: plugin::QCreditAccountCheck("Creditname");
###This will take into account the whole account of the player
sub QCreditAccountCheck {
	my $CreditName = $_[0];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $qglobals = plugin::var('qglobals');	
	my $space = "_";
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	return $CreditAmnt;
}


###Usage: plugin::QCreditPull("Creditname", Cost);
###This will take into account the player specifically
sub QCreditPull {
	my $CreditName = $_[0];
	my $Cost = $_[1];
	my $GiveToPlayer = $_[2];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $class = plugin::val('$class');
	#####################################################
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName"};
	my $ClientID = $client->GetID();
	my $CreditAmnt2 = plugin::commify($CreditAmnt - $Cost);
	if ($CreditAmnt < $Cost){
		$client->Message(315,"Insuffient funds... You need "
			. ($Cost - $CreditAmnt) . " more Platinum pieces.");
	}
	else {
	if($GiveToPlayer == 1){
		quest::givecash(0, 0, 0, $Cost);
	}
		$CreditAmnt -= $Cost;
		$client->SetGlobal("$CreditName$space$accountid", "$CreditAmnt", 5, 'F');
		$client->Message(315,"[Account Balance] [$name] you have $CreditAmnt2 left on [$accountname].");
		plugin::CreditStatusAccountTake("$CreditName", $Cost);
		$timestamp = localtime(time);
		my $npc_name = $npc->GetCleanName(); 
		my $accountname1 = $client->AccountName();
		quest::write("CreditLogs/$name.txt","[$timestamp] : [$name] [$class] [$ulevel] spent $Cost on $npc_name, this player now has [$CreditAmnt2] in [$accountname1]");
	}
}

###Usage: plugin::QCreditAccountPull("Creditname", Cost, [1 = Give to Player]);
###This will take into account the whole account of the player
sub QCreditAccountPull {
	my $CreditName = $_[0];
	my $Cost = $_[1];
	my $GiveToPlayer = $_[2];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $class = plugin::val('$class');
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $space = "_";
	#####################################################
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	my $ClientID = $client->GetID();
	my $CreditAmnt2 = plugin::commify($CreditAmnt - $Cost);
	if ($CreditAmnt < $Cost){
		$client->Message(315,"Insuffient funds... You need "
			. ($Cost - $CreditAmnt) . " more Platinum pieces.");
	}
	else {
	if($GiveToPlayer == 1){
		quest::givecash(0, 0, 0, $Cost);
	}
		$CreditAmnt -= $Cost;
		$client->SetGlobal("$CreditName$space$accountid", "$CreditAmnt", 7, 'F');
		$client->Message(315,"[Account Balance] [$name] you have $CreditAmnt2 left on [$accountname].");
		plugin::CreditStatusAccountTake("$CreditName", $Cost);
		$timestamp = localtime(time);
		my $npc_name = $npc->GetCleanName(); 
		my $accountname1 = $client->AccountName();
		quest::write("CreditLogs/$name.txt","[$timestamp] : [$name] [$class] [$ulevel] spent $Cost on $npc_name, this player now has [$CreditAmnt2] in [$accountname1]");
	}
}

###Usage: plugin::QCreditGive("Creditname", Amount);
###This will take into account the player specifically
sub QCreditGive {
	my $CreditName = $_[0];
	my $AddTo = $_[1];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $class = plugin::val('$class');
	#####################################################
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName"};
	my $CreditAmnt2 = plugin::commify($CreditAmnt + $AddTo);
	my $ClientID = $client->GetID();
	$CreditAmnt += $AddTo;
	$client->SetGlobal("$CreditName$space$accountid", "$CreditAmnt", 5, 'F');
	$client->Message(315,"[Account Balance] [$name] you now have $CreditAmnt2 Platinum credit left on [$accountname].");
	$timestamp = localtime(time);
	my $npc_name = $npc->GetCleanName(); 
	my $accountname1 = $client->AccountName();
	plugin::CreditStatusGive("$CreditName", $AddTo);
	quest::write("CreditLogs/$name.txt","[$timestamp] : [$name] given +  $AddTo using NPC - $npc_name, this player now has [$CreditAmnt2] in [$accountname1]");
}

###Usage: plugin::QCreditAccountGive("Creditname", Amount);
###This will take into account the whole account of the player
sub QCreditAccountGive {
	my $CreditName = $_[0];
	my $AddTo = $_[1];
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $zonesn = plugin::val('$zonesn');
	my $ulevel = plugin::val('$ulevel');
	my $class = plugin::val('$class');
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $space = "_";
	#####################################################
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	my $CreditAmnt2 = plugin::commify($CreditAmnt + $AddTo);
	my $ClientID = $client->GetID();
	$CreditAmnt += $AddTo;
	$client->SetGlobal("$CreditName$space$accountid", "$CreditAmnt", 7, 'F');
	$client->Message(315,"[Account Balance] [$name] you now have $CreditAmnt2 Platinum credit left on [$accountname].");
	$timestamp = localtime(time);
	my $npc_name = $npc->GetCleanName(); 
	my $accountname1 = $client->AccountName();
	plugin::CreditStatusAccountGive("$CreditName", $AddTo);
	quest::write("CreditLogs/$name.txt","[$timestamp] : [$name] given +  $AddTo using NPC - $npc_name, this player now has [$CreditAmnt2] in [$accountname1]");
}
	
sub CreditStatusAccount{
	my $CreditName = $_[0];
	my $TurnOffWindow = $_[1]; #Set to 1 to turn off Window
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $space = "_";
	# Import the reference to qglobals - Must use $qglobals->{name} to access them (Thanks Trevius)
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	my $CreditAmnt2 = plugin::commify($CreditAmnt);
	my $ClientCheck = plugin::ClientCheck();
	my $Center = plugin::PWAutoCenter(27, 2);
	my $Break = plugin::PWBreak();
	my $Indent = plugin::PWIndent();
	my $Logo = plugin::ChatWindowBotaLogo();
	my $Links = plugin::ChatWindowLinks();
		if($UseWindow != 1){
			quest::popup("[Account Balance]", "
			$Logo<br>
			$Center <c \"#FFFF66\">Client: </c> $ClientCheck <br>
			$Center <c \"#FFFF66\">Account: </c> $accountname <br>
			$Center <c \"#FFFF66\">Character: </c>$name <br>
			$Center <c \"#FFFF66\">Remaining Balance: </c><c \"#33FF99\"> $CreditAmnt2 </c><br>
			$Break <br><br>
			<c \"#CC0000\"> $Indent WARNING:  </c> Like <c \"#FFFF66\">Alternative Advancement</c> abilities, sometimes your
			account credit does not synchronize with the server correctly. If you are showing a zero balance, we apologize
			for the inconvenience as it will reappear in time.<br>
			$Links");
		}
}

sub CreditStatusAccountGive{
	my $CreditName = $_[0];
	my $AddTo = $_[1];
	my $TurnOffWindow = $_[2]; #Set to 1 to turn off Window
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $space = "_";
	# Import the reference to qglobals - Must use $qglobals->{name} to access them (Thanks Trevius)
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	my $ClientCheck = plugin::ClientCheck();
	my $Center = plugin::PWAutoCenter(27, 2);
	my $Break = plugin::PWBreak();
	my $Indent = plugin::PWIndent();
	my $Logo = plugin::ChatWindowBotaLogo();
	my $Links = plugin::ChatWindowLinks();
	my $Blue = plugin::PWColor("Light Blue");
	my $AddToo = plugin::commify($AddTo);
	my $CreditAmnt2 = plugin::commify($CreditAmnt + $AddTo);
	my $Plus = "<c \"#99CC00\"> \+ </c>";
		if($UseWindow != 1){
			quest::popup("[Account Balance]","
			$Logo<br>
			$Center <c \"#FFFF66\">Client: </c> $Blue $ClientCheck </c><br>
			$Center <c \"#FFFF66\">Account: </c> $accountname <br>
			$Center <c \"#FFFF66\">Character: </c>$name <br>
			$Center <c \"#FFFF66\">Added to Account: </c> $Plus <c \"#33FF99\"> $AddToo </c> <br>
			$Center <c \"#FFFF66\">Remaining Balance: </c>  <c \"#33FF99\"> $CreditAmnt2 </c><br>
			$Break <br><br>
			<c \"#CC0000\"> $Indent WARNING:  </c> Like <c \"#FFFF66\">Alternative Advancement</c> abilities, sometimes your
			account credit does not synchronize with the server correctly. If you are showing a zero balance, we apologize
			for the inconvenience as it will reappear in time.<br>
			$Links");
		}
}


sub CreditStatusAccountTake{
	my $CreditName = $_[0];
	my $Taken = $_[1];
	my $TurnOffWindow = $_[2]; #Set to 1 to turn off Window
	my $client = plugin::val('$client');
	my $npc = plugin::val('$npc');
	my $name = plugin::val('$name');
	my $accountid = $client->AccountID();
	my $accountname = $client->AccountName();
	my $space = "_";
	# Import the reference to qglobals - Must use $qglobals->{name} to access them (Thanks Trevius)
	my $qglobals = plugin::var('qglobals');	
	my $CreditAmnt = $qglobals->{"$CreditName$space$accountid"};
	my $CreditAmnt2 = plugin::commify($CreditAmnt - $Taken);
	my $Taken2 = plugin::commify($Taken);
	my $ClientCheck = plugin::ClientCheck();
	my $Center = plugin::PWAutoCenter(27, 2);
	my $Red = plugin::PWColor("Red");
	my $Break = plugin::PWBreak();
	my $Indent = plugin::PWIndent();
	my $Blue = plugin::PWColor("Light Blue");
	my $Logo = plugin::ChatWindowBotaLogo();
	my $Links = plugin::ChatWindowLinks();
	my $Minus = "<c \"#CC0000</c> - </c>";
	if($UseWindow != 1){
		quest::popup("[Account Balance]","
		$Logo<br>
		$Center <c \"#FFFF66\">Client: </c> $Blue $ClientCheck </c> <br>
		$Center <c \"#FFFF66\">Account: </c> $accountname <br>
		$Center <c \"#FFFF66\">Character: </c>$name <br>
		$Center <c \"#FFFF66\">Taken from Account: </c> $Minus <c \"#CC0000</c> $Taken2 </c> <br>
		$Center <c \"#FFFF66\">Remaining Balance: </c> <c \"#33FF99\"> $CreditAmnt2 </c> <br>
		$Break <br><br>
		<c \"#CC0000\"> $Indent WARNING:  </c> Like <c \"#FFFF66\">Alternative Advancement</c> abilities, sometimes your
		account credit does not synchronize with the server correctly. If you are showing a zero balance, we apologize
		for the inconvenience as it will reappear in time.<br>
		$Links");
	}
}


return 1;