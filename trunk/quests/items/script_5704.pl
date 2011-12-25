sub EVENT_SCALE_CALC {
	if(defined $qglobals{bic} && $qglobals{bic} > 17){
		$questitem->SetScale(1);
	}
}