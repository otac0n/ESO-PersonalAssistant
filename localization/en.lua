if ResourceBundle == nil then ResourceBundle = {} end
if ResourceBundle.en == nil then ResourceBundle.en = {} end

-- Welcome Messages --								-- Type '/pa' for GUI."
ResourceBundle.en["Welcome_NoSupport"] 				= PAC_COL_YELLOW.."P"..PAC_COL_WHITE.."ersonal"..PAC_COL_YELLOW.."A"..PAC_COL_WHITE.."ssistant"..PAC_COL_YELLOW.." at your service!   -   no localization for (%s) available yet."
ResourceBundle.en["Welcome_Support"] 				= PAC_COL_YELLOW.."P"..PAC_COL_WHITE.."ersonal"..PAC_COL_YELLOW.."A"..PAC_COL_WHITE.."ssistant"..PAC_COL_YELLOW.." at your service!"

-- Key Bindings
ResourceBundle.en["KB_Load_Profile1"]				= "Activate profile 1"
ResourceBundle.en["KB_Load_Profile2"]				= "Activate profile 2"
ResourceBundle.en["KB_Load_Profile3"]				= "Activate profile 3"
ResourceBundle.en["KB_Load_Profile4"]				= "Activate profile 4"
ResourceBundle.en["KB_Load_Profile5"]				= "Activate profile 5"

-- PAGeneral --
ResourceBundle.en["PAG_Profile1"]					= "Profile 1"
ResourceBundle.en["PAG_Profile2"]					= "Profile 2"
ResourceBundle.en["PAG_Profile3"]					= "Profile 3"
ResourceBundle.en["PAG_Profile4"]					= "Profile 4"
ResourceBundle.en["PAG_Profile5"]					= "Profile 5"

-- PARepair --
ResourceBundle.en["PAR_FullRepair"] 				= "PARepair: All %s items repaired for %d gold."
ResourceBundle.en["PAR_PartialRepair"] 				= "PARepair: %d / %d %s items repaired for %d gold. (not enough gold)"
ResourceBundle.en["PAR_NoGoldToRepair"] 			= "PARepair: Not enough gold to repair %d %s items."
ResourceBundle.en["PAR_NoRepair"] 					= "PARepair: Nothing to repair."

-- PABanking --
ResourceBundle.en["PAB_GoldDepositet"] 				= "PABanking: %d gold deposited."
ResourceBundle.en["PAB_GoldWithdrawn"] 				= "PABanking: %d gold withdrawn."
ResourceBundle.en["PAB_GoldWithdrawnInsufficient"] 	= "PABanking: %d / %d gold withdrawn. (not enough gold in bank!)"

ResourceBundle.en["PAB_ItemMovedTo"] 				= "%d x %s was moved to %s."
ResourceBundle.en["PAB_ItemNotMovedTo"] 			= "%d x %s was NOT moved to %s."
ResourceBundle.en["PAB_ItemMovedToFailed"] 			= "FAILURE: %s could NOT be moved to %s."

ResourceBundle.en["PAB_NoSpaceInFor"] 				= "PABanking: Not enough space in %s for: %s."
ResourceBundle.en["PAB_NoSpaceToOpen"] 				= "PABanking: Not enough space in %s to open %s."
ResourceBundle.en["PAB_NoDeposit"] 					= "PABanking: Nothing to deposit."

ResourceBundle.en["PAB_ItemType_None"] 				= "-"
ResourceBundle.en["PAB_ItemType_Deposit"]			= "Deposit"
ResourceBundle.en["PAB_ItemType_Withdrawal"]		= "Withdraw"
ResourceBundle.en["PAB_ItemType_Inherit"]			= "Depending on item type (below)"

-- PALoot --
ResourceBundle.en["PALo_ItemLooted"] 				= "PALoot: %d x %s"
ResourceBundle.en["PALo_GoldLooted"] 				= "PALoot: %d gold"

ResourceBundle.en["PALo_ItemType_None"] 		    = "-"
ResourceBundle.en["PALo_ItemType_Loot"]             = "Auto-Loot"

-- PAJunk --
ResourceBundle.en["PAJ_MovedToJunk"]                = "%s moved to junk."
ResourceBundle.en["PAJ_SoldJunkInfo"]               = "Sold junk items for %d gold."

