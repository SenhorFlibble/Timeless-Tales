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
--		(c) Copyright 2015 by Kyran Jackson
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

-- Unit Database


function UnitDatabaseSetup(race, unit, origin, category, class, rank)
	if (race == "man") then race = "human" end
	if (type(unit) == "number") then
		for index = 1, 30 do
			if (UnitDatabase[race][index]["Unit"] ~= nil) then
				UnitDatabase[unit][index] = {}
				UnitDatabase[unit][index]["Unit"] =	UnitDatabase[race][index]["Unit"]
				UnitDatabase[unit][index]["Origin"] = UnitDatabase[race][index]["Origin"]
				UnitDatabase[unit][index]["Category"] = UnitDatabase[race][index]["Category"]
				UnitDatabase[unit][index]["Class"] = UnitDatabase[race][index]["Class"]
				UnitDatabase[unit][index]["Rank"] = UnitDatabase[race][index]["Rank"]
				UnitDatabase[unit][index]["CastGold"] = UnitDatabase[race][index]["CastGold"]
				UnitDatabase[unit][index]["CastWood"] = UnitDatabase[race][index]["CastWood"]
				UnitDatabase[unit][index]["CastOil"] = UnitDatabase[race][index]["CastOil"]
			else
				break
			end
		end
	elseif ((race ~= nil) and (type(unit) == "string") and (unit ~= nil) and (origin == nil)) then
		for index = 1, 30 do
			if (UnitDatabase[race][index]["Unit"] == unit) then
				return index
			end
		end
	elseif (origin == "For the Motherland") then
		-- find unit, add gold
		-- category = gold, class = wood, rank = oil
		for index = 1, 30 do
			if (UnitDatabase[race][index]["Unit"] == unit) then
				UnitDatabase[race][index]["CastGold"] = category
				UnitDatabase[race][index]["CastWood"] = class
				UnitDatabase[race][index]["CastOil"] = rank
				break
			end
		end
	elseif (race ~= nil) then
		for index = 1, 30 do
			if (UnitDatabase[race][index]["Unit"] == nil) then
				UnitDatabase[race][index]["Unit"] = unit
				UnitDatabase[race][index]["Origin"] = origin
				UnitDatabase[race][index]["Category"] = category
				UnitDatabase[race][index]["Class"] = class
				UnitDatabase[race][index]["Rank"] = rank
				break
			end
		end
	end
end

UnitDatabase = {}
UnitDatabase["human"] = {}
UnitDatabase["orc"] = {}
for index = 1, 30 do
	UnitDatabase["human"][index] = {}
	UnitDatabase["orc"][index] = {}
end
for player = 0, 15 do
	UnitDatabase[player] = {}
end

for index = 1, 2 do
	if (index == 1) then race = "human" else race = "orc" end
	UnitDatabaseSetup(race, AiHeroRider(race), AiBarracks(race), "ground", "melee", "hero")
	UnitDatabaseSetup(race, AiHeroSoldier(race), AiBarracks(race), "ground", "melee", "hero")
	UnitDatabaseSetup(race, AiHeroShooter(race), AiBarracks(race), "ground", "ranged", "hero")
	UnitDatabaseSetup(race, AiSoldier(race), AiBarracks(race), "ground", "melee", "standard")
	UnitDatabaseSetup(race, AiShooter(race), AiBarracks(race), "ground", "ranged", "standard")
	UnitDatabaseSetup(race, AiEliteShooter(race), AiBarracks(race), "ground", "ranged", "elite")
	UnitDatabaseSetup(race, AiCavalryMage(race), AiBarracks(race), "ground", "melee", "elite")
	UnitDatabaseSetup(race, AiCavalry(race), AiBarracks(race), "ground", "melee", "standard")
	UnitDatabaseSetup(race, AiCatapult(race), AiBarracks(race), "ground", "ranged", "elite")
	UnitDatabaseSetup(race, AiFodder(race), AiCityCenter(race), "ground", "melee", "fodder")
	UnitDatabaseSetup(race, AiSuicideBomber(race), AiScientific(race), "ground", "melee", "attacker")
	UnitDatabaseSetup(race, AiLonerShooter(race), AiCityCenter(race), "ground", "ranged", "defender")
	UnitDatabaseSetup(race, AiFlyer(race), AiAirport(race), "air", "ranged", "attacker")
	UnitDatabaseSetup(race, AiMage(race), AiMageTower(race), "ground", "ranged", "attacker")
	UnitDatabaseSetup(race, AiWorker(race), AiCityCenter(race), "ground", "worker", "defender")
end

UnitDatabaseSetup("human", "unit-knight-rider", "For the Motherland", 7500, 0, 12500)
UnitDatabaseSetup("human", "unit-arthor-literios", "For the Motherland", 2500, 0, 12500)
UnitDatabaseSetup("human", "unit-female-hero", "For the Motherland", 1000, 9000, 10000)
UnitDatabaseSetup("human", "unit-footman", "For the Motherland", 2500, 0, 0)
UnitDatabaseSetup("human", "unit-archer", "For the Motherland", 1000, 1500, 0)
UnitDatabaseSetup("human", "unit-ranger", "For the Motherland", 1000, 1500, 2500)
UnitDatabaseSetup("human", "unit-paladin", "For the Motherland", 7500, 0, 5000)
UnitDatabaseSetup("human", "unit-knight", "For the Motherland", 7500, 0, 0)
UnitDatabaseSetup("human", "unit-ballista", "For the Motherland", 2500, 10000, 0)
UnitDatabaseSetup("human", "unit-attack-peasant", "For the Motherland", 1000, 500, 0)
UnitDatabaseSetup("human", "unit-dwarves", "For the Motherland", 2500, 4000, 2500)
UnitDatabaseSetup("human", "unit-yeoman", "For the Motherland", 1000, 4000, 0)
UnitDatabaseSetup("human", "unit-gryphon-rider", "For the Motherland", 2500, 5000, 5000)
UnitDatabaseSetup("human", "unit-mage", "For the Motherland", 2500, 2500, 5000)
UnitDatabaseSetup("human", "unit-peasant", "For the Motherland", 1000, 1500, 0)

