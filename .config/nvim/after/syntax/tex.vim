syn clear texMathZoneW
syn region texMathZoneW matchgroup=Delimiter start="\\\["           matchgroup=Delimiter    end="\\]\|%stopzone\>"          keepend contains=@texMathZoneGroup