-- MainMenu --
ResourceBundle.en["MMenu_Title"] 					= "|cFFD700P|rersonal|cFFD700A|rssistant"

-- PAGMenu --
ResourceBundle.en["PAGMenu_Header"]					= "|cFFD700PA G|reneral"
ResourceBundle.en["PAGMenu_ActiveProfile"]			= "Active profile"
ResourceBundle.en["PAGMenu_ActiveProfile_T"]		= "Select the profile settings that shall be used. Changing the selection will automatically load the settings. Changes below will automatically be stored under the profile."
ResourceBundle.en["PAGMenu_ActiveProfileRename"]	= "Rename active profile"
ResourceBundle.en["PAGMenu_ActiveProfileRename_T"]	= "Rename the active profile (will force a ReloadUI)."
ResourceBundle.en["PAGMenu_ActiveProfileRename_W"]	= "|cff0000(Renaming will force a ReloadUI)|r"
ResourceBundle.en["PAGMenu_Welcome"] 				= "Show welcome message"
ResourceBundle.en["PAGMenu_Welcome_T"] 				= "Display a welcome message from the addon upon successfully starting?"

-- PARMenu --
ResourceBundle.en["PARMenu_Header"] 				= "|cFFD700PA R|repair"
ResourceBundle.en["PARMenu_Enable"] 				= "|cB0B0FFEnable Auto Repair|r"
ResourceBundle.en["PARMenu_Enable_T"] 				= "Enable Auto Repair?"
ResourceBundle.en["PARMenu_RepairEq"] 				= "Repair equipped items"
ResourceBundle.en["PARMenu_RepairEq_T"] 			= "Repair equipped items?"
ResourceBundle.en["PARMenu_RepairEqDura"] 			= "- Durability threshold in %"
ResourceBundle.en["PARMenu_RepairEqDura_T"] 		= "Repair equipped items only if they are at or below the defined durability threshold."
ResourceBundle.en["PARMenu_RepairBa"]				= "Repair backpack items"
ResourceBundle.en["PARMenu_RepairBa_T"] 			= "Repair items in you backpack?"
ResourceBundle.en["PARMenu_RepairBaDura"] 			= "- Durability threshold in %"
ResourceBundle.en["PARMenu_RepairBaDura_T"] 		= "Repair items in the backpack only if they are at or below the defined durability threshold."
ResourceBundle.en["PARMenu_HideNoRepair"] 			= "Hide 'Nothing to Repair' message"
ResourceBundle.en["PARMenu_HideNoRepair_T"] 		= "Hide 'Nothing to Repair' message. You will still see a message if there is something to repair."
ResourceBundle.en["PARMenu_HideAll"] 				= "Hide ALL repair messages"
ResourceBundle.en["PARMenu_HideAll_T"] 				= "Silent-Mode: No repair message will be displayed. You also won't see your repair cost."