UnitDatabaseSetup("orc", "unit-fad-man", "For the Motherland", 7500, 0, 17500)
UnitDatabaseSetup("orc", "unit-quick-blade", "For the Motherland", 2500, 0, 12500)
UnitDatabaseSetup("orc", "unit-sharp-axe", "For the Motherland", 1000, 9000, 10000)
UnitDatabaseSetup("orc", "unit-grunt", "For the Motherland", 2500, 0, 0)
UnitDatabaseSetup("orc", "unit-axethrower", "For the Motherland", 1000, 1500, 0)
UnitDatabaseSetup("orc", "unit-berserker", "For the Motherland", 1000, 1500, 2500)
UnitDatabaseSetup("orc", "unit-ogre-mage", "For the Motherland", 7500, 0, 5000)
UnitDatabaseSetup("orc", "unit-ogre", "For the Motherland", 7500, 0, 0)
UnitDatabaseSetup("orc", "unit-catapult", "For the Motherland", 2500, 10000, 0)
UnitDatabaseSetup("orc", "unit-skeleton", "For the Motherland", 750, 0, 250)
UnitDatabaseSetup("orc", "unit-goblin-sappers", "For the Motherland", 2500, 4000, 2500)
UnitDatabaseSetup("orc", "unit-nomad", "For the Motherland", 1000, 4000, 0)
UnitDatabaseSetup("orc", "unit-dragon", "For the Motherland", 2500, 5000, 5000)
UnitDatabaseSetup("orc", "unit-death-knight", "For the Motherland", 2500, 2500, 5000)
UnitDatabaseSetup("orc", "unit-peon", "For the Motherland", 1000, 1500, 0)

Character = {}
function CharacterSetup(name, age, house, faction, mouth, eyes, brows)
	if ((age == "Mood") or (age == "Sync")) then
		--Character["Sandria Fields"]["Neutral"]["Happy"]["Mouth"]
		Character[name][house][faction] = {}
		if (mouth == nil) then mouth = "dummy.png" elseif (string.sub(mouth, -4) ~= ".png") then mouth = mouth .. ".png" end
		if (eyes == nil) then eyes = "dummy.png" elseif (string.sub(eyes, -4) ~= ".png") then eyes = eyes .. ".png" end
		if (brows == nil) then brows = "dummy.png" elseif (string.sub(brows, -4) ~= ".png") then brows = brows .. ".png" end
		Character[name][house][faction]["Mouth"] = mouth 
		Character[name][house][faction]["Eyes"] = eyes   
		Character[name][house][faction]["Brows"] = brows 
	elseif (age == "Skin") then
		--Character["Sandria Fields"]["Neutral"]["Scale"]
		if (faction == nil) then faction = "dummy.png" elseif (string.sub(faction, -4) ~= ".png") then faction = faction .. ".png" end
		Character[name]["Graphic"] = {}
		Character[name][house] = {}
		Character[name][house]["Name"] = house
		Character[name][house]["Skin"] = faction
		if (mouth == nil) then mouth = 1 end
		Character[name][house]["Scale"] = mouth
	else
		Character[name] = {}
		Character[name]["Name"] = name
		Character[name]["Age"] = age
		Character[name]["House"] = house
		Character[name]["Faction"] = faction
		Character[name]["Skin"] = "Neutral"
		Character[name]["Mood"] = "Happy"
	end
end

function CharacterAction(name, action, skin, mood)
	if (((action == "Sync") or (action == "Pose")) and (name ~= nil) and (Character[name] ~= nil)) then
		if (skin ~= nil) then
			if (action == "Pose") then
				character_skin = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin]["Skin"])
				Character[name]["Skin"] = skin
				character_skin:Load()
				if ((mood ~= nil) and (Character[name][skin][mood]["Mouth"] ~= nil)) then
					character_mouth = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][mood]["Mouth"])
					character_eyes = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][mood]["Eyes"])
					character_brows = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][mood]["Brows"])
					Character[name]["Mood"] = mood
				else
					character_mouth = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][Character[name]["Mood"]]["Mouth"])
					character_eyes = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][Character[name]["Mood"]]["Eyes"])
					character_brows = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][Character[name]["Mood"]]["Brows"])
				end
			elseif (action == "Sync") then
				mood = string.lower(mood)
				mood = SyncIndex(name, mood)
				if (Character[name][skin][mood]["Mouth"] ~= nil) then
					character_mouth = CGraphic:New("characters/" .. name .. "/" .. Character[name][skin][mood]["Mouth"])
				end
			end
			character_eyes:Load()
			character_brows:Load()
			character_mouth:Load()
		end
		if (Character[name][skin]["Scale"] ~= 1) then
			if ((Character[name]["Graphic"][Character[name][skin]["Skin"]] == nil) or (Character[name]["Graphic"][Character[name][skin]["Skin"]] == 1)) then
				character_skin:Resize(ImageWidget(character_skin):getWidth()*Character[name][skin]["Scale"], ImageWidget(character_skin):getHeight()*Character[name][skin]["Scale"])
				Character[name]["Graphic"][Character[name][skin]["Skin"]] = Character[name][skin]["Scale"]
			end
			if ((Character[name]["Graphic"][Character[name][skin][mood]["Eyes"]] == nil) or (Character[name]["Graphic"][Character[name][skin][mood]["Eyes"]] == 1)) then
				Character[name]["Graphic"][Character[name][skin][mood]["Eyes"]] = Character[name][skin]["Scale"]
				character_eyes:Resize(ImageWidget(character_eyes):getWidth()*Character[name][skin]["Scale"], ImageWidget(character_eyes):getHeight()*Character[name][skin]["Scale"])
			end
			if ((Character[name]["Graphic"][Character[name][skin][mood]["Brows"]] == nil) or (Character[name]["Graphic"][Character[name][skin][mood]["Brows"]] == 1)) then
				Character[name]["Graphic"][Character[name][skin][mood]["Brows"]] = Character[name][skin]["Scale"]
				character_brows:Resize(ImageWidget(character_brows):getWidth()*Character[name][skin]["Scale"], ImageWidget(character_brows):getHeight()*Character[name][skin]["Scale"])
			end
			if ((Character[name]["Graphic"][Character[name][skin][mood]["Mouth"]] == nil) or (Character[name]["Graphic"][Character[name][skin][mood]["Mouth"]] == 1)) then
				Character[name]["Graphic"][Character[name][skin][mood]["Mouth"]] = Character[name][skin]["Scale"]
				character_mouth:Resize(ImageWidget(character_mouth):getWidth()*Character[name][skin]["Scale"], ImageWidget(character_mouth):getHeight()*Character[name][skin]["Scale"])
			end
		end
		charskinWidget = ImageWidget(character_skin)
		charmouthWidget = ImageWidget(character_mouth)
		chareyesWidget = ImageWidget(character_eyes)
		charbrowsWidget = ImageWidget(character_brows)
	end
