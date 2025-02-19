--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      stratagus.lua - The craft configuration language.
--
--      (c) Copyright 1998-2011 by Lutz Sammer and Pali Rohár
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

-- For documentation see stratagus/doc/scripts/scripts.html
DebugPrint("Stratagus default config file loading ...\n")

-------------------------------------------------------------------------------
--  Version
-------------------------------------------------------------------------------

wargus = {}

Load("scripts/config.lua")

if (wargus.tales == true) then
	wargus.Name = _("Timeless Tales")
	wargus.Homepage = "stratagus.com"
	wargus.Copyright = _("(c) 2012-2015 by The Stratagus Project.")
else
	wargus.Name = _("Wargus")
	wargus.Homepage = "wargus.stratagus.com"
	wargus.Copyright = _("(c) 1998-2015 by The Stratagus Project.")
end

wargus.Version = "2.4"
wargus.Licence = "GPL v2"


-------------------------------------------------------------------------------
--  Config-Part
-------------------------------------------------------------------------------

InitFuncs = {}
function InitFuncs:add(f)
  table.insert(self, f)
end

function InitGameVariables()
  for i=1,table.getn(InitFuncs) do
    InitFuncs[i]()
  end
end

function SetDefaultRaceView()
  SetPlayerData(GetThisPlayer(), "RaceName", "orc")
  UI.NormalFontColor = "yellow"
  UI.ReverseFontColor = "white"
  SetDefaultTextColors(UI.NormalFontColor, UI.ReverseFontColor)
end

function tableindex(tbl, item)
	for i = 1, table.getn(tbl) do
		if tbl[i] == item then
			return i
		end
	end
	return -1
end

AIStrategyTypes = {_("Map Default")}
OldDefineAi = DefineAi
function DefineAi(name, race, class, script)
	if class == "wc2-skirmish" then
		table.insert(AIStrategyTypes, name)
	end
	OldDefineAi(name, race, class, script)
end


DefineBoolFlags("Center", "WoodImprove", "OilImprove")

--  Edit the next sections to get your look and feel.
--  Note, some of those values are overridden by user preferences,
--  see preferences.lua

--  Enter your default title screen.
SetTitleScreens(
  {Image = "videos/logo.ogv"},
  {Image = "videos/gameintro.ogv"},
  {Image = "ui/title.png", Music = "music/Main Menu" .. wargus.music_extension, Timeout = 20}
)

-------------------------------------------------------------------------------
--	Music play list -	Insert your titles here
-------------------------------------------------------------------------------
wargus.playlist = { "music/Main Menu" .. wargus.music_extension }

--  Set the game name. It's used so we can mantain different savegames
--  and setting. Might also be used for multiplayer.
SetGameName("wc2")
SetFullGameName(wargus.Name)

SetMenuRace("orc")

Preference.ShowSightRange = false
Preference.ShowAttackRange = false
Preference.ShowReactionRange = false
Preference.IconsShift = true