-- PABMenu --
ResourceBundle.en["PABMenu_Header"] 				= "|cFFD700PA B|ranking"
ResourceBundle.en["PABMenu_Enable"] 				= "|cB0B0FFEnable Auto Banking|r"
ResourceBundle.en["PABMenu_Enable_T"] 				= "Enable Auto Bank Deposit and Withdrawal?"
ResourceBundle.en["PABMenu_DepGold"] 				= "Deposit Gold"
ResourceBundle.en["PABMenu_DepGold_T"] 				= "Auto deposit gold to bank?"
ResourceBundle.en["PABMenu_DepInterval"] 			= "- Min interval between deposits (sec)"
ResourceBundle.en["PABMenu_DepInterval_T"] 			= "Minimum time in seconds between two automatic gold deposits."
ResourceBundle.en["PABMenu_DepInterval_W"] 			= "Invalid number --> No minimum interval between deposits."
ResourceBundle.en["PABMenu_DepGoldPerc"] 			= "- Gold to deposit in %"
ResourceBundle.en["PABMenu_DepGoldPerc_T"] 			= "Maximum percentage of your current gold to be deposited."
ResourceBundle.en["PABMenu_DepGoldSteps"] 			= "- Gold transactions in steps of "
ResourceBundle.en["PABMenu_DepGoldSteps_T"] 		= "In what steps shall gold be deposited and withdrawn?"
ResourceBundle.en["PABMenu_DepGoldKeep"] 			= "- Min gold to keep on character"
ResourceBundle.en["PABMenu_DepGoldKeep_T"] 			= "Minimum amount of gold to always keep on the character."
ResourceBundle.en["PABMenu_DepGoldKeep_W"] 			= "Invalid number --> No gold shall be kept on the character."
ResourceBundle.en["PABMenu_WitGoldMin"] 			= "- Withdraw gold if below minimum"
ResourceBundle.en["PABMenu_WitGoldMin_T"] 			= "Automatically withdraw gold from the bank if there is less gold on the character than defined above?"
ResourceBundle.en["PABMenu_DepWitItem"] 			= "Deposit and withdraw items"
ResourceBundle.en["PABMenu_DepWitItem_T"] 			= "Auto deposit and/or withdraw items to and from the bank?"
ResourceBundle.en["PABMenu_DepItemTypeDesc"] 		= "Define an individual behaviour (deposit, withdraw, ignore) for common item types as well as more advanced ones."
ResourceBundle.en["PABMenu_DepItemType"] 			= "Common item types"
ResourceBundle.en["PABMenu_DepItemType_T"] 			= "Open the sub-menu to define for each item type whether it shall be deposited, withdrawn or ignored."
ResourceBundle.en["PABMenu_DepStackOnly"]			= "Stacking type (Deposit)"
ResourceBundle.en["PABMenu_DepStackOnly_T"]			= "Define whether all matching items shall be deposited completely, if only items that exist in the target container shall be deposited or if only existing stacks shall be filled up to their max size."
ResourceBundle.en["PABMenu_WitStackOnly"]			= "Stacking type (Withdraw)"
ResourceBundle.en["PABMenu_WitStackOnly_T"]			= "Define whether all matching items shall be withdrawn completely, if only items that exist in the target container shall be withdrawn or if only existing stacks shall be filled up to their max size."
ResourceBundle.en["PABMenu_Advanced_DepItemType"]	= "Advanced item types"
ResourceBundle.en["PABMenu_Advanced_DepItemType_T"]	= "Open the sub-menu to define for other item types on an advanced level whether they shall be deposited, withdrawn or ignored."
ResourceBundle.en["PABMenu_DepItemTimerInterval"]	= "- Interval between item deposits (msecs)"
ResourceBundle.en["PABMenu_DepItemTimerInterval_T"]	= "How many msecs shall pass between two consecutive item deposits. If too many item deposits don't work, consider increasing this value."
ResourceBundle.en["PABMenu_ItemJunk_Header"]		= PAC_COL_LIGHT_BLUE.."ITEMS MARKED AS JUNK"
ResourceBundle.en["PABMenu_DepItemJunk"] 			= "Junk items"
ResourceBundle.en["PABMenu_DepItemJunk_T"] 			= "Shall all items that are marked as junk, only the ones for which their item type is enabled or none at all be deposited to or withdrawn from the bank?"
ResourceBundle.en["PABMenu_ItemType_Header"]		= PAC_COL_LIGHT_BLUE.."ITEM TYPES"
ResourceBundle.en["PABMenu_HideNoDeposit"] 			= "Hide 'Nothing to Deposit' message"
ResourceBundle.en["PABMenu_HideNoDeposit_T"] 		= "Hide 'Nothing to Deposit' message. You will see a message if there is something to deposit, though."
ResourceBundle.en["PABMenu_HideAll"] 				= "Hide ALL banking messages"
ResourceBundle.en["PABMenu_HideAll_T"] 				= "Silent-Mode: No banking message will be displayed. You also won't see your deposited gold/items."
ResourceBundle.en["PABMenu_DepButton"] 				= "Deposit all"
ResourceBundle.en["PABMenu_DepButton_T"] 			= "Change all dropdown values to 'Deposit'"
ResourceBundle.en["PABMenu_WitButton"] 				= "Withdraw all"
ResourceBundle.en["PABMenu_WitButton_T"] 			= "Change all dropdown values to 'Withdraw'"
ResourceBundle.en["PABMenu_IgnButton"] 				= "Ignore all"
ResourceBundle.en["PABMenu_IgnButton_T"] 			= "Change all dropdown values to '-'"
ResourceBundle.en["PABMenu_Lockipck_Header"] 		= PAC_COL_LIGHT_BLUE.."Lockpicks"
ResourceBundle.en["PABMenu_Keep_in_Backpack"] 		= "Amount to keep in backpack"
ResourceBundle.en["PABMenu_Keep_in_Backpack_T"] 	= "Define the amount which shall together with the mathematical operator be kept in the backpack."