end

CharacterSetup("Sandria Fields", 14, "Red House", "Mythic")
CharacterSetup("Sandria Fields", "Skin", "Neutral", "char_sandria.png", 0.7) --0.7
CharacterSetup("Sandria Fields", "Skin", "Neutral Bloody", "char_sandria_blood.png", 0.7) --0.7

CharacterSetup("Sandria Fields", "Sync", "Neutral", "ai", "char_sandria_mouth_ai.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "e", "char_sandria_mouth_e.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "etc", "char_sandria_mouth_etc.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "l", "char_sandria_mouth_l.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "mbp", "char_sandria_mouth_mbp.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "o", "char_sandria_mouth_o.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "u", "char_sandria_mouth_u.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral", "wq", "char_sandria_mouth_wq.png")

CharacterSetup("Sandria Fields", "Mood", "Neutral", "Grumpy", "char_sandria_mouth_frown.png", "char_sandria_eyes_sly.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Surprised", "char_sandria_mouth_surprised.png", "char_sandria_eyes_bright.png", "char_sandria_brows_surprised.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Unsure", "char_sandria_mouth_frown.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Happy", "char_sandria_mouth_cat.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral", "Sly", "char_sandria_mouth_cat.png", "char_sandria_eyes_sly.png")

CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "ai", "char_sandria_mouth_ai.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "e", "char_sandria_mouth_e.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "etc", "char_sandria_mouth_etc.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "l", "char_sandria_mouth_l.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "mbp", "char_sandria_mouth_mbp.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "o", "char_sandria_mouth_o.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "u", "char_sandria_mouth_u.png")
CharacterSetup("Sandria Fields", "Sync", "Neutral Bloody", "wq", "char_sandria_mouth_wq.png")

CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Grumpy", "char_sandria_mouth_frown.png", "char_sandria_eyes_sly.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Surprised", "char_sandria_mouth_surprised.png", "char_sandria_eyes_bright.png", "char_sandria_brows_surprised.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Unsure", "char_sandria_mouth_frown.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Happy", "char_sandria_mouth_cat.png", "char_sandria_eyes_bright.png")
CharacterSetup("Sandria Fields", "Mood", "Neutral Bloody", "Sly", "char_sandria_mouth_cat.png", "char_sandria_eyes_sly.png")

CharacterSetup("Kaylin Matzner", 18, "Green House", "Wild")
CharacterSetup("Kaylin Matzner", "Skin", "Neutral", "char_kaylin.png", 0.7)

CharacterSetup("Kaylin Matzner", "Mood", "Neutral", "Grumpy")
CharacterSetup("Kaylin Matzner", "Mood", "Neutral", "Surprised")
CharacterSetup("Kaylin Matzner", "Mood", "Neutral", "Unsure")
CharacterSetup("Kaylin Matzner", "Mood", "Neutral", "Happy")
CharacterSetup("Kaylin Matzner", "Mood", "Neutral", "Sly")

CharacterSetup("Lucas Kage", 17, "Red House", "Mythic")
CharacterSetup("Lucas Kage", "Skin", "Neutral", "char_kaminari_full", 1)

CharacterSetup("Lucas Kage", "Mood", "Neutral", "Grumpy", "char_kaminari_full_annoyed.png")
CharacterSetup("Lucas Kage", "Mood", "Neutral", "Surprised")
CharacterSetup("Lucas Kage", "Mood", "Neutral", "Unsure")
CharacterSetup("Lucas Kage", "Mood", "Neutral", "Happy", "char_kaminari_full_content.png")
CharacterSetup("Lucas Kage", "Mood", "Neutral", "Sly")

CharacterAction("Lucas Kage", "Pose", "Neutral", "Unsure")

CharacterSetup("Yukiko Robinson", 17, "Yellow House", "Order")
CharacterSetup("Yukiko Robinson", "Skin", "Neutral", "char_yukiko", 1)

--[[
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "ai", "char_yukiko_ai")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "e", "char_yukiko_e")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "etc", "char_yukiko_etc")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "l", "char_yukiko_l")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "mbp", "char_yukiko_mbp")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "o", "char_yukiko_o")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "u", "char_yukiko_u")
CharacterSetup("Yukiko Robinson", "Sync", "Neutral", "wq", "char_yukiko_wq")
]]

CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Grumpy", "char_yukiko_annoyed")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Surprised", "char_yukiko_surprised")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Unsure", "char_yukiko_unsure")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Happy")
CharacterSetup("Yukiko Robinson", "Mood", "Neutral", "Sly", "char_yukiko_cat")

CharacterSetup("Sky Robinson", 17, "Yellow House", "Order")
CharacterSetup("Sky Robinson", "Skin", "Neutral", "char_sky_crossed.png", 1)

