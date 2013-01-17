sub EVENT_SPELL_EFFECT_CLIENT
{

$bindx = $client->GetBindX();
$bindy = $client->GetBindY();
$bindz = $client->GetBindZ();
$bindh = $client->GetBindHeading();
$bindzone = $client->GetBindZoneID();

	if(($client->GetClientVersionBit() & 4294967264)!= 0)
	{
		if($bindzone == 344)
		{
			quest::MovePCInstance($bindzone,5,$bindx,$bindy,$bindz,$bindh);
		}
		else 
		{	
			quest::movepc($bindzone,$bindx,$bindy,$bindz,$bindh);
		}
	}
	else
	{
		quest::movepc($bindzone,$bindx,$bindy,$bindz,$bindh);
	}
}