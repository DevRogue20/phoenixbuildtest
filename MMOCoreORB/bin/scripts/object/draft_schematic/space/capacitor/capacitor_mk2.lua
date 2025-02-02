--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_draft_schematic_space_capacitor_capacitor_mk2 = object_draft_schematic_space_capacitor_shared_capacitor_mk2:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Mark II Weapons Capacitor",

   craftingToolTab = 131072, -- (See DraftSchematicObjectTemplate.h)
   complexity = 25, 
   size = 1, 
   factoryCrateType = "object/factory/factory_crate_generic_items.iff",
   
   xpType = "shipwright", 
   xp = 125, 

   assemblySkill = "advanced_assembly", 
   experimentingSkill = "advanced_ship_experimentation", 
   customizationSkill = "advanced_customization", 
   factoryCrateSize = 1000,

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n", "craft_item_ingredients_n"},
   ingredientTitleNames = {"casing", "capacitor_charge_core", "cooling_agent", "capacitor_upgrade", "capacitor_outer_shielding"},
   ingredientSlotType = {0, 0, 0, 3, 0},
   resourceTypes = {"steel", "copper", "gas_inert", "object/tangible/ship/crafted/capacitor/shared_base_capacitor_subcomponent_mk2.iff", "ore"},
   resourceQuantities = {125, 125, 125, 1, 125},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/ship/crafted/capacitor/capacitor_mk2.iff",

   additionalTemplates = {
              "object/tangible/ship/crafted/capacitor/shared_capacitor_mk2.iff",
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_space_capacitor_capacitor_mk2, "object/draft_schematic/space/capacitor/capacitor_mk2.iff")