CharacterSetup("Sky Robinson", "Sync", "Neutral", "ai", "char_sky_ai.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "e", "char_sky_e.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "etc", "char_sky_etc.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "l", "char_sky_l.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "mbp", "char_sky_mbp.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "o", "char_sky_o.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "u", "char_sky_u.png")
CharacterSetup("Sky Robinson", "Sync", "Neutral", "wq", "char_sky_wq.png")

CharacterSetup("Sky Robinson", "Mood", "Neutral", "Grumpy", "char_sky_annoyed")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Surprised", "char_sky_surprised.png")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Unsure", "char_sky_unsure.png")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Happy")
CharacterSetup("Sky Robinson", "Mood", "Neutral", "Sly", "char_sky_cat")

CharacterSetup("Aya Kalang", 18, "Red House", "Mythics")
CharacterSetup("Aya Kalang", "Skin", "Neutral", "char_aya.png", 1)

CharacterSetup("Aya Kalang", "Sync", "Neutral", "ai", "char_aya_ai.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "e", "char_aya_e.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "etc", "char_aya_etc.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "l", "char_aya_l.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "mbp", "char_aya_mbp.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "o", "char_aya_o.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "u", "char_aya_u.png")
CharacterSetup("Aya Kalang", "Sync", "Neutral", "wq", "char_aya_wq.png")

CharacterSetup("Aya Kalang", "Mood", "Neutral", "Grumpy")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Surprised")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Unsure")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Happy")
CharacterSetup("Aya Kalang", "Mood", "Neutral", "Sly")

CharacterSetup("Yutaka Nomiya", 17, "White House", "Freemen")
CharacterSetup("Yutaka Nomiya", "Skin", "Neutral", "char_yutaka", 1)

CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Grumpy")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Surprised")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Unsure")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Happy")
CharacterSetup("Yutaka Nomiya", "Mood", "Neutral", "Sly")

CharacterSetup("Robbie Tater", 18, "White House", "Freemen")
CharacterSetup("Robbie Tater", "Skin", "Neutral", "char_yellowmalecaptain_full", 1)

CharacterSetup("Robbie Tater", "Mood", "Neutral", "Grumpy")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Surprised")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Unsure")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Happy")
CharacterSetup("Robbie Tater", "Mood", "Neutral", "Sly")

CharacterSetup("Scott Campbell", 17, "Yellow House", "Order")
CharacterSetup("Scott Campbell", "Skin", "Neutral", "char_yellow_full", 0.7)

CharacterSetup("Scott Campbell", "Mood", "Neutral", "Grumpy")
CharacterSetup("Scott Campbell", "Mood", "Neutral", "Surprised")
CharacterSetup("Scott Campbell", "Mood", "Neutral", "Unsure")
CharacterSetup("Scott Campbell", "Mood", "Neutral", "Happy")
CharacterSetup("Scott Campbell", "Mood", "Neutral", "Sly")

CharacterSetup("Shane Wolfe", 17, "White House", "Freeman")
CharacterSetup("Shane Wolfe", "Skin", "Neutral", "char_shane", 1)

CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Grumpy")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Surprised")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Unsure")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Happy")
CharacterSetup("Shane Wolfe", "Mood", "Neutral", "Sly")

CharacterSetup("Drago Payne", 17, "Yellow House", "Order")
CharacterSetup("Drago Payne", "Skin", "Neutral", "char_drago", 1)

CharacterSetup("Drago Payne", "Mood", "Neutral", "Grumpy")
CharacterSetup("Drago Payne", "Mood", "Neutral", "Surprised")
CharacterSetup("Drago Payne", "Mood", "Neutral", "Unsure")
CharacterSetup("Drago Payne", "Mood", "Neutral", "Happy")
CharacterSetup("Drago Payne", "Mood", "Neutral", "Sly")

function SyncIndex(name, mood, a, b, c, d, e, f)
	if (a == nil) then
		if (SyncIndex(name, mood, "ai", "a", "i") == true) then mood = "ai"
		elseif (SyncIndex(name, mood, "etc", "t", "c") == true) then mood = "etc"
		elseif (SyncIndex(name, mood, "mbp", "m", "b", "p") == true) then mood = "mbp"
		elseif (SyncIndex(name, mood, "wq", "w", "q") == true) then mood = "wq"
		elseif (mood == " ") then mood = Character[name]["Mood"]
		elseif (SyncIndex(name, mood, "e", "l", "o", "u") == false) then mood = GameDefinition["Briefing"]["Sync"] end
		GameDefinition["Briefing"]["Sync"] = mood
		return mood
	elseif ((mood ~= nil) and ((mood == a) or (mood == b) or (mood == c) or (mood == d) or (mood == e) or (mood == f))) then
		return true
	else
		return false
	end
end

function RunModCampaignOptions()
end

function LoadScript(script)
	if (script ~= nil) then
		Load(script)
	else
		Load(GameDefinition["Map"]["Path"] .. GameDefinition["Map"]["Name"] .. GameDefinition["Map"]["Type"])
	end
end

