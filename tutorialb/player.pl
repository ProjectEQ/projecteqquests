sub EVENT_ENTERZONE 
{

	quest::movepc(189,18, -147, 19.6, 0); # Zone: tutorialb

	if(!defined $qglobals{tutbind} && $ulevel == 1) 
	{
		quest::selfcast(2049);
		quest::setglobal("tutbind",1,1,"D30");
	}
	
	if(!defined $qglobals{tutpop}) 
	{
		quest::popup("Join the revolution!", "Welcome to the Revolt! You have been given two new quests:
			<br><br><c \"#FFFF00\">Rally with Rahtiz:</c><br>If you are ready to begin fighting for the revolt, 
			hail Guard Rahtiz and see where you are needed.<br><br><c \"#FFFF00\">Basic Training:</c><br>If you 
			would like more training on the finer points of Everquest, speak with Arias and he will direct you to other knowledgeable 
			members of the slave revolt.<br><br><c \"#F07F00\">Click 'OK' to continue.</c>");
			quest::assigntask(1448);
			quest::assigntask(5166);
			quest::setglobal("tutpop",1,1,"D30");
	}
	
	if($ulevel > 15 && $status < 80)
	{
		$client->Message(15,"You are too high in level to be in this zone.");
		quest::selfcast(2433);
	}  
}


