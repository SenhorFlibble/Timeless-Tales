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
--      constructions.ccl - Define the orc constructions.
--
--      (c) Copyright 2001,2003 by Lutz Sammer and Jimmy Salmon
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

local files = {summer = "wild/buildings/shipyard_construction_site.png",
  winter = "wild/buildings/shipyard_construction_site.png",
  wasteland = "wild/buildings/shipyard_construction_site.png",
  swamp = "wild/buildings/shipyard_construction_site.png"}

DefineConstruction("construction-orc-shipyard", {
  Files = {
    File = files[wargus.tileset],
    Size = {96, 96}},
  Constructions = {
   {Percent = 0,
    File = "construction",
    Frame = 0},
   {Percent = 25,
    File = "construction",
    Frame = 1},
   {Percent = 50,
    File = "main",
    Frame = 1}}
})

local files = {summer = "wild/buildings/oil_well_construction_site.png",
  winter = "wild/buildings/oil_well_construction_site.png",
  wasteland = "wild/buildings/oil_well_construction_site.png",
  swamp = "wild/buildings/oil_platform_construction_site.png"}

DefineConstruction("construction-orc-oil-well", {
  Files = {
    File = files[wargus.tileset],
    Size = {96, 96}},
  Constructions = {
   {Percent = 0,
    File = "construction",
    Frame = 0},
   {Percent = 25,
    File = "construction",
    Frame = 1},
   {Percent = 50,
    File = "main",
    Frame = 1}}
})

local files = {summer = "wild/buildings/refinery_construction_site.png",
  winter = "wild/buildings/refinery_construction_site.png",
  wasteland = "wild/buildings/refinery_construction_site.png",
  swamp = "wild/buildings/refinery_construction_site.png"}

DefineConstruction("construction-orc-refinery", {
  Files = {
    File = files[wargus.tileset],
    Size = {96, 96}},
  Constructions = {
   {Percent = 0,
    File = "construction",
    Frame = 0},
   {Percent = 25,
    File = "construction",
    Frame = 1},
   {Percent = 50,
    File = "main",
    Frame = 1}}
})

local files = {summer = "wild/buildings/foundry_construction_site.png",
  winter = "wild/buildings/foundry_construction_site.png",
  wasteland = "wild/buildings/foundry_construction_site.png",
  swamp = "wild/buildings/foundry_construction_site.png"}

DefineConstruction("construction-orc-foundry", {
  Files = {
    File = files[wargus.tileset],
    Size = {96, 96}},
  Constructions = {
   {Percent = 0,
    File = "construction",
    Frame = 0},
   {Percent = 25,
    File = "construction",
    Frame = 1},
   {Percent = 50,
    File = "main",
    Frame = 1}}
})
