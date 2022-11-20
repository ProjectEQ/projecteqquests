#############
#Quest Name:7 Armor Tasks given by Castlen Drewe
#Author: Domel
#NPCs Involved: 2 [Castlen Drewe(202294) and Audri Deepfacet(202069)]
#Items Involved: 1 Permafrost Crystals(22121)
#################


sub EVENT_SAY 
{   
	if ($text=~ /Hail/i)
	{
		quest::say("Greetings and welcome. I have been compiling reports from all over Norrath! There are many odd jobs to be done by someone like you. Would you be interested in such a [quest]?");  
	}
    if ($text=~ /quest/i)
	{
		my @task_array;
		push(@task_array, 5740);
		
		if(($client->GetClientVersionBit() & 4294967292)!= 0)
		{
			push(@task_array, 5741);
		}
		else
		{
			push(@task_array, 505741);
		}
		push(@task_array, 5738);
		
		if(($client->GetClientVersionBit() & 4294967292)!= 0)
		{
			push(@task_array, 5743);
		}
		else
		{
			push(@task_array, 505743);
		}
		push(@task_array, 5739);
		push(@task_array, 5744);
		push(@task_array, 5742);
		quest::taskselector(@task_array);
	}
}

#END of FILE Zone:poknowledge  ID:202294 -- Castlen_Drewe