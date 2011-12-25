sub EVENT_SCALE_CALC {
	if(defined $qglobals{bic} && $qglobals{bic} == 18){
		$questitem->SetScale(1);
	}
}