function GatherResults(battle, race1, race2, friend1, enemy1, friend2, enemy2)
	if (battle == "Land") then
		local InfantryCurrentTemp = 0
		local CavalryCurrentTemp = 0
		local ArtilleryCurrentTemp = 0
		local friend
		local race
		local infnames 
		local cavnames
		local artnames
		for raceCount = 1, 2 do
			if (raceCount == 1) then race = race1 else race = race2 end
			for friendCount = 1, 2 do
				if (friendCount == 1) then 
					if (raceCount == 1) then 
						friend = friend1 
					else 
						friend = enemy1 
						InfantryCurrentTemp = 0
						CavalryCurrentTemp = 0
						ArtilleryCurrentTemp = 0
					end
				else
					if (raceCount == 1) then 
						if (friend2 ~= nil) then
							friend = friend2 
						else
							friend = -1
						end
					else 
						if (enemy2 ~= nil) then
							friend = enemy2
						else
							friend = -1
						end
					end
				end
				if (friend ~= -1) then
					infnames = {AiWorker(friend), AiSoldier(friend), AiShooter(friend), AiEliteShooter(friend), AiHeroRider(friend), AiHeroSoldier(friend), AiHeroShooter(friend), AiFodder(friend), AiSuicideBomber(friend), AiLonerShooter(friend)}
					for infnamesCount = 1, #infnames do
						if (GetPlayerData(friend, "UnitTypesCount", infnames[infnamesCount]) > 0) then
							InfantryCurrentTemp = InfantryCurrentTemp + GetPlayerData(friend, "UnitTypesCount", infnames[infnamesCount])
						end
					end
					cavnames = {AiCavalryMage(friend), AiCavalry(friend)}
					for cavnamesCount = 1, #cavnames do
						if (GetPlayerData(friend, "UnitTypesCount", cavnames[cavnamesCount]) > 0) then
							CavalryCurrentTemp = CavalryCurrentTemp + GetPlayerData(friend, "UnitTypesCount", cavnames[cavnamesCount])
						end
					end
					artnames = {AiCatapult(friend), AiFlyer(friend), AiMage(friend), AiScout(friend)}
					for artnamesCount = 1, #artnames do
						if (GetPlayerData(friend, "UnitTypesCount", artnames[artnamesCount]) > 0) then
							ArtilleryCurrentTemp = ArtilleryCurrentTemp + GetPlayerData(friend, "UnitTypesCount", artnames[artnamesCount])
						end
					end
				end
			end
			GameDefinition["Results"][race]["InfantryCurrent"] = InfantryCurrentTemp
			if (GameDefinition["Results"][race]["InfantryTotal"] < GameDefinition["Results"][race]["InfantryCurrent"]) then
				GameDefinition["Results"][race]["InfantryTotal"] = GameDefinition["Results"][race]["InfantryCurrent"]
			end
			
			GameDefinition["Results"][race]["CavalryCurrent"] = CavalryCurrentTemp
			if (GameDefinition["Results"][race]["CavalryTotal"] < GameDefinition["Results"][race]["CavalryCurrent"]) then
				GameDefinition["Results"][race]["CavalryTotal"] = GameDefinition["Results"][race]["CavalryCurrent"]
			end
			GameDefinition["Results"][race]["ArtilleryCurrent"] = ArtilleryCurrentTemp
			if (GameDefinition["Results"][race]["ArtilleryTotal"] < GameDefinition["Results"][race]["ArtilleryCurrent"]) then
				GameDefinition["Results"][race]["ArtilleryTotal"] = GameDefinition["Results"][race]["ArtilleryCurrent"]
			end
		end
	end
end

