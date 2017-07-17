###Usage: plugin::RandomSay(chance(1-100), "message1","message2", etc..);

#::: Author: Trevius
#::: Description: Used for random quest::say messages
#::: Usage: plugin::RandomSay(chance(1-100), "message1","message2", etc..);
sub RandomSay {
	my $chance = $_[0];
	my $DoMessage = 0;
	# First roll to see if a message will be sent or not depending on chance
	if ($chance > 0 && $chance <= 100)
	{
		my $RandomNum = plugin::RandomRange(1, 100);
		if ($RandomNum <= $chance)
		{
			$DoMessage = 1;
		}
	}
	# Choose the random message to send and send it
	if ($DoMessage)
	{
		my $count = 1;
		while ($_[$count])
		{
			$count++;
		}
		my $RandMessage = plugin::RandomRange(1, $count);
		quest::say($_[$RandMessage]);
	}
}

#::: Author: Trevius
#::: Description: Used for random quest::emote messages
#::: Usage: plugin::RandomEmote(chance(1-100), "message1","message2", etc..);
sub RandomEmote {
	my $chance = $_[0];
	my $DoMessage = 0;
	# First roll to see if a message will be sent or not depending on chance
	if ($chance > 0 && $chance <= 100)
	{
		my $RandomNum = plugin::RandomRange(1, 100);
		if ($RandomNum <= $chance)
		{
			$DoMessage = 1;
		}
	}
	# Choose the random message to send and send it
	if ($DoMessage)
	{
		my $count = 1;
		while ($_[$count])
		{
			$count++;
		}
		my $RandMessage = plugin::RandomRange(1, $count);
		quest::emote($_[$RandMessage]);
	}
}

#::: Author: Trevius
#::: Description: Used for random emote messages to group
#::: Usage: plugin::RandomGroupEmote(chance(1-100), "message1","message2", etc..);
sub RandomGroupEmote {
	my $npc = plugin::val('$npc');
	my $client = plugin::val('$client');
	my $chance = $_[0];
	my $TextColor = 7;	# Set the Text Color for the Message (this one is WHITE)
	my $DoMessage = 0;
	# First roll to see if a message will be sent or not depending on chance
	if ($chance > 0 && $chance <= 100)
	{
		my $RandomNum = plugin::RandomRange(1, 100);
		if ($RandomNum <= $chance)
		{
			$DoMessage = 1;
		}
	}
	# Choose the random message to send and send it
	if ($DoMessage)
	{
		my $count = 1;
		while ($_[$count])
		{
			$count++;
		}
		my $RandMessage = plugin::RandomRange(1, $count);
		my $MyMessage = $_[$RandMessage];
		
		if($client)	# Verify we got a client
		{
			my $NPCName = $npc->GetCleanName();	# Get the clean name of the NPC sending the message
			my $ClientGroup = $client->GetGroup();	# Check if the client is in a group
			if ($ClientGroup)
			{
				my $GroupID = $ClientGroup->GetID();	# Get the Group ID for this client
				
				my @clientlist = $entity_list->GetClientList();
				foreach $ent (@clientlist)
				{
					$EntGroup = $ent->GetGroup();	# Check all clients for groups
					if ($EntGroup)
					{
						$EntGroupID = $EntGroup->GetID();	#Check the group ID
						if ($EntGroupID  == $GroupID)	# Compare group ID to the original client's group ID
						{	
							$ent->Message($TextColor, "$NPCName $MyMessage"); # Message all members of the group
						}
					}
				}
			}
			else	# No Group, so just emote to this client only
			{
				$client->Message($TextColor, "$NPCName $MyMessage");
			}
		}
	}
}

###Usage: plugin::RandomCloseEmote(chance(1-100), "message1","message2", etc..);
# The idea for this plugin is to make it so you can send a message that can appear differently to the person
# who triggered the message and to nearby players.  Example:
# PlayerA attacks a snake and sees "a snake attacks you!"
# PlayerB is nearby and sees "a snake attacks PlayerA!"

return 1;