--  Enable/disable the short display of the orders after command.
--  FIXME: planned
--(set-order-feedback! #t)
--(set-order-feedback! #f)

-------------------------------------------------------------------------------
--  Game modification

--  Edit this to enable/disable extended features.
--    Currently enables some additional buttons.
wargus.extensions = true
--wargus.extensions = false

--  Edit this to enable/disable the training queues.
SetTrainingQueue(true)
--SetTrainingQueue(false)

--  Edit this to enable/disable building capture.
--SetBuildingCapture(true)
SetBuildingCapture(false)

--  Set forest regeneration speed. (n* seconds, 0 = disabled)
--  (Auf allgemeinen Wunsch eines einzelnen Herrn :)
InitFuncs:add(function()
	SetForestRegeneration(0)
end)
--SetForestRegeneration(5)

--  Edit this to enable/disable the reveal of the attacker.
--SetRevealAttacker(true)
SetRevealAttacker(false)

-------------------------------------------------------------------------------

--  If you prefer fighters are attacking by right clicking empty space
--  uncomment this (you must comment the next).
--  FIXME: this option will be renamed
--RightButtonAttacks()

--  If you prefer fighters are moving by right clicking empty space
--  uncomment this.
--  FIXME: this option will be renamed
RightButtonMoves()

--  Set the name of the missile to use when clicking
SetClickMissile("missile-green-cross")

--  Uncomment next, to reveal the complete map.
--RevealMap()

SetFogOfWarGraphics("tilesets/fogofwar.png")

-------------------------------------------------------------------------------

--  Define default resources

-- FIXME: Must be removed: Use and write (define-resource)
--
--  (define-resource 'gold 'name "Gold"
--    'start-resource-default 2000
--    'start-resource-low 2000
--    'start-resource-medium 5000
--    'start-resource-high 10000
--    'income 100)
--  FIXME: Must describe how geting resources work.
--

DefineDefaultIncomes(
  0, 100, 100, 100, 100, 100, 100)

DefineDefaultActions(
  _("stop"), _("mine"), _("chop"), _("drill"), _("mine"), _("mine"), _("mine"))

ResourcesOnUI =  {_("Time Left: "), _("Gold Left: "), _("Wood Left: "), _("Oil Left: "), _("Ore Left: "), _("Stone Left: "), _("Coal Left: ")}
DefineDefaultResourceNames(
  _("time"), _("gold"), _("wood"), _("oil"), _("ore"), _("stone"), _("coal"))

DefineDefaultResourceAmounts(
  "gold", 100000,
  "oil", 50000)

DefineDefaultResourceMaxAmounts(-1, -1, -1, -1, -1, -1, -1)

-------------------------------------------------------------------------------

DefinePlayerColorIndex(208, 4)

DefinePlayerColors({
  "red", {{164, 0, 0}, {124, 0, 0}, {92, 4, 0}, {68, 4, 0}},
  "blue", {{12, 72, 204}, {4, 40, 160}, {0, 20, 116}, {0, 4, 76}},
  "green", {{44, 180, 148}, {20, 132, 92}, {4, 84, 44}, {0, 40, 12}},
  "violet", {{152, 72, 176}, {116, 44, 132}, {80, 24, 88}, {44, 8, 44}},
  "orange", {{248, 140, 20}, {200, 96, 16}, {152, 60, 16}, {108, 32, 12}},
  "black", {{40, 40, 60}, {28, 28, 44}, {20, 20, 32}, {12, 12, 20}},
  "white", {{224, 224, 224}, {152, 152, 180}, {84, 84, 128}, {36, 40, 76}},
  "yellow", {{252, 252, 72}, {228, 204, 40}, {204, 160, 16}, {180, 116, 0}},
  "red", {{164, 0, 0}, {124, 0, 0}, {92, 4, 0}, {68, 4, 0}},
  "blue", {{12, 72, 204}, {4, 40, 160}, {0, 20, 116}, {0, 4, 76}},
  "green", {{44, 180, 148}, {20, 132, 92}, {4, 84, 44}, {0, 40, 12}},
  "violet", {{152, 72, 176}, {116, 44, 132}, {80, 24, 88}, {44, 8, 44}},
  "orange", {{248, 140, 20}, {200, 96, 16}, {152, 60, 16}, {108, 32, 12}},
  "black", {{40, 40, 60}, {28, 28, 44}, {20, 20, 32}, {12, 12, 20}},
  "white", {{224, 224, 224}, {152, 152, 180}, {84, 84, 128}, {36, 40, 76}},
  "yellow", {{252, 252, 72}, {228, 204, 40}, {204, 160, 16}, {180, 116, 0}},
})

-------------------------------------------------------------------------------

--  Edit next to increase the speed, for debugging.

--  Decrease the mining time by this factor.
--SetSpeedResourcesHarvest("gold", 10)
--  Decrease the time in a gold deposit by this factor.
--SetSpeedResourcesReturn("gold", 10)
--  Decrease the time for chopping a tree by this factor.
--SetSpeedResourcesHarvest("wood", 10)
--  Decrease the time in a wood deposit by this factor.
--SetSpeedResourcesReturn("wood", 10)
--  Decrease the time for haul oil by this factor.
--SetSpeedResourcesHarvest("oil", 10)
--  Decrease the time in an oil deposit by this factor.
--SetSpeedResourcesReturn("oil", 10)
--  Decrease the time to build a unit by this factor.
--SetSpeedBuild(10)
--  Decrease the time to train a unit by this factor.
--SetSpeedTrain(10)
--  Decrease the time to upgrade a unit by this factor.
--SetSpeedUpgrade(10)
--  Decrease the time to research by this factor.
--SetSpeedResearch(10)

--  You can do all the above with this
InitFuncs:add(function()
  SetSpeeds(1)
end)

-------------------------------------------------------------------------------

AStar("fixed-unit-cost", 1000, "moving-unit-cost", 20, "know-unseen-terrain", "unseen-terrain-cost", 2)

-------------------------------------------------------------------------------

--  Maximum number of selectable units
SetMaxSelectable(18)

--  All player food unit limit
SetAllPlayersUnitLimit(200)
--  All player building limit
SetAllPlayersBuildingLimit(200)
--  All player total unit limit
SetAllPlayersTotalUnitLimit(400)

-------------------------------------------------------------------------------
--  Default triggers for single player
--    (FIXME: must be combined with game types)

OldActionDefeat = ActionDefeat
function ActionDefeat()
	FastForwardCycle = 0
	local confirm = WarGameMenu(panel(4))

	confirm:resize(288,128)

	confirm:addLabel(_("You failed to"), 288 / 2, 22)
	confirm:addLabel(_("achieve victory!"), 288 / 2, 44)

  confirm:addFullButton("~!Ok", "o", (288 - 224 ) / 2, 128 - 27 - 10,
    function()
        confirm:stop()
        OldActionDefeat()
    end)
  SetGamePaused(true)
  confirm:run(false)
end

OldActionVictory = ActionVictory
function ActionVictory()
	FastForwardCycle = 0
	local confirm = WarGameMenu(panel(4))

	confirm:resize(288,128)

	confirm:addLabel(_("Congratulations!"), 288 / 2, 20)
	confirm:addLabel(_("You are victorious!"), 288 / 2, 40)

  confirm:addFullButton(_("Save Game (~<F11~>)"), "f11", (288 - 224 ) / 2, 128 - 2 * 27 - 2 * 8,
    function()
		RunSaveMenu(true)
        confirm:stop()
        OldActionVictory()
    end)
  confirm:addFullButton(_("~!Victory"), "v", (288 - 224 ) / 2, 128 - 27 - 8,
    function()
        confirm:stop()
        OldActionVictory()
    end)
  SetGamePaused(true)
  confirm:run(false)
end

function SinglePlayerTriggers()
  AddTrigger(
    function() return GetPlayerData(GetThisPlayer(), "TotalNumUnits") == 0 end,
    function() return ActionDefeat() end)

  AddTrigger(
    function() return GetNumOpponents(GetThisPlayer()) == 0 end,
    function() return ActionVictory() end)
end

-------------------------------------------------------------------------------
--  Tables-Part
-------------------------------------------------------------------------------

local function CompleteMissingValues(table, defaultTable)
 for key, defaultValue in pairs(defaultTable) do
  if table[key] == nil then table[key] = defaultValue end
 end
end

wc2 = {preferences = {}}
Load("preferences.lua")
local defaultPreferences = {
	CampaignBestScores = {},
	CampaignProgress = {},
	DeselectInMine = false,
	DoubleClickDelayInMs = 300,     --  For the wanted double-click delay (in ms).
	EffectsEnabled = true,
	EffectsVolume = 128,
	EnableKeyboardScrolling = true, --  Enable/disable keyboard scrolling.
	EnableMouseScrolling = true,    --  Enable/disable mouse scrolling.
	EnhancedEffects = true,
	FogOfWar = true,
	FogOfWarOpacity = 128,
	GameSpeed = 30,
	GameTranslation = "",
	GrabMouse = false,              --  Enable/disable grabbing the mouse.
	GroupKeys = "0123456789`",
	HoldClickDelayInMs = 1000,      --  For the wanted hold-click delay (in ms).
	KeyScrollSpeed = 4,
	LastDifficulty = 2,
	LeaveStopScrolling = true,      --  Enable/disable stopping scrolling when mouse leave.
	MaxOpenGLTexture = 0,
	MineNotifications = true,
	MinimapWithTerrain = true,      --  Choose your default for minimap with/without terrain.
	MouseScrollSpeed = 1,
	MouseScrollSpeedControl = 15,   --  Same as above if Control is pressed
	MouseScrollSpeedDefault = 4,    --  While middle-mouse is pressed: Pixels to move per scrolled mouse pixel, negative = reversed
	MusicEnabled = true,
	MusicVolume = 128,
	PauseOnLeave = true,
	PlayerName = "Wargustus",
	SelectionStyle = _("corners"),
	ServerIP = "localhost",
	ShowCommandKey = true,
	ShowButtonPopups = true,
	ShowDamage = false,
	ShowMessages = true,
	ShowOrders = true,
	ShowTips = true,
	StereoSound = true,
	StratagusTranslation = "",
	TipNumber = 0,
	UseFancyBuildings = false,      --  Enable/disable fancy building (random mirroring buildings)
	UseOpenGL = false,
	VideoFullScreen = false,
	VideoHeight = 600,
	VideoWidth = 800,
	ViewportMode = 0,
	ServerList = {},
	MetaServer = "localhost",
	MetaPort = 7775,
	SF2SoundFont = "music/TimGM6mb.sf2"
}

--- Skirmish Setup --------------
sk_ptype = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
sk_pside = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
sk_teams = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
sk_pcolor = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
sk_paitype = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1}
sk_rescount = -1
sk_game_type = -1
sk_difficulty = -1
sk_reveal_type = -1
sk_tileset = -1
sk_numunits = -1

if (wc2.preferences.ServerList == nil) then 
	wc2.preferences.ServerList = {}
end

CompleteMissingValues(wc2.preferences, defaultPreferences)
SavePreferences()

InitFuncs:add(function()
  if wc2.preferences.ShowDamage == true then
	SetDamageMissile("missile-hit")
  else
	SetDamageMissile(nil)
  end 
  if wc2.preferences.ShowOrders == true then
	Preference.ShowOrders = 1
  else 
	Preference.ShowOrders = 0
  end
end)

if wc2.preferences.ShowOrders == true then
	Preference.ShowOrders = 1
  else 
	Preference.ShowOrders = 0
  end
SetDoubleClickDelay(wc2.preferences.DoubleClickDelayInMs)
SetEffectsEnabled(wc2.preferences.EffectsEnabled)
SetEffectsVolume(wc2.preferences.EffectsVolume)
SetFancyBuildings(wc2.preferences.UseFancyBuildings)
SetFogOfWar(wc2.preferences.FogOfWar)
SetFogOfWarOpacity(wc2.preferences.FogOfWarOpacity)
SetGameSpeed(wc2.preferences.GameSpeed)
SetGroupKeys(wc2.preferences.GroupKeys)
SetHoldClickDelay(wc2.preferences.HoldClickDelayInMs)
SetKeyScroll(wc2.preferences.EnableKeyboardScrolling)
SetLeaveStops(wc2.preferences.LeaveStopScrolling)
SetLocalPlayerName(wc2.preferences.PlayerName)
SetMaxOpenGLTexture(wc2.preferences.MaxOpenGLTexture)
SetMinimapTerrain(wc2.preferences.MinimapWithTerrain)
SetMouseScroll(wc2.preferences.EnableMouseScrolling)
SetKeyScrollSpeed(wc2.preferences.KeyScrollSpeed)
SetMouseScrollSpeed(wc2.preferences.MouseScrollSpeed)
SetMouseScrollSpeedControl(wc2.preferences.MouseScrollSpeedControl)
SetMouseScrollSpeedDefault(wc2.preferences.MouseScrollSpeedDefault)
SetMusicEnabled(wc2.preferences.MusicEnabled)
SetMusicVolume(wc2.preferences.MusicVolume)
SetTranslationsFiles(wc2.preferences.StratagusTranslation, wc2.preferences.GameTranslation)
SetUseOpenGL(wc2.preferences.UseOpenGL)
SetVideoFullScreen(wc2.preferences.VideoFullScreen)
SetVideoResolution(wc2.preferences.VideoWidth, wc2.preferences.VideoHeight)

UI.ButtonPanel.ShowCommandKey = wc2.preferences.ShowCommandKey
Preference.SF2Soundfont = wc2.preferences.SF2SoundFont
Preference.MineNotifications = wc2.preferences.MineNotifications
Preference.ShowMessages = wc2.preferences.ShowMessages
Preference.PauseOnLeave = wc2.preferences.PauseOnLeave
SetSelectionStyle(wc2.preferences.SelectionStyle)
SetNewViewportMode(wc2.preferences.ViewportMode)
Preference.DeselectInMine = wc2.preferences.DeselectInMine
Preference.StereoSound = wc2.preferences.StereoSound

--- Uses Stratagus Library path!
Load("scripts/tales.lua")

Load("scripts/ai.lua")
Load("scripts/database.lua")
Load("scripts/translate/translate.lua")
Load("scripts/icons.lua")
Load("scripts/sound.lua")
Load("scripts/missiles.lua")
Load("scripts/constructions.lua")
Load("scripts/spells.lua")
Load("scripts/units.lua")
Load("scripts/upgrade.lua")
Load("scripts/fonts.lua")
Load("scripts/buttons.lua")
Load("scripts/ui.lua")
Load("scripts/commands.lua")
Load("scripts/cheats.lua")

--=============================================================================
--
--  AI helper table, the AI must know where to build units,
--  where to research spells, where to upgrade units.
--  If this is allowed and which dependencies exists, isn't
--  handled here. (see upgrade.lua)
--
--  NOTE: perhaps this could later be used to build the buttons?
--
--  DefineAiHelper(list)
--

--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
--  * Race human.
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DefineAiHelper(
  --
  -- Equivalence of units for the resource manager.
  --
  {"unit-equiv", "unit-town-hall",
  "unit-keep", "unit-castle"},
  {"unit-equiv", "unit-keep",
  "unit-castle"},
  {"unit-equiv", "unit-archer",
  "unit-ranger"},
  {"unit-equiv", "unit-knight",
  "unit-paladin"} )

--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
--  * Race orc.
--;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DefineAiHelper(
  --
  -- Equivalence of units for the resource manager.
  --
  {"unit-equiv", "unit-great-hall",
  "unit-stronghold", "unit-fortress"},
  {"unit-equiv", "unit-stronghold",
  "unit-fortress"},
  {"unit-equiv", "unit-axethrower",
  "unit-berserker"},
  {"unit-equiv", "unit-ogre",
  "unit-ogre-mage"} )

--
--  Load the actual individual scripts.
--
ReInitAiGameData()
Load("scripts/ai/passive.lua")
Load("scripts/ai/air_attack.lua")
Load("scripts/ai/land_attack.lua")
Load("scripts/ai/sea_attack.lua")
--Load("scripts/ai/soldiers_rush.lua")
Load("scripts/ai/ai_jadeite_2010.lua")
Load("scripts/ai/ai_nephrite_2012.lua")
Load("scripts/ai/ai_nephrite_2013.lua")
Load("scripts/ai/ai_zoisite_2013.lua")
Load("scripts/ai/ai_redribbon_2012.lua")
Load("scripts/ai/ai_redribbon_2014.lua")
Load("scripts/ai/ai_redribbon_2015.lua")
Load("scripts/ai/names.lua")

if (wargus.tales == true) then
	Load("scripts/caanoo/override.lua")
end

DebugPrint("... ready!\n")