function BriefingAction(action, text, menu, x, y, z)
	if (menu ~= nil) then AddMenuHelpers(menu) end
	if ((action == "Objectives") and (text ~= nil)) then
		Objectives = text
		menu:addLabel(_("Objectives:"), GameDefinition["Briefing"]["X"] + 70 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + 306 * GameDefinition["Briefing"]["Height"] / 480, Fonts["large"], false)
		local objectives = ""
		table.foreachi(text, function(k,v) objectives = objectives .. v .. "\n" end)
		local l = MultiLineLabel(objectives)
		l:setFont(Fonts["large"])
		l:setAlignment(MultiLineLabel.LEFT)
		l:setLineWidth(250 * GameDefinition["Briefing"]["Width"] / 640)
		l:adjustSize()
		menu:add(l, GameDefinition["Briefing"]["X"] + 70 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + (306 * GameDefinition["Briefing"]["Height"] / 480) + 30)
	elseif (action == "Increment") then
		if (GameDefinition["Briefing"]["Active"] == true) then
			GameDefinition["Briefing"]["Active"] = 1
		elseif (GameDefinition["Briefing"]["Active"] ~= false) then
			GameDefinition["Briefing"]["Active"] = GameDefinition["Briefing"]["Active"] + 1
		end
	elseif (action == "Terminate") then
		GameDefinition["Briefing"]["Active"] = true
	elseif (action == "Start") then
		--GameDefinition["Briefing"]["Active"] = false
		RunMap(text, nil, nil, nil, false)
		BriefingAction("Increment")
		Load(GameDefinition["Map"]["Path"] .. GameDefinition["Map"]["File"] .. GameDefinition["Map"]["Type"])
	elseif (action == "Character") then
		local charx = GameDefinition["Briefing"]["X"] + GameDefinition["Briefing"]["Width"] - 450
		local chary = GameDefinition["Briefing"]["Y"] + 10
		if ((text == "Add") or (text == nil)) then
			menu:add(charskinWidget, charx, chary)
			menu:add(chareyesWidget, charx, chary)
			menu:add(charmouthWidget, charx, chary)
			menu:add(charbrowsWidget, charx, chary)
		end
	elseif ((action == "Title") and (text ~= nil)) then
		menu:addLabel(text, GameDefinition["Briefing"]["X"] + (70 + 340) / 2 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + 28 * GameDefinition["Briefing"]["Height"] / 480, Fonts["large"], true)
	elseif ((action == "Scrolling Text") and (text ~= nil)) then
		local t = LoadBuffer(text)
		t = "\n\n\n\n\n\n\n\n\n\n" .. t .. "\n\n\n\n\n\n\n\n\n\n\n\n\n"
		--local sw = ScrollingWidget(320, 170 * GameDefinition["Briefing"]["Height"] / 480)
		local sw = ScrollingWidget(288, 170)
		sw:setBackgroundColor(Color(0,0,0,0))
		sw:setSpeed(0.28)
		local l = MultiLineLabel(t)
		l:setFont(Fonts["large"])
		l:setAlignment(MultiLineLabel.LEFT)
		l:setVerticalAlignment(MultiLineLabel.TOP)
		l:setLineWidth(286)
		l:adjustSize()
		sw:add(l, 0, 0)
		menu:add(sw, GameDefinition["Briefing"]["X"] + 70 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + 80 * GameDefinition["Briefing"]["Height"] / 480)
	elseif ((action == "Multiplayer") and (menu ~= nil)) then
		local index = 0
		local channel = -1
		local name = GetPlayerData(AiPlayer(), "Name")
		function DisplayNextChat()
			index = index + 1
			if (text[index] ~= nil) then
				AddMessage("<" .. name .. "> " .. text[index])
			end
			if (index <= table.getn(menu)) then
				menu[index] = "sounds/characters/" .. GameDefinition["Briefing"]["Character"] .. "/" .. GameDefinition["Map"]["Name"] .. "/" .. menu[index] .. ".wav"
				channel = PlaySoundFile(menu[index], DisplayNextChat);
			else
			  channel = -1
			end
		end
		if ((text[index] ~= nil) or (menu[index] ~= nil) or (index == 0)) then
			DisplayNextChat()
		end
	elseif ((action == "Voice") and (text ~= nil)) then
		local voice = 0
		local channel = -1
		function PlayNextVoice()
			voice = voice + 1
			if (voice <= table.getn(text)) then
				text[voice] = "sounds/characters/" .. GameDefinition["Briefing"]["Character"] .. "/" .. GameDefinition["Map"]["Name"] .. "/" .. text[voice] .. ".wav"
				channel = PlaySoundFile(text[voice], PlayNextVoice);
			else
			  channel = -1
			end
		  end
		  PlayNextVoice()
	elseif (action == "Results") then
		local resultx = GameDefinition["Briefing"]["X"] + 70 + (GameDefinition["Briefing"]["Width"] / 640)
		local resulty = GameDefinition["Briefing"]["Y"] + 80 + (GameDefinition["Briefing"]["Height"] / 480) + 300
		-- Add Box
		resultsdrop = CGraphic:New("ui/scroll.png")
		resultsdrop:Load()
		resultsdropWidget = ImageWidget(scrolldrop)
		if (Video.Width == 800) then
			BriefingAction("Widget", resultsdropWidget, menu, resultx, resulty)
		end
		menu:addLabel(_("Combat Casualties"), resultx + 160, resulty + 6, nil, true)
		menu:addLabel(_("Infantry"), resultx + 17, resulty + 2 + 32*1, Fonts["game"], false)
		menu:addLabel(_("Artillery"), resultx + 17, resulty + 2 + 32*2, Fonts["game"], false)
		menu:addLabel(_("Cavalry"), resultx + 17, resulty + 2 + 32*3, Fonts["game"], false)
		-- Counter Widget Stats
		infantryWidget = StatBoxWidget(80, 20)
		artilleryWidget = StatBoxWidget(80, 20)
		cavalryWidget = StatBoxWidget(80, 20)
		infantryenemyWidget = StatBoxWidget(80, 20)
		artilleryenemyWidget = StatBoxWidget(80, 20)
		cavalryenemyWidget = StatBoxWidget(80, 20)
		infantryWidget:setFont(Fonts["game"])
		artilleryWidget:setFont(Fonts["game"])
		cavalryWidget:setFont(Fonts["game"])
		infantryenemyWidget:setFont(Fonts["game"])
		artilleryenemyWidget:setFont(Fonts["game"])
		cavalryenemyWidget:setFont(Fonts["game"])
		-- Friendly Counter Widget Stats
		local infantryStrength    = GameDefinition["Results"][GameDefinition["Results"]["Player"]]["InfantryTotal"]
		local artilleryStrength   = GameDefinition["Results"][GameDefinition["Results"]["Player"]]["ArtilleryTotal"]
		local cavalryStrength     = GameDefinition["Results"][GameDefinition["Results"]["Player"]]["CavalryTotal"]
		local infantryCasualties  = infantryStrength  - GameDefinition["Results"][GameDefinition["Results"]["Player"]]["InfantryCurrent"]
		local artilleryCasualties = artilleryStrength - GameDefinition["Results"][GameDefinition["Results"]["Player"]]["ArtilleryCurrent"]
		local cavalryCasualties   = cavalryStrength   - GameDefinition["Results"][GameDefinition["Results"]["Player"]]["CavalryCurrent"]
		infantryWidget:setCaption(infantryCasualties .. " of " .. infantryStrength)
		artilleryWidget:setCaption(artilleryCasualties .. " of " .. artilleryStrength)
		cavalryWidget:setCaption(cavalryCasualties .. " of " .. cavalryStrength)
		infantryWidget:setPercent((infantryCasualties / infantryStrength)*100)
		artilleryWidget:setPercent((artilleryCasualties / artilleryStrength)*100)
		cavalryWidget:setPercent((cavalryCasualties / cavalryStrength)*100)
		infantryWidget:setBackgroundColor(black)
		artilleryWidget:setBackgroundColor(black)
		cavalryWidget:setBackgroundColor(black)
		infantryWidget:setForegroundColor(Color(0, 0, 215))
		artilleryWidget:setForegroundColor(Color(0, 0, 215))
		cavalryWidget:setForegroundColor(Color(0, 0, 215))
		infantryWidget:setBaseColor(Color(215, 215, 0))
		artilleryWidget:setBaseColor(Color(215, 215, 0))	
		cavalryWidget:setBaseColor(Color(215, 215, 0))
		-- Enemy Counter Widget Stats
		local infantryenemyStrength    = GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["InfantryTotal"]
		local artilleryenemyStrength   = GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["ArtilleryTotal"]
		local cavalryenemyStrength     = GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["CavalryTotal"]
		local infantryenemyCasualties  = infantryenemyStrength  - GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["InfantryCurrent"]
		local artilleryenemyCasualties = artilleryenemyStrength - GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["ArtilleryCurrent"]
		local cavalryenemyCasualties   = cavalryenemyStrength   - GameDefinition["Results"][GameDefinition["Results"]["Enemy"]]["CavalryCurrent"]
		infantryenemyWidget:setCaption(infantryenemyCasualties .. " of " .. infantryenemyStrength)
		artilleryenemyWidget:setCaption(artilleryenemyCasualties .. " of " .. artilleryenemyStrength)
		cavalryenemyWidget:setCaption(cavalryenemyCasualties .. " of " .. cavalryenemyStrength)
		infantryenemyWidget:setPercent((infantryenemyCasualties / infantryenemyStrength)*100)
		artilleryenemyWidget:setPercent((artilleryenemyCasualties / artilleryenemyStrength)*100)
		cavalryenemyWidget:setPercent((cavalryenemyCasualties / cavalryenemyStrength)*100)
		infantryenemyWidget:setBackgroundColor(black)
		artilleryenemyWidget:setBackgroundColor(black)
		cavalryenemyWidget:setBackgroundColor(black)
		infantryenemyWidget:setForegroundColor(Color(0, 0, 215))
		artilleryenemyWidget:setForegroundColor(Color(0, 0, 215))
		cavalryenemyWidget:setForegroundColor(Color(0, 0, 215))
		infantryenemyWidget:setBaseColor(Color(215, 215, 0))
		artilleryenemyWidget:setBaseColor(Color(215, 215, 0))	
		cavalryenemyWidget:setBaseColor(Color(215, 215, 0))
		-- Add Friendly Counter Widgets
		menu:add(infantryWidget, resultx + 17 + 80, resulty + 32*1)
		menu:add(artilleryWidget, resultx + 17 + 80, resulty + 32*2)
		menu:add(cavalryWidget, resultx + 17 + 80, resulty + 32*3)
		-- Add Enemy Counter Widgets
		menu:add(infantryenemyWidget, resultx + (17 + 80)*2, resulty + 32*1)
		menu:add(artilleryenemyWidget, resultx + (17 + 80)*2, resulty + 32*2)
		menu:add(cavalryenemyWidget, resultx + (17 + 80)*2, resulty + 32*3)
	elseif ((action == "Chat") and ((text ~= nil) or (x ~= nil))) then
		local function MultiTextChat()
			local syncchar
			local synccharold
			local screenchar
			if ((wait == nil) or ((wait < 0) and (string.len(x) > 0))) then wait = 1 end
			if (screentext == nil) then screentext = "" end
			if (wait == 1) then
				if (x ~= nil) then
					syncchar = string.sub(x, 1, 1)
					if (syncchar ~= synccharold) then
						x = string.sub(x, 2)
						if (((SyncIndex(name, syncchar, "a", "b", "c", "d", "e", "f") == true) or (SyncIndex(name, syncchar, "g", "h", "i", "j", "k", "l") == true) or
							(SyncIndex(name, syncchar, "m", "n", "o", "p", "q", "r") == true) or (SyncIndex(name, syncchar, "s", "t", "u", "v", "w", "x") == true) or
							(SyncIndex(name, syncchar, "y", "z", " ", "") == true)) and (syncchar ~= "+")) then
							charmouthWidget:setVisible(false)
							if (syncchar ~= "") then
								CharacterAction(GameDefinition["Briefing"]["Character"], "Sync", Character[GameDefinition["Briefing"]["Character"]]["Skin"], syncchar)
							else
								CharacterAction(GameDefinition["Briefing"]["Character"], "Pose", Character[GameDefinition["Briefing"]["Character"]]["Skin"], Character[GameDefinition["Briefing"]["Character"]]["Mood"])
							end
							menu:add(charmouthWidget, GameDefinition["Briefing"]["X"] + GameDefinition["Briefing"]["Width"] - 450, GameDefinition["Briefing"]["Y"] + 10)
						end
						synccharold = syncchar
					end
				end
				if (text ~= nil) then
					screenchar = string.sub(text, 1, 1)
					if (screenchar ~= "+") then
						screentext = screentext .. screenchar		
						menu:addMultiLineLabel(screentext, GameDefinition["Briefing"]["X"] + 70 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + 80 * GameDefinition["Briefing"]["Height"] / 480, Fonts["large"], false, 320)
					end
					if (text == "") then text = nil end
					text = string.sub(text, 2)
				end
			end
			if ((wait < -100) and (text == nil) and (GameDefinition["Briefing"]["Active"] ~= true)) then
				-- Active must not be true as the game would skip scroll text briefings.
				menu:stop() 
				wait = nil
			elseif (wait == 0) then
				if ((string.len(x) == 0) and ((text == nil) or (string.len(text) == 0))) then
					charmouthWidget:setVisible(false)
					CharacterAction(GameDefinition["Briefing"]["Character"], "Pose", Character[GameDefinition["Briefing"]["Character"]]["Skin"], Character[GameDefinition["Briefing"]["Character"]]["Mood"])
					menu:add(charmouthWidget, GameDefinition["Briefing"]["X"] + GameDefinition["Briefing"]["Width"] - 450, GameDefinition["Briefing"]["Y"] + 10)
					wait = -1
				elseif ((string.len(x) > 0) or (string.len(text) > 0)) then
					wait = 2
					return
				end	
			else
				wait = wait - 1
				return
			end
		end
		screentext = ""
		menu:addLogicCallback(LuaActionListener(MultiTextChat))
	elseif (action == "Backdrop") then
		if (x == nil) then x = 0 end
		if (y == nil) then y = 0 end
		if (z == nil) then z = "scroll.png" end
		if ((text == nil) and (GameDefinition["Briefing"]["Backdrop"] ~= nil)) then text = "backdrops/" .. GameDefinition["Briefing"]["Backdrop"] .. ".png" end
		if (text ~= nil) then
			backdrop = CGraphic:New(text)
			backdrop:Load()
			backdrop:Resize(GameDefinition["Briefing"]["Width"], GameDefinition["Briefing"]["Height"])
			backdropWidget = ImageWidget(backdrop)
		end
		BriefingAction("Widget", backdropWidget, menu, x, y)
		scrolldrop = CGraphic:New("ui/" .. z)
		scrolldrop:Load()
		scrolldropWidget = ImageWidget(scrolldrop)
		BriefingAction("Widget", scrolldropWidget, menu, 70 + x, 80 + y)
	elseif (action == "Sleep") then
		return menu:stop()
	elseif ((action == "Refresh") or (action == "Load")) then
		return menu:run()
	else
		if (x == nil) then x = 0 end
		if (y == nil) then y = 0 end
		if ((action == "Widget") and (text ~= nil)) then
			menu:add(text, GameDefinition["Briefing"]["X"]+x, GameDefinition["Briefing"]["Y"]+y)
		elseif ((action == "Button") and (text ~= nil)) then
			if (text == "Continue") then
				menu:addMenuButton(_("~!Continue"), "c", GameDefinition["Briefing"]["X"] + 455 * GameDefinition["Briefing"]["Width"] / 640, GameDefinition["Briefing"]["Y"] + 440 * GameDefinition["Briefing"]["Height"] / 480,
				function()
				  menu:stop()
				  StopMusic()
				  BriefingAction("Increment")
				  Load(x .. y .. z)
				end)
			elseif (text == "Exit") then
				menu:addMenuButton(_("E~!xit"), "x", GameDefinition["Briefing"]["X"]+x + 455 * GameDefinition["Briefing"]["Width"] / 640 - 133, GameDefinition["Briefing"]["Y"]+y + 440 * GameDefinition["Briefing"]["Height"] / 480,
				function() 
				  menu:stop() 
				  BriefingAction("Terminate")
				end)
			end
		end
	end