-- PALoMenu --
ResourceBundle.en["PALoMenu_Header"] 				= "|cFFD700PA L|root"
ResourceBundle.en["PALoMenu_Enable"] 				= "|cB0B0FFEnable Auto Loot|r"
ResourceBundle.en["PALoMenu_Enable_T"] 				= "Enable Auto Loot?"
ResourceBundle.en["PALoMenu_LootGold"]              = "Auto-Loot Gold"
ResourceBundle.en["PALoMenu_LootGold_T"]            = "Automatically loot gold?"
ResourceBundle.en["PALoMenu_LootItems"]             = "Auto-Loot harvestable items"
ResourceBundle.en["PALoMenu_LootItems_T"]           = "Automatically loot harvestable items?"
ResourceBundle.en["PALoMenu_ItemTypeDesc"] 	        = "Enable and disable auto-loot for harvestable items from ores, herbs, woods, runestones, or fishing holes."
ResourceBundle.en["PALoMenu_ItemType"]              = "Harvestable item types"
ResourceBundle.en["PALoMenu_ItemType_T"]            = "Open the sub-menu to define for each harvestable item type whether it shall be auto-looted or not."
ResourceBundle.en["PALoMenu_ItemType_Header"]		= PAC_COL_LIGHT_BLUE.."ITEM TYPES"
ResourceBundle.en["PALoMenu_LootButton"] 			= "Auto-Loot all"
ResourceBundle.en["PALoMenu_LootButton_T"] 			= "Change all dropdown values to 'Auto-Loot'"
ResourceBundle.en["PALoMenu_IgnButton"] 			= "Disable all"
ResourceBundle.en["PALoMenu_IgnButton_T"] 			= "Change all dropdown values to '-'"
ResourceBundle.en["PALoMenu_HideItemLoot"] 			= "Hide 'Item looted' message"
ResourceBundle.en["PALoMenu_HideItemLoot_T"] 		= "Hide 'Item looted' message. You will no longer see which items were automatically looted."
ResourceBundle.en["PALoMenu_HideGoldLoot"] 			= "Hide 'Gold looted' message"
ResourceBundle.en["PALoMenu_HideGoldLoot_T"] 		= "Hide 'Gold looted' message. You will no longer see how much gold was automatically looted."
ResourceBundle.en["PALoMenu_HideAll"] 				= "Hide ALL loot messages"
ResourceBundle.en["PALoMenu_HideAll_T"] 			= "Silent-Mode: No loot message (items and currencies) will be displayed."

-- PAJMenu --
ResourceBundle.en["PAJMenu_Header"]                 = "|cFFD700PA J|runk"
ResourceBundle.en["PAJMenu_Enable"] 				= "|cB0B0FFEnable Auto Junk|r"
ResourceBundle.en["PAJMenu_Enable_T"] 				= "Enable Auto Junk?"
ResourceBundle.en["PAJMenu_ItemTypeDesc"]           = "Enable and disable the automatic marking as junk for different item types."
ResourceBundle.en["PAJMenu_AutoSellJunk"]           = "Auto-Sell Junk?"
ResourceBundle.en["PAJMenu_AutoSellJunk_T"]         = "Automatically sell all items marked as junk?"
ResourceBundle.en["PAJMenu_AutoMarkTrash"]          = "Auto-Mark [Trash]"
ResourceBundle.en["PAJMenu_AutoMarkTrash_T"]        = "Automatically mark items of type [Trash] as junk?"
ResourceBundle.en["PAJMenu_HideAll"] 				= "Hide ALL junk messages"
ResourceBundle.en["PAJMenu_HideAll_T"] 			    = "Silent-Mode: No junk message will be displayed."

