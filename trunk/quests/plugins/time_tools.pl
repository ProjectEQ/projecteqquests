###Usage: my $EndTime = plugin::GetEndTime("TypeDur", localtime=false);
# Example: GetEndTime("M60");	# Add 60 minutes to the current timestamp and return in unix time
# Example: GetEndTime("H5", 1);	# Add 5 hours to the current timestamp and return in readable local time
# TypeDur is set just like as it is for QGlobals
# S | seconds | "S15" = 15 seconds |
# M | minutes | "M30" = 30 minutes |
# H | hours   | "H12" = 12 hours   |
# D | days    | "D90" = 90 days    |
# Y | years   | "Y5" = 5 years     |
# localtime is an optional field
# If set to 1, it will return a readable date/time stamp, otherwise 0 (default) is unix time

sub GetEndTime {
	# TimeStamp Exmaple: Thu Feb 18 11:52:33 2010
	my @TimeSplit = split(//, $_[0]);
	my $TimeType = $TimeSplit[0];
	my @InDur = split($TimeType, $_[0]);
	my $Duration = $InDur[1];
	my $UseLocal = $_[1];

	my $AddSecs = 0;
	my $AddMins = 0;
	my $AddHours = 0;
	my $AddDays = 0;
	my $AddYears = 0;
			
	if ($TimeType eq "S" || $TimeType eq "s")
	{
		$AddSecs = $Duration;
	}
	elsif ($TimeType eq "M" || $TimeType eq "m")
	{
		$AddMins = $Duration * 60;
	}
	elsif ($TimeType eq "H" || $TimeType eq "h")
	{
		$AddHours = $Duration * 3600;
	}
	elsif ($TimeType eq "D" || $TimeType eq "d")
	{
		$AddDays = $Duration * 86400;
	}
	elsif ($TimeType eq "Y" || $TimeType eq "y")
	{
		$AddYears = $Duration * 31556926;
	}
	else {
		return 0;
		#plugin::Debug("Type is Wrong");
	}
	
	my $NewTime = time + $AddSecs + $AddMins + $AddHours + $AddDays + $AddYears;
	
	if ($UseLocal)
	{
		return localtime($NewTime);
	}
	else
	{
		return $NewTime;
	}
}

###Usage: my $TimeLeft = plugin::GetTimeLeft(UnixTime, ReturnType=0);
# Example: GetTimeLeft(1285623342);	# Check current time against a Unix Timestamp and return secs/mins/hours/days/years remaining
# Example: GetTimeLeft(1285623342, "H");	# Check current time against a Unix Timestamp and return hours remaining
# Returns 0 if no time is left
# ReturnType is one of the following: S seconds, M minutes, H hours, D days, Y years  

sub GetTimeLeft {

	my $InTime = $_[0];
	my $ReturnType = $_[1];
	my $CurTime = time;
	
	if ($InTime - $CurTime <= 0)
	{
		#plugin::Debug("Time is up! In Time $InTime, Current Time $CurTime");
		return 0;
	}

	my $TimeDiff = $InTime - $CurTime;
	my $TimeDiffTotal = $TimeDiff;
	
	my $YearsLeft = 0;
	my $DaysLeft = 0;
	my $HoursLeft = 0;
	my $MinutesLeft = 0;
	my $SecondsLeft = 0;
	
	# Years
	if ($TimeDiff > 31556926)	
	{
		$YearsLeft = int($TimeDiff / 31556926);
		$TimeDiff -= $YearsLeft * 31556926;
	}
	if ($TimeDiff > 86400)
	{
		$DaysLeft = int($TimeDiff / 86400);
		$TimeDiff -= $DaysLeft * 86400;
	}
	if ($TimeDiff > 3600)
	{
		$HoursLeft = int($TimeDiff / 3600);
		$TimeDiff -= $HoursLeft * 3600;
	}
	if ($TimeDiff > 60)
	{
		$MinutesLeft = int($TimeDiff / 60);
		$TimeDiff -= $MinutesLeft * 60;
	}

	$SecondsLeft = $TimeDiff;
	
	my $TimeLeft = 0;
	if (!$ReturnType)
	{
		$TimeLeft = "$SecondsLeft Secs, $MinutesLeft Mins, $HoursLeft Hours, $DaysLeft Days, $YearsLeft Years";
	}
	else
	{
		if ($ReturnType eq "S" || $ReturnType eq "s")
		{
			$TimeLeft = $TimeDiffTotal;
		}
		elsif ($ReturnType eq "M" || $ReturnType eq "m")
		{
			$TimeLeft = int($TimeDiffTotal / 60);
		}
		elsif ($ReturnType eq "H" || $ReturnType eq "h")
		{
			$TimeLeft = int($TimeDiffTotal / 3600);
		}
		elsif ($ReturnType eq "D" || $ReturnType eq "d")
		{
			$TimeLeft = int($TimeDiffTotal / 86400);
		}
		elsif ($ReturnType eq "Y" || $ReturnType eq "y")
		{
			$TimeLeft = int($TimeDiffTotal / 31556926);
		}
		else {
			$TimeLeft = 0;
			#plugin::Debug("Type is Wrong");
		}

	}
	return $TimeLeft;
}