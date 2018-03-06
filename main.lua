-----------------------------------------------------------------------------------------
-- Title: Touch and Drag Objects
-- Name: Dante B
-- Course: ICS3C
-- This program will display images that you can touch and drag across the screen
-----------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local variables
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local yellowGirl = display.newImageRect("Images/yellowGirl.png", 150, 150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local purpleGirl = display.newImageRect("Images/purpleGirl.png", 150, 150)
local purpleGirlWidth = purpleGirl.width
local purpleGirlHeight = purpleGirl.height

-- my boolean varieables to keep track of which object I touched first
local alreadyTouchedYellowGirl = false
local alreadyTouchedPurpleGirl = false

--set the initial x and y position of myImage
yellowGirl.x = 400
yellowGirl.y = 500

purpleGirl.x = 300
purpleGirl.y = 200

-- Function: YellowGirlListener
-- Input: touch listener
-- Output: none
-- Description: when yellow girl is touched, move her
local function YellowGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPurpleGirl == false) then
			alreadyTouchedYellowGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then 
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end

	if (touch.phase == "ended") then
	    alreadyTouchedPurpleGirl = false 
	    alreadyTouchedYellowGirl = false
	end
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)

-- Function: PurpleGirlListener
-- Input: touch listener
-- Output: none
-- Description: when purple girl is touched, move her
local function PurpleGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedPurpleGirl = true
		end
	end

	if ( (touch.phase == "moved") and (alreadyTouchedPurpleGirl == true) ) then 
		purpleGirl.x = touch.x
		purpleGirl.y = touch.y
	end

	if (touch.phase == "ended") then
	    alreadyTouchedYellowGirl = false 
	    alreadyTouchedPurpleGirl = false
	end
end

-- add the respective listeners to each object
purpleGirl:addEventListener("touch", PurpleGirlListener)