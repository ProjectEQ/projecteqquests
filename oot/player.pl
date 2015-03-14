sub EVENT_ENTERZONE {
	if(defined $qglobals{strongbox}) { 
		quest::creategroundobject(13860, -9200, -430, -293, 0, 3000000);
		quest::delglobal("strongbox");
	}
}