sub EVENT_POPUPRESPONSE { ## color of "Additional Map Features may  need adjusted at later time, I just browsed greens -Drogerin
	if ($popupid == 111) { 
		quest::popup("Maps", "<br><br> <c \"#94f000\"> Additional Map Features </c>  
		<br><br> If you want to show or hide the visibility of floors above or below your current position, you can toggle the <c \"#00c8f0\"> Height Filter </c> button. When this button is activated, locations and items below a distance specified in the \"Low\" field won't be drawn. Likewise, anything above the \"High\" distance won't be drawn.
		<br><br> To show or hide labels on the map, toggle the <c \"#00c8f0\"> Labels </c> button.
		<br><br> If you are in a group and wish to find  members of your group on the map, activate the <c \"#00c8f0\"> Group </c> button. Group members will appear on the map as green <c \"#54f000\"> X</c>'s.");
	}
	if ($popupid == 1) {
		quest::popup("Tradeskills", "<br> If the recipe you wish to create is not already in your list of known recipes, you can <c \"#83f07a\"> Experiment</c>.<br><br>
		When you have open the  <c \"#1b6e14\"> Tradeskill </c> window, click on the <c \"#00c8f0\"> Experiment </c> button. This opens a  new window labeled with the name of the tradeskill container
		in which you are experimenting -- Oven, in this case.<br><br> You can then place your ingredients intot he slots of the <c \"#1b6e14\"> Oven </c> window. For rat steaks, this requires the rat meat
		and the cooking sauce.<br><br> When the ingredients are in the oven, click the <c \"#00c8f0\"> Combine </c> button. The ingredients will be consumed, and you will have a cooked rat steak.
		<br><br><c \"#F07F00\"> Click 'OK' to learn about recipes and skill levels.",2);
	}
	if ($popupid == 2) {
		quest::popup("Tradeskills", "<br> Some tradeskill recipes are more complicated than others, and require you to possess a higher tradeskill level in the tradeskill you are attempting
		to practice.<br><br> If your level is not high enough to attempt a particular recipes, you will likely fail the combine. When this happens, you will often lose some or all of the ingredients
		you used for the combine.<br><br><c \"#F07F00\"> Click 'OK' to learn about different types of tradeskills.",3);
	}
	if ($popupid == 3) {
		quest::popup("Tradeskills", "<br> There are many different type of tradeskills that you can practice, including baking, pottery, fletching, blacksmithing, and weaving. You can create all
		manner of items using these skills.<br><br> To perform the various types of tradeskills, you must use the correct types of tradeskill containers. For example, to perform baking, you need an oven.
		Blacksmithing requires a forge. Pottery requires a kiln. Be on the lookout for different types of tradeskill containers located in the cities throughout Norrath.");
	}
	if ($popupid == 6) {
		quest::popup("Managing Hotbars", "<br> There are multiple ways to adjust and manage your <c \"#83f07a\"> Hotbars:</c><br><br>
		<c \"#1b6e14\">Cycling</c><br>You switch which particular page of the hotbar you are on by using the up and down arrows on the right-side of the bar.<br><br><c \"#1b6e14\">New Hotbars</c><br>
		You can add new Hotbars by using your <c \"#83f07a\"> EQ Menu</c> button, selecting <c \"#83f07a\"> Actions,</c> a nd then choosing option <c \"#83f07a\"> Hotkeys </c> 1-10.<br><br>
		<c \"#F07F00\"> Click 'OK' to learn managing your Hotbars.</c>",7);
	}
	if ($popupid == 7) {
		quest::popup("Assigning Hotkeys", "<br><c \"#83f07a\">Hotkeys</c> are abilities, actions, and macros th at can be activated with a simple click. There are multiple ways to customize your
		<c \"#83f07a\">Hotbar</c> using these buttons:<br><br><c \"#1b6e14\">Drag and Drop</c><br>You can move and set <c \"#83f07a\"> Hotkeys</c> by holding down the left mouse button for a moment, and then
		dragging the icon to the<c \"#83f07a\"> Hotbar.</c> This is especially useful for dragging from your <c \"#83f07a\">Action,</c><c \"#83f07a\"> Alternative Advancement,</c> and <c \"#83f07a\">Spell Gem</c> menus.
		<br><br><c \"#1b6e14\">Right-Click</c><br>You can right-click an empty<c \"#83f07a\"> Hotbar</c> slot and use <c \"#83f07a\">Assigning Social</c> to assign custom made actions. More about those will
		be presented in the next section.<br><br><c \"#F07F00\"> Click 'OK' to learn about custom functions for your Hotbars.</c>",8);
	}
	if ($popupid == 8) {
		quest::popup("Custom Hotkeys", "<br>Dragging existing abilities and assigning default actions is only the first step. You can also create your own <c \"#83f07a\">Hotkeys</c>! You can use
		your <c \"#83f07a\">Action</c> menu to access the <c \"#83f07a\">Socials Page</c>.<br><br><c \"#F07F00\"> Click 'OK' to learn about personalizing your Hotbars.</c>",9);
	}
	if ($popupid == 9) {
		quest::popup("Personalizing the Hotbar", "<br>You can personalize your <c \"#83f07a\">Hotkeys</c> by using the extended right-click menu. Hold down the right mouse button over an
		existing <c \"#83f07a\">Hotkey</c> to see the options:<br><br><c \"#1b6e14\">Activate</c><br>This uses the key as if you had left-clicked on it.<br><br><c \"#1b6e14\">Clear</c><br>This removes the key.
		<br><br><c \"#1b6e14\">Assign Icon</c><br>Select an icon you want from the entire library of Icons.<br><br><c \"#1b6e14\">Clear Icon</c><br>This removes the custom icon.<br><br><c \"#1b6e14\">Assign Label</c><br>
		This changes the text on the key.<br><br><c \"#1b6e14\">Assign Social</c><br>This lets you put a custom ability created on the <c \"#83f07a\">Socials Page</c> into the <c \"#83f07a\">Hotbar</c> directly.<br><br>
		<c \"#1b6e14\">Change Size</c><br>This lets you resize and scale the entire<c \"#83f07a\"> Hotbar.</c><br><br><c \"#1b6e14\">Unmemorize</c><br>This lets you forget a memorized spell. Only works
		on spell gem <c \"#83f07a\">Hotkeys.</c><br><br><c \"#F07F00\"> Click 'OK' to complete the tutorial on  Hotbars.</c>");
		quest::updatetaskactivity(290,1);
	}
	if ($popupid == 10) {
		quest::popup("Swimming", "<br>When underwater, your remaining air is shown in the <c \"#1b6e14\">Air Remaining</c> window. If your air supply runs out, you will begin taking damage.<br><br>
		As your swimming skill increases, so will your air supply and swimming speed. The more time you spend in the water, the better swimmer you will become!");
	}
}	


sub EVENT_TASK_STAGE_COMPLETE 
{
	if ($task_id == 5096)
	{
		quest::ze(15, "A cheer arises from the slaves as the last of the Kobold overseers fall.");
	}
  if ($task_id == 5092 && $activity_id == 1) {
    $client->Message(0,"Vahlara bows as you return. 'Just in time. Many are wounded and more arrive by the hour. If you can find any Gloomingdeep silk, bring it to me and I can reward you with more burlap clothing. It's not much, but it's nicer than the rags these kobolds left us with.'");
  }
} 

sub EVENT_CLICKDOOR {
	my $d_id = ($doorid % 256);
	if($d_id == 11)
	{
		my $s_zone = $client->GetStartZone();
		if($s_zone == 9)
		{
			quest::movepc(9,-60.9,-61.5,-24.9); # Zone: freportw
		}
		elsif($s_zone == 19)
		{
			quest::movepc(19,-98.4,11.5,3.1); # Zone: rivervale
		}
		elsif($s_zone == 24)
		{
			quest::movepc(24,-309.8,109.6,23.1); # Zone: erudnext
		}
		elsif($s_zone == 25)
		{
			quest::movepc(25,-965.3,2434.5,5.6); # Zone: nektulos
		}
		elsif($s_zone == 29)
		{
			quest::movepc(29,12.2,-32.9,3.1); # Zone: halas
		}
                elsif($s_zone == 40)
		{
			quest::movepc(40,156.9,-2.9,31.1); # Zone: neriaka
		}
                elsif($s_zone == 41)
		{
			quest::movepc(41,-499,2.9,-10.9); # Zone: neriakb
		}
                elsif($s_zone == 42)
		{
			quest::movepc(42,-968.9,891.9,-52.8); # Zone: neriakc
		}
		elsif($s_zone == 45)
		{
			quest::movepc(45,-343,189,-38.22); # Zone: qcat
		}
		elsif($s_zone == 49)
		{
			quest::movepc(49,520.1,235.4,59.1); # Zone: oggok
		}
		elsif($s_zone == 50)
		{
			quest::movepc(50,560,-2234,3); # Zone: rathemtn
		}
		elsif($s_zone == 52)
		{
			quest::movepc(52,1.1,14.5,3.1); # Zone: grobb
		}
		elsif($s_zone == 54)
		{
			quest::movepc(54,-197,27,-0.7); # Zone: gfaydark
		}
		elsif($s_zone == 55)
		{
			quest::movepc(55,7.6,489.0,-24.9); # Zone: akanon
		}
		elsif($s_zone == 61)
		{
			quest::movepc(61,26.3,14.9,3.1); # Zone: felwithea
		}
		elsif($s_zone == 68)
		{
			quest::movepc(68,-214.5,2940.1,0.1); # Zone: butcher
		}
		elsif($s_zone == 75)
		{
			quest::movepc(75,200,800,3.39); # Zone: paineel
		}
		elsif($s_zone == 106)
		{
			quest::movepc(106,-415.7,1276.6,3.1); # Zone: cabeast
		}
		elsif($s_zone == 155)
		{
			quest::movepc(155,105.6,-850.8,-190.4); # Zone: sharvahl
		}
		else
		{
			quest::movepc(202,-55,44,-158.81); # Zone: poknowledge
		}
	}
}
