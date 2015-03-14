###These are only meant to be used in popup windows!

###AKKADIUS###
###plugin::PWAutoCenter("Text to be centered in popup window", ([Send Character length to window? = 1] [Use AutoCenter based on given character length = 2]));
###If the second arguement is 2, the first arguement has to declare how many characters there are in the line you are presenting. And then it will push the 
###Appropriate amount of spaces. IE plugin::PWAutoCenter(56, 2); for example
sub PWAutoCenter{
	$Cent = $_[0];
	$SendCharLength = $_[1];
			if($SendCharLength != 2){
			$CentLength = length($Cent);
			$IC = (53 - ($CentLength * .80) - 4);
			}
				else{
				$IC = $Cent;
				}
					my $n = 0;
					my $Result = "";
					while ($n < $IC){
					$Result .= "&nbsp;";
					$n++;
					}
	if(!$SendCharLength){
		return "$Result $Cent";
		my $CentLength = 0;
	}
		elsif($SendCharLength == 2){
			return "$Result";
		}
			else{
				return "There are $IC characters in this phrase, use this arguement for Option 2 in Arguement 2";
			}
	my $SendCharLenghth = undef;
	my $CentLenght = undef;
}

###AKKADIUS###
#Sends a break to the popup window
sub PWBreak{
	return "&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;_________________________________<br>";
}

###AKKADIUS###
#Sends an indent
sub PWIndent{
	return "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
}


###AKKADIUS###
#Create a hyperlink
#Usage plugin::PWHyperLink("http://www.google.com", "Google Search it!");
sub PWHyperLink{
	my $HyperLink = $_[0];
	my $HyperLinkMessage = $_[1];
	return "<a href=\"$HyperLink\">$HyperLinkMessage</a>";
}