-- Name Spaces --
ResourceBundle.en["NS_Bag_Equipment"]				= ""	-- not required so far
ResourceBundle.en["NS_Bag_Equipped"]				= "equipped"
ResourceBundle.en["NS_Bag_Backpack"]				= "backpack"
ResourceBundle.en["NS_Bag_Backpacked"]				= "backpack"
ResourceBundle.en["NS_Bag_Bank"]					= "bank"
ResourceBundle.en["NS_Bag_Banked"]					= ""	-- not required so far
ResourceBundle.en["NS_Bag_Unknown"]					= "unknown"

-- Operators --
ResourceBundle.en["REL_Operator"]					= "Mathematical Operator"
ResourceBundle.en["REL_None"]						= "-"
ResourceBundle.en["REL_Equal"]						= "equals (=)"
ResourceBundle.en["REL_LessThan"]					= "less than (<)"		-- not required so far
ResourceBundle.en["REL_LessThanEqual"]				= "less than or equal to (<=)"
ResourceBundle.en["REL_GreaterThan"]				= "greater than (>)"	-- not required so far
ResourceBundle.en["REL_GreaterThanEqual"]			= "greater than or equal to (>=)"

-- Stacking types --
ResourceBundle.en["ST_MoveAllFull"]					= "Move everything"				-- 0: Full deposit
ResourceBundle.en["ST_MoveExistingFull"]			= "Move all if a stack exists"	-- 1: Deposit if existing
ResourceBundle.en["ST_FillIncompleteOnly"]			= "Only fill up existing stacks"-- 2: Fill existing stacks

-- Official Item Types --
ResourceBundle.en[ITEMTYPE_ADDITIVE] 				= "enITEMTYPE_ADDITIVE"
ResourceBundle.en[ITEMTYPE_ARMOR] 					= "Armor (any)"
ResourceBundle.en[ITEMTYPE_ARMOR_BOOSTER] 			= "enITEMTYPE_ARMOR_BOOSTER"
ResourceBundle.en[ITEMTYPE_ARMOR_TRAIT] 			= "Armor Trait"
ResourceBundle.en[ITEMTYPE_AVA_REPAIR] 				= "enITEMTYPE_AVA_REPAIR"
ResourceBundle.en[ITEMTYPE_BLACKSMITHING_BOOSTER] 	= "Temper (Blacksmithing)"
ResourceBundle.en[ITEMTYPE_BLACKSMITHING_MATERIAL] 	= "Material (Blacksmithing)"
ResourceBundle.en[ITEMTYPE_BLACKSMITHING_RAW_MATERIAL] = "Raw Material (Blacksmithing)"
ResourceBundle.en[ITEMTYPE_CLOTHIER_BOOSTER] 		= "Tannin (Clothing)"
ResourceBundle.en[ITEMTYPE_CLOTHIER_MATERIAL] 		= "Material (Clothing)"
ResourceBundle.en[ITEMTYPE_CLOTHIER_RAW_MATERIAL] 	= "Raw Material (Clothing)"
ResourceBundle.en[ITEMTYPE_COLLECTIBLE] 			= "Collectible"
ResourceBundle.en[ITEMTYPE_CONTAINER] 				= "Container"
ResourceBundle.en[ITEMTYPE_COSTUME] 				= "Costume"
ResourceBundle.en[ITEMTYPE_CROWN_ITEM]              = "enITEMTYPE_CROWN_ITEM"
ResourceBundle.en[ITEMTYPE_CROWN_REPAIR]            = "enITEMTYPE_CROWN_REPAIR"
ResourceBundle.en[ITEMTYPE_DEPRECATED]              = "enITEMTYPE_DEPRECATED"
ResourceBundle.en[ITEMTYPE_DISGUISE] 				= "enITEMTYPE_DISGUISE"
ResourceBundle.en[ITEMTYPE_DRINK] 					= "Drink"
ResourceBundle.en[ITEMTYPE_ENCHANTING_RUNE_ASPECT]	= "Aspect Runestone (Enchanting)"
ResourceBundle.en[ITEMTYPE_ENCHANTING_RUNE_ESSENCE]	= "Essence Runestone (Enchanting)"
ResourceBundle.en[ITEMTYPE_ENCHANTING_RUNE_POTENCY]	= "Potency Runestone (Enchanting)"
ResourceBundle.en[ITEMTYPE_ENCHANTMENT_BOOSTER] 	= "enITEMTYPE_ENCHANTMENT_BOOSTER"
ResourceBundle.en[ITEMTYPE_FISH]                    = "Fish"
ResourceBundle.en[ITEMTYPE_FLAVORING] 				= "enITEMTYPE_FLAVORING"
ResourceBundle.en[ITEMTYPE_FOOD] 					= "Food"
ResourceBundle.en[ITEMTYPE_GLYPH_ARMOR] 			= "Armor Glyph (Enchanting)"
ResourceBundle.en[ITEMTYPE_GLYPH_JEWELRY] 			= "Jewelry Glyph (Enchanting)"
ResourceBundle.en[ITEMTYPE_GLYPH_WEAPON] 			= "Weapon Glyph (Enchanting)"
ResourceBundle.en[ITEMTYPE_INGREDIENT] 				= "Ingredient (Provisioning)"
ResourceBundle.en[ITEMTYPE_LOCKPICK] 				= "enITEMTYPE_LOCKPICK"
ResourceBundle.en[ITEMTYPE_LURE] 					= "Bait"
--ResourceBundle.en[ITEMTYPE_MASTER_WRIT]             = "enITEMTYPE_MASTER_WRIT"
ResourceBundle.en[ITEMTYPE_MAX_VALUE]               = "enITEMTYPE_MAX_VALUE"
ResourceBundle.en[ITEMTYPE_MIN_VALUE]               = "enITEMTYPE_MIN_VALUE"
ResourceBundle.en[ITEMTYPE_MOUNT]					= "enITEMTYPE_MOUNT"
ResourceBundle.en[ITEMTYPE_NONE] 					= "enITEMTYPE_NONE"
ResourceBundle.en[ITEMTYPE_PLUG] 					= "enITEMTYPE_PLUG"
ResourceBundle.en[ITEMTYPE_POISON] 					= "Poison"
ResourceBundle.en[ITEMTYPE_POISON_BASE]             = "Poison Solvent (Alchemy)"
ResourceBundle.en[ITEMTYPE_POTION] 					= "Potion"
ResourceBundle.en[ITEMTYPE_POTION_BASE]             = "Potion Solvent (Alchemy)"
ResourceBundle.en[ITEMTYPE_RACIAL_STYLE_MOTIF] 		= "Motif"
ResourceBundle.en[ITEMTYPE_RAW_MATERIAL] 			= "Raw Material"
ResourceBundle.en[ITEMTYPE_REAGENT] 				= "Reagent (Alchemy)"
ResourceBundle.en[ITEMTYPE_RECIPE] 					= "Recipe (Provisioning)"
ResourceBundle.en[ITEMTYPE_SIEGE] 					= "enITEMTYPE_SIEGE"
ResourceBundle.en[ITEMTYPE_SOUL_GEM] 				= "Soul Gem"
ResourceBundle.en[ITEMTYPE_SPELLCRAFTING_TABLET]    = "enITEMTYPE_SPELLCRAFTING_TABLET"
ResourceBundle.en[ITEMTYPE_SPICE] 					= "enITEMTYPE_SPICE"
ResourceBundle.en[ITEMTYPE_STYLE_MATERIAL] 			= "Style Material"
ResourceBundle.en[ITEMTYPE_TABARD] 					= "enITEMTYPE_TABARD"
ResourceBundle.en[ITEMTYPE_TOOL] 					= "Tool"
ResourceBundle.en[ITEMTYPE_TRASH]					= "Trash"
ResourceBundle.en[ITEMTYPE_TREASURE]                = "enITEMTYPE_TREASURE"
ResourceBundle.en[ITEMTYPE_TROPHY] 					= "Trophy"
ResourceBundle.en[ITEMTYPE_WEAPON] 					= "Weapon (any)"
ResourceBundle.en[ITEMTYPE_WEAPON_BOOSTER] 			= "enITEMTYPE_WEAPON_BOOSTER"
ResourceBundle.en[ITEMTYPE_WEAPON_TRAIT] 			= "Weapon Trait"
ResourceBundle.en[ITEMTYPE_WOODWORKING_BOOSTER] 	= "Resin (Woodworking)"
ResourceBundle.en[ITEMTYPE_WOODWORKING_MATERIAL] 	= "Material (Woodworking)"
ResourceBundle.en[ITEMTYPE_WOODWORKING_RAW_MATERIAL] = "Raw Material (Woodworking)"