end

function BundleAction(action, name, displaytext, synctext, voice)
	local menu = MenuScreen()
	if (action == "Scrolling Text") then BriefingAction("Backdrop", nil, menu, 0, 0, "scrolltall.png") elseif ((action ~= "Game") and (action ~= "Multiplayer")) then BriefingAction("Backdrop", nil, menu) end
	GameDefinition["Briefing"]["Character"] = name
	if (action == "Results") then
		BriefingAction("Results", nil, menu)
		action = "Chat"
	end
	if (action == "Multiplayer") then
		BriefingAction("Multiplayer", displaytext, synctext)
		--BriefingAction("Chat", nil, menu, synctext)
		--action = "Next"
	end
	if ((action == "Chat") or (action == "Game")) then
		if (action == "Game") then
			AddMessage("<" .. GetPlayerData(AiPlayer(), "Name") .. "> " .. displaytext)
		end
		if (synctext == nil) then
			local chartext = ""
			local looptext = ""
			local chatboxlength = 34
			local chatboxcurrent = 1
			local chatboxtotal = 1
			synctext = displaytext
			for index = 1, string.len(displaytext) do
				chartext = string.sub(displaytext, index, index)
				string.sub(displaytext, 2)
				if ((action ~= "Game") and (chartext ~= "+")) then
					looptext = looptext .. chartext
					if ((chartext == " ") and (chatboxcurrent > chatboxlength - chatboxlength)) then
						-- Check the character length of the next word.
						for chatboxindex = 1, chatboxlength - chatboxcurrent do
							if (chatboxindex >= chatboxlength - chatboxcurrent) then
								-- Make the word appear on the next line if no room available.
								looptext = looptext .. "\n"
								chatboxcurrent = 1
							elseif ((string.sub(displaytext, index + chatboxindex, index + chatboxindex) == " ") or (string.len(displaytext) - index < chatboxindex)) then
								break
							end
						end
					end
					chatboxtotal = chatboxtotal + 1
					if (chatboxcurrent ~= chatboxlength) then
						chatboxcurrent = chatboxcurrent + 1
					else
						chatboxcurrent = 1
					end
				end
			end
			displaytext = looptext
		end
		BriefingAction("Voice", voice, menu)
		if (action == "Game") then
			BriefingAction("Chat", nil, menu, synctext)
			action = "Next"
		else
			BriefingAction("Chat", displaytext, menu, synctext)
			action = "Start"
		end
	elseif (action == "Scrolling Text") then
		BriefingAction("Scrolling Text", displaytext, menu)
		if (synctext ~= nil) then
			BriefingAction("Chat", nil, menu, synctext)
		else
			BriefingAction("Chat", nil, menu, LoadBuffer(displaytext))
		end
		action = "Start"
	end
	if ((action == "Start") or (action == "Next")) then
		if ((name ~= nil) and (Character[name] ~= nil)) then
			CharacterAction(name, "Pose", Character[name]["Skin"], Character[name]["Mood"])
			BriefingAction("Character", "Add", menu)
		end
		BriefingAction("Title", GameDefinition["Briefing"]["Title"], menu)
		BriefingAction("Objectives", GameDefinition["Briefing"]["Objectives"], menu)
		if (action == "Start") then
			BriefingAction("Button", "Continue", menu, GameDefinition["Map"]["Path"], GameDefinition["Map"]["File"], GameDefinition["Map"]["Type"])
			BriefingAction("Button", "Exit", menu)
		end
		BriefingAction("Load", 0, menu)
	end
end

function RunModCampaignMission(title, objs, bg, text, voices, mapname, menu)
  -- Timeless Tales
  GameDefinition["Briefing"]["Title"] = title
  GameDefinition["Briefing"]["Objectives"] = objs
  GameDefinition["Map"]["Path"] = mapname
  --if (CurrentCampaignRace ~= nil) then
  --  SetPlayerData(GetThisPlayer(), "RaceName", CurrentCampaignRace)
  --end
  BriefingAction("Character", "Add", menu)
  BriefingAction("Title", GameDefinition["Briefing"]["Title"], menu)
  BriefingAction("Scrolling Text", text, menu)
  BriefingAction("Objectives", GameDefinition["Briefing"]["Objectives"], menu)
  BriefingAction("Button", "Continue", menu, GameDefinition["Map"]["Path"], GameDefinition["Map"]["File"], GameDefinition["Map"]["Type"])
  BriefingAction("Button", "Exit", menu)
  BriefingAction("Refresh", 0, menu)
end