###AKKADIUS###
###COLORS###
###Usage plugin::PWColor("Color Name");
###You have to declare this as a 'my' object before you put it inside the popup window text
###If no color is defined, this script will output this link in the popup window:
###This contains the list that corresponds to the popup colors plugin::PWColor(); http://www.computerhope.com/htmcolor.htm
sub PWColor{
	my $ColorText = $_[0];
	%PWColor = (
	"Red" => "#FF0000",
	"Turquoise" => "#00FFFF",
	"Light Blue" => "#0000FF",
	"Dark Blue" => "#0000A0",
	"Light Purple" => "#FF0080",
	"Dark Purple" => "#800080",
	"Yellow" => "#FFFF00",
	"Pastel Green" => "#00FF00",
	"Pink" => "#FF00FF",
	"Black" => "#000000",
	"White" => "#FFFFFF",
	"Light Grey" => "#C0C0C0",
	"Dark Grey" => "#808080",
	"Black" => "#000000",
	"Orange" => "#FF8040",
	"Brown" => "#804000",
	"Burgundy" => "#800000",
	"Forest Green" => "#808000",
	"Grass Green" => "#408080",
	"Gray0" => "#150517",
	"Gray18" => "#250517",
	"Gray21" => "#2B1B17",
	"Gray23" => "#302217",
	"Gray24" => "#302226",
	"Gray25" => "#342826",
	"Gray26" => "#34282C",
	"Gray27" => "#382D2C",
	"Gray28" => "#3b3131",
	"Gray29" => "#3E3535",
	"Gray30" => "#413839",
	"Gray31" => "#41383C",
	"Gray32" => "#463E3F",
	"Gray34" => "#4A4344",
	"Gray35" => "#4C4646",
	"Gray36" => "#4E4848",
	"Gray37" => "#504A4B",
	"Gray38" => "#544E4F",
	"Gray39" => "#565051",
	"Gray40" => "#595454",
	"Gray41" => "#5C5858",
	"Gray42" => "#5F5A59",
	"Gray43" => "#625D5D",
	"Gray44" => "#646060",
	"Gray45" => "#666362",
	"Gray46" => "#696565",
	"Gray47" => "#6D6968",
	"Gray48" => "#6E6A6B",
	"Gray49" => "#726E6D",
	"Gray50" => "#747170",
	"Gray" => "#736F6E",
	"Slate Gray4" => "#616D7E",
	"Slate Gray" => "#657383",
	"Light Steel Blue4" => "#646D7E",
	"Light Slate Gray" => "#6D7B8D",
	"Cadet Blue4" => "#4C787E",
	"Dark Slate Gray4" => "#4C7D7E",
	"Thistle4" => "#806D7E",
	"Medium Slate Blue" => "#5E5A80",
	"Medium Purple4" => "#4E387E",
	"Midnight Blue" => "#151B54",
	"Dark Slate Blue" => "#2B3856",
	"Dark Slate Gray" => "#25383C",
	"Dim Gray" => "#463E41",
	"Cornflower Blue" => "#151B8D",
	"Royal Blue4" => "#15317E",
	"Slate Blue4" => "#342D7E",
	"Royal Blue" => "#2B60DE",
	"Royal Blue1" => "#306EFF",
	"Royal Blue2" => "#2B65EC",
	"Royal Blue3" => "#2554C7",
	"Deep Sky Blue" => "#3BB9FF",
	"Deep Sky Blue2" => "#38ACEC",
	"Slate Blue" => "#357EC7",
	"Deep Sky Blue3" => "#3090C7",
	"Deep Sky Blue4" => "#25587E",
	"Dodger Blue" => "#1589FF",
	"Dodger Blue2" => "#157DEC",
	"Dodger Blue3" => "#1569C7",
	"Dodger Blue4" => "#153E7E",
	"Steel Blue4" => "#2B547E",
	"Steel Blue" => "#4863A0",
	"Slate Blue2" => "#6960EC",
	"Violet" => "#8D38C9",
	"Medium Purple3" => "#7A5DC7",
	"Medium Purple" => "#8467D7",
	"Medium Purple2" => "#9172EC",
	"Medium Purple1" => "#9E7BFF",
	"Light Steel Blue" => "#728FCE",
	"Steel Blue3" => "#488AC7",
	"Steel Blue2" => "#56A5EC",
	"Steel Blue1" => "#5CB3FF",
	"Sky Blue3" => "#659EC7",
	"Sky Blue4" => "#41627E",
	"Slate Blue" => "#737CA1",
	"Slate Blue" => "#737CA1",
	"Slate Gray3" => "#98AFC7",
	"Violet Red" => "#F6358A",
	"Violet Red1" => "#F6358A",
	"Violet Red2" => "#E4317F",
	"Deep Pink" => "#F52887",
	"Deep Pink2" => "#E4287C",
	"Deep Pink3" => "#C12267",
	"Deep Pink4" => "#7D053F",
	"Medium Violet Red" => "#CA226B",
	"Violet Red3" => "#C12869",
	"Firebrick" => "#800517",
	"Violet Red4" => "#7D0541",
	"Maroon4" => "#7D0552",
	"Maroon" => "#810541",
	"Maroon3" => "#C12283",
	"Maroon2" => "#E3319D",
	"Maroon1" => "#F535AA",
	"Magenta" => "#FF00FF",
	"Magenta1" => "#F433FF",
	"Magenta2" => "#E238EC",
	"Magenta3" => "#C031C7",
	"Medium Orchid" => "#B048B5",
	"Medium Orchid1" => "#D462FF",
	"Medium Orchid2" => "#C45AEC",
	"Medium Orchid3" => "#A74AC7",
	"Medium Orchid4" => "#6A287E",
	"Purple" => "#8E35EF",
	"Purple1" => "#893BFF",
	"Purple2" => "#7F38EC",
	"Purple3" => "#6C2DC7",
	"Purple4" => "#461B7E",
	"Dark Orchid4" => "#571B7e",
	"Dark Orchid" => "#7D1B7E",
	"Dark Violet" => "#842DCE",
	"Dark Orchid3" => "#8B31C7",
	"Dark Orchid2" => "#A23BEC",
	"Dark Orchid1" => "#B041FF",
	"Plum4" => "#7E587E",
	"Pale Violet Red" => "#D16587",
	"Pale Violet Red1" => "#F778A1",
	"Pale Violet Red2" => "#E56E94",
	"Pale Violet Red3" => "#C25A7C",
	"Pale Violet Red4" => "#7E354D",
	"Plum" => "#B93B8F",
	"Plum1" => "#F9B7FF",
	"Plum2" => "#E6A9EC",
	"Plum3" => "#C38EC7",
	"Thistle" => "#D2B9D3",
	"Thistle3" => "#C6AEC7",
	"Lavender Blush2" => "#EBDDE2",
	"Lavender Blush3" => "#C8BBBE",
	"Thistle2" => "#E9CFEC",
	"Thistle1" => "#FCDFFF",
	"Lavender" => "#E3E4FA",
	"Lavender Blush" => "#FDEEF4",
	"Light Steel Blue1" => "#C6DEFF",
	"Light Blue" => "#ADDFFF",
	"Light Blue1" => "#BDEDFF",
	"Light Cyan" => "#E0FFFF",
	"Slate Gray1" => "#C2DFFF",
	"Slate Gray2" => "#B4CFEC",
	"Light Steel Blue2" => "#B7CEEC",
	"Turquoise1" => "#52F3FF",
	"Cyan" => "#00FFFF",
	"Cyan1" => "#57FEFF",
	"Cyan2" => "#50EBEC",
	"Turquoise2" => "#4EE2EC",
	"Medium Turquoise" => "#48CCCD",
	"Turquoise" => "#43C6DB",
	"Dark Slate Gray1" => "#9AFEFF",
	"Dark Slate Gray2" => "#8EEBEC",
	"Dark Slate Gray3" => "#78c7c7",
	"Cyan3" => "#46C7C7",
	"Turquoise3" => "#43BFC7",
	"Cadet Blue3" => "#77BFC7",
	"Pale Turquoise3" => "#92C7C7",
	"Light Blue2" => "#AFDCEC",
	"Dark Turquoise" => "#3B9C9C",
	"Cyan4" => "#307D7E",
	"Light Sea Green" => "#3EA99F",
	"Light Sky Blue" => "#82CAFA",
	"Light Sky Blue2" => "#A0CFEC",
	"Light Sky Blue3" => "#87AFC7",
	"Sky Blue" => "#82CAFF",
	"Sky Blue2" => "#79BAEC",
	"Light Sky Blue4" => "#566D7E",
	"Sky Blue" => "#6698FF",
	"Light Slate Blue" => "#736AFF",
	"Light Cyan2" => "#CFECEC",
	"Light Cyan3" => "#AFC7C7",
	"Light Cyan4" => "#717D7D",
	"Light Blue3" => "#95B9C7",
	"Light Blue4" => "#5E767E",
	"Pale Turquoise4" => "#5E7D7E",
	"Dark Sea Green4" => "#617C58",
	"Medium Aquamarine" => "#348781",
	"Medium Sea Green" => "#306754",
	"Sea Green" => "#4E8975",
	"Dark Green" => "#254117",
	"Sea Green4" => "#387C44",
	"Forest Green" => "#4E9258",
	"Medium Forest Green" => "#347235",
	"Spring Green4" => "#347C2C",
	"Dark Olive Green4" => "#667C26",
	"Chartreuse4" => "#437C17",
	"Green4" => "#347C17",
	"Medium Spring Green" => "#348017",
	"Spring Green" => "#4AA02C",
	"Lime Green" => "#41A317",
	"Spring Green" => "#4AA02C",
	"Dark Sea Green" => "#8BB381",
	"Dark Sea Green3" => "#99C68E",
	"Green3" => "#4CC417",
	"Chartreuse3" => "#6CC417",
	"Yellow Green" => "#52D017",
	"Spring Green3" => "#4CC552",
	"Sea Green3" => "#54C571",
	"Spring Green2" => "#57E964",
	"Spring Green1" => "#5EFB6E",
	"Sea Green2" => "#64E986",
	"Sea Green1" => "#6AFB92",
	"Dark Sea Green2" => "#B5EAAA",
	"Dark Sea Green1" => "#C3FDB8",
	"Green" => "#00FF00",
	"Lawn Green" => "#87F717",
	"Green1" => "#5FFB17",
	"Green2" => "#59E817",
	"Chartreuse2" => "#7FE817",
	"Chartreuse" => "#8AFB17",
	"Green Yellow" => "#B1FB17",
	"Dark Olive Green1" => "#CCFB5D",
	"Dark Olive Green2" => "#BCE954",
	"Dark Olive Green3" => "#A0C544",
	"Yellow" => "#FFFF00",
	"Yellow1" => "#FFFC17",
	"Khaki1" => "#FFF380",
	"Khaki2" => "#EDE275",
	"Goldenrod" => "#EDDA74",
	"Gold2" => "#EAC117",
	"Gold1" => "#FDD017",
	"Goldenrod1" => "#FBB917",
	"Goldenrod2" => "#E9AB17",
	"Gold" => "#D4A017",
	"Gold3" => "#C7A317",
	"Goldenrod3" => "#C68E17",
	"Dark Goldenrod" => "#AF7817",
	"Khaki" => "#ADA96E",
	"Khaki3" => "#C9BE62",
	"Khaki4" => "#827839",
	"Dark Goldenrod1" => "#FBB117",
	"Dark Goldenrod2" => "#E8A317",
	"Dark Goldenrod3" => "#C58917",
	"Sienna1" => "#F87431",
	"Sienna2" => "#E66C2C",
	"Dark Orange" => "#F88017",
	"Dark Orange1" => "#F87217",
	"Dark Orange2" => "#E56717",
	"Dark Orange3" => "#C35617",
	"Sienna3" => "#C35817",
	"Sienna" => "#8A4117",
	"Sienna4" => "#7E3517",
	"Indian Red4" => "#7E2217",
	"Dark Orange3" => "#7E3117",
	"Salmon4" => "#7E3817",
	"Dark Goldenrod4" => "#7F5217",
	"Gold4" => "#806517",
	"Goldenrod4" => "#805817",
	"Light Salmon4" => "#7F462C",
	"Chocolate" => "#C85A17",
	"Coral3" => "#C34A2C",
	"Coral2" => "#E55B3C",
	"Coral" => "#F76541",
	"Dark Salmon" => "#E18B6B",
	"Salmon1" => "#F88158",
	"Salmon2" => "#E67451",
	"Salmon3" => "#C36241",
	"Light Salmon3" => "#C47451",
	"Light Salmon2" => "#E78A61",
	"Light Salmon" => "#F9966B",
	"Sandy Brown" => "#EE9A4D",
	"Hot Pink" => "#F660AB",
	"Hot Pink1" => "#F665AB",
	"Hot Pink2" => "#E45E9D",
	"Hot Pink3" => "#C25283",
	"Hot Pink4" => "#7D2252",
	"Light Coral" => "#E77471",
	"Indian Red1" => "#F75D59",
	"Indian Red2" => "#E55451",
	"Indian Red3" => "#C24641",
	"Red" => "#FF0000",
	"Red1" => "#F62217",
	"Red2" => "#E41B17",
	"Firebrick1" => "#F62817",
	"Firebrick2" => "#E42217",
	"Firebrick3" => "#C11B17",
	"Pink" => "#FAAFBE",
	"Rosy Brown1" => "#FBBBB9",
	"Rosy Brown2" => "#E8ADAA",
	"Pink2" => "#E7A1B0",
	"Light Pink" => "#FAAFBA",
	"Light Pink1" => "#F9A7B0",
	"Light Pink2" => "#E799A3",
	"Pink3" => "#C48793",
	"Rosy Brown3" => "#C5908E",
	"Rosy Brown" => "#B38481",
	"Light Pink3" => "#C48189",
	"Rosy Brown4" => "#7F5A58",
	"Light Pink4" => "#7F4E52",
	"Pink4" => "#7F525D",
	"Lavender Blush4" => "#817679",
	"Light Goldenrod4" => "#817339",
	"Lemon Chiffon4" => "#827B60",
	"Lemon Chiffon3" => "#C9C299",
	"Light Goldenrod3" => "#C8B560",
	"Light Golden2" => "#ECD672",
	"Light Goldenrod" => "#ECD872",
	"Light Goldenrod1" => "#FFE87C",
	"Lemon Chiffon2" => "#ECE5B6",
	"Lemon Chiffon" => "#FFF8C6",
	"Light Goldenrod Yellow" => "#FAF8CC",
	);
	if($ColorText eq ""){
		return "<a href=\"http://www.computerhope.com/htmcolor.htm\">You have not inserted a color name, you can find them at this link</a>";
	}
	else{
		return "<c \"$PWColor{$ColorText}\">";
	}
}

return 1;