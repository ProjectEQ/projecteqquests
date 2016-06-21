function event_say(e)
	if( e.message:findi("hail")) then
		e.self:Emote("shudders, causing bits of mud to drop from her rotting face. Her voice wheezes out like a rotting accordian. BOoOOo. IAm SURe you Did not exPEcT to see ME here...faTe DEMANDS a REmaTCh...YOU cONtinUe to TaUNt ME here. WHaT can HE poSsiBLY offEr that mAkes you BeHave like a LAPdoG? FoR the LAST TIME...wiLL you tell me wHERe to find StANos?");
	elseif(e.message:findi("yes") or e.message:findi("highpass hold")) then			
		e.self:Emote("rejoices, flames of anger dancing in her remaining eye. 'Hur hur . . . eXcELLent. STAnos shall meET his end, and SOON. You, hoWEVer, will not LIVe anoTHeR day. Can'T have you wARnINg him, Now cAN I?");
		eq.spawn2(448200,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); 
		eq.depop();
	end
end