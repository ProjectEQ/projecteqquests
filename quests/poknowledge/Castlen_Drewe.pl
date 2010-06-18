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
		push(@task_array, 130);
		
		if(($client->GetClientVersionBit() & 2147483660)!= 0)
		{
			push(@task_array, 205);
		}
		else
		{
			push(@task_array, 131);
		}
		push(@task_array, 132);
		
		if(($client->GetClientVersionBit() & 2147483660)!= 0)
		{
			push(@task_array, 206);
		}
		else
		{
			push(@task_array, 133);
		}
		push(@task_array, 134);
		push(@task_array, 135);
		push(@task_array, 136);
		quest::taskselector(@task_array);
	}
}

#END of FILE Zone:poknowledge  ID:202294 -- Castlen_Drewe