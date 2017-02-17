PA_SettingsMenu = {}

local LAM2 = LibStub("LibAddonMenu-2.0")

local panelData = {
    type = "panel",
    name = "PersonalAssistant",
    displayName = PALocale.getResourceMessage("MMenu_Title"),
    author = "Klingo",
    version = PA.AddonVersion,
    website = "http://www.esoui.com/downloads/info381-PersonalAssistant",
    slashCommand = "/pa",
    registerForRefresh  = true,
    registerForDefaults = true,
}

local optionsTable = setmetatable({}, { __index = table })
local PABItemTypeSubmenuTable = setmetatable({}, { __index = table })
local PABItemTypeAdvancedSubmenuTable = setmetatable({}, { __index = table })
local PALHarvestableItemSubmenuTable = setmetatable({}, { __index = table })
local PALLootableItemSubmenuTable = setmetatable({}, { __index = table })


function PA_SettingsMenu.CreateOptions()

-- TODO: fix menu creation

	-- create main- and submenus with LAM-2
--	PA_SettingsMenu.createPABItemSubMenu()
--	PA_SettingsMenu.createPABItemAdvancedSubMenu()
--    PA_SettingsMenu.createPALHarvestableItemSubMenu()
--    PA_SettingsMenu.createPALLootableItemSubMenu()
PALogger.log("creating menu now")
    PA_SettingsMenu.createProfileSelectionMenu()
PALogger.log("menu done!")
--	PA_SettingsMenu.createMainMenu()

    if (PA.savedVars.Profile.activeProfile ~= nil and PA.savedVars.Profile.activeProfile <= PAG_MAX_PROFILES) then
        PA_SettingsMenu.createMainMenu()
    end

	
	-- and register it
	LAM2:RegisterAddonPanel("PersonalAssistantAddonOptions", panelData)
	LAM2:RegisterOptionControls("PersonalAssistantAddonOptions", optionsTable)
end

function PA_SettingsMenu.createProfileSelectionMenu()

    optionsTable:insert({
        type = "header",
        name = PALocale.getResourceMessage("PAGMenu_Header"),
    })

    optionsTable:insert({
        type = "dropdown",
        name = PALocale.getResourceMessage("PAGMenu_ActiveProfile"),
        tooltip = PALocale.getResourceMessage("PAGMenu_ActiveProfile_T"),
        choices = MenuHelper.getProfileList(),
        choicesValues = MenuHelper.getProfileListValues(),
        getFunc = function() return PA.savedVars.Profile.activeProfile end,
        setFunc = function(value) MenuHelper.loadProfile(value) end,
        width = "half",
        default = 6,    -- TODO:  correct default value
--        default = PALocale.getResourceMessage("PAG_Profile1"),
        reference = "PERSONALASSISTANT_PROFILEDROPDOWN",   -- TODO: constant
    })

end

function PA_SettingsMenu.createMainMenu()

    optionsTable:insert({
		type = "editbox",
		name = PALocale.getResourceMessage("PAGMenu_ActiveProfileRename"),
		tooltip = PALocale.getResourceMessage("PAGMenu_ActiveProfileRename_T"),
		getFunc = function() return PA.savedVars.General[PA.savedVars.Profile.activeProfile].name end,
		setFunc = function(value) MenuHelper.renameProfile(tostring(value)) end,
		width = "half",
		warning = PALocale.getResourceMessage("PAGMenu_ActiveProfileRename_W"),
        -- requiresReload = true,
        -- does not work here, since not directly reloading after a name change causes many problems
        -- when changing other values that cannot be related to a specific profile anymore
		default =  "<Please select Profile>", -- TODO: replace with Locale
    })

    optionsTable:insert({
		type = "checkbox",
		name = PALocale.getResourceMessage("PAGMenu_Welcome"),
		tooltip = PALocale.getResourceMessage("PAGMenu_Welcome_T"),
		getFunc = function() return PA.savedVars.General[PA.savedVars.Profile.activeProfile].welcome end,
		setFunc = function(value) PA.savedVars.General[PA.savedVars.Profile.activeProfile].welcome = value end,
		default = true,
    })

    -- =================================================================================================================

    if (PAR) then
        -- ------------------------ --
        -- PersonalAssistant Repair --
        -- ------------------------ --
        optionsTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PARMenu_Header"),
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PARMenu_Enable"),
            tooltip = PALocale.getResourceMessage("PARMenu_Enable_T"),
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled = value end,
            default = true,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PARMenu_RepairEq"),
            tooltip = PALocale.getResourceMessage("PARMenu_RepairEq_T"),
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].equipped end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].equipped = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled end,
            default = true,
        })

        optionsTable:insert({
            type = "slider",
            name = PALocale.getResourceMessage("PARMenu_RepairEqDura"),
            tooltip = PALocale.getResourceMessage("PARMenu_RepairEqDura_T"),
            min = 0,
            max = 100,
            step = 1,
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].equippedThreshold end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].equippedThreshold = value end,
            width = "half",
            disabled = function() return not (PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].equipped and PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled) end,
            default = 75,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PARMenu_RepairBa"),
            tooltip = PALocale.getResourceMessage("PARMenu_RepairBa_T"),
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].backpack end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].backpack = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })

        optionsTable:insert({
            type = "slider",
            name = PALocale.getResourceMessage("PARMenu_RepairBaDura"),
            tooltip = PALocale.getResourceMessage("PARMenu_RepairBaDura_T"),
            min = 0,
            max = 100,
            step = 1,
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].backpackThreshold end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].backpackThreshold = value end,
            width = "half",
            disabled = function() return not (PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].backpack and PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled) end,
            default = 75,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PARMenu_HideNoRepair"),
            tooltip = PALocale.getResourceMessage("PARMenu_HideNoRepair_T"),
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].hideNoRepairMsg end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].hideNoRepairMsg = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PARMenu_HideAll"),
            tooltip = PALocale.getResourceMessage("PARMenu_HideAll_T"),
            getFunc = function() return PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].hideAllMsg end,
            setFunc = function(value) PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].hideAllMsg = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Repair[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })
    end

    -- =================================================================================================================

    if (PAB) then
        -- ------------------------- --
        -- PersonalAssistant Banking --
        -- ------------------------- --
        optionsTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PABMenu_Header"),
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_Enable"),
            tooltip = PALocale.getResourceMessage("PABMenu_Enable_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.enabled,
            setFunc = PAMenu_Functions.setFunc.PABanking.enabled,
            default = PAMenu_Defaults.defaultSettings.PABanking.enabled,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_EnabledGold"),
            tooltip = PALocale.getResourceMessage("PABMenu_EnabledGold_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.enabledGold,
            setFunc = PAMenu_Functions.setFunc.PABanking.enabledGold,
            disabled = PAMenu_Functions.disabled.PABanking.enabledGold,
            default = PAMenu_Defaults.defaultSettings.PABanking.enabledGold,
        })

        -- enabledGoldChatMode

        optionsTable:insert({
            type = "editbox",
            name = PALocale.getResourceMessage("PABMenu_DepositInterval"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepositInterval_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.goldDepositInterval,
            setFunc = PAMenu_Functions.setFunc.PABanking.goldDepositInterval,
            disabled = PAMenu_Functions.disabled.PABanking.goldDepositInterval,
            warning = PALocale.getResourceMessage("PABMenu_DepositInterval_W"),
            default = PAMenu_Defaults.defaultSettings.PABanking.goldDepositInterval,
        })

        optionsTable:insert({
            type = "slider",
            name = PALocale.getResourceMessage("PABMenu_DepositGoldPerc"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepositGoldPerc_T"),
            min = 1,
            max = 100,
            step = 1,
            getFunc = PAMenu_Functions.getFunc.PABanking.goldDepositPercentage,
            setFunc = PAMenu_Functions.setFunc.PABanking.goldDepositPercentage,
            disabled = PAMenu_Functions.disabled.PABanking.goldDepositPercentage,
            default = PAMenu_Defaults.defaultSettings.PABanking.goldDepositPercentage,
        })

        optionsTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PABMenu_GoldTransactionStep"),
            tooltip = PALocale.getResourceMessage("PABMenu_GoldTransactionStep_T"),
            choices = PAMenu_Choices.choices.PABanking.goldTransactionStep,
            choicesValues = PAMenu_Choices.choicesValues.PABanking.goldTransactionStep,
            getFunc = PAMenu_Functions.getFunc.PABanking.goldTransactionStep,
            setFunc = PAMenu_Functions.setFunc.PABanking.goldTransactionStep,
            disabled = PAMenu_Functions.disabled.PABanking.goldTransactionStep,
            default = PAMenu_Defaults.defaultSettings.PABanking.goldTransactionStep,
        })

        optionsTable:insert({
            type = "editbox",
            name = PALocale.getResourceMessage("PABMenu_GoldMinToKeep"),
            tooltip = PALocale.getResourceMessage("PABMenu_GoldMinToKeep_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.goldMinToKeep,
            setFunc = PAMenu_Functions.setFunc.PABanking.goldMinToKeep,
            disabled = PAMenu_Functions.disabled.PABanking.goldMinToKeep,
            warning = PALocale.getResourceMessage("PABMenu_GoldMinToKeep_W"),
            default = PAMenu_Defaults.defaultSettings.PABanking.goldMinToKeep,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_WithdrawToMinGold"),
            tooltip = PALocale.getResourceMessage("PABMenu_WithdrawToMinGold_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.withdrawToMinGold,
            setFunc = PAMenu_Functions.setFunc.PABanking.withdrawToMinGold,
            disabled = PAMenu_Functions.disabled.PABanking.withdrawToMinGold,
            default = PAMenu_Defaults.defaultSettings.PABanking.withdrawToMinGold,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_EnabledItems"),
            tooltip = PALocale.getResourceMessage("PABMenu_EnabledItems_T"),
            getFunc = PAMenu_Functions.getFunc.PABanking.enabledItems,
            setFunc = PAMenu_Functions.setFunc.PABanking.enabledItems,
            disabled = PAMenu_Functions.disabled.PABanking.enabledItems,
            default = PAMenu_Defaults.defaultSettings.PABanking.enabledItems,
        })

        -- enabledItemsChatMode

        optionsTable:insert({
            type = "description",
            text = PALocale.getResourceMessage("PABMenu_DepItemTypeDesc"),
        })

        optionsTable:insert({
            type = "submenu",
            name = PALocale.getResourceMessage("PABMenu_DepItemType"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepItemType_T"),
            controls = PABItemTypeSubmenuTable,
        })

        optionsTable:insert({
            type = "submenu",
            name = PALocale.getResourceMessage("PABMenu_Advanced_DepItemType"),
            tooltip = PALocale.getResourceMessage("PABMenu_Advanced_DepItemType_T"),
            controls = PABItemTypeAdvancedSubmenuTable,
        })

        optionsTable:insert({
            type = "slider",
            name = PALocale.getResourceMessage("PABMenu_DepItemTimerInterval"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepItemTimerInterval_T"),
            min = 200,
            max = 1000,
            step = 50,
            getFunc = PAMenu_Functions.getFunc.PABanking.depositTimerInterval,
            setFunc = PAMenu_Functions.setFunc.PABanking.depositTimerInterval,
            disabled = PAMenu_Functions.disabled.PABanking.depositTimerInterval,
            default = PAMenu_Defaults.defaultSettings.PABanking.depositTimerInterval,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_HideNoDeposit"),
            tooltip = PALocale.getResourceMessage("PABMenu_HideNoDeposit_T"),
            getFunc = function() return PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].hideNoDepositMsg end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].hideNoDepositMsg = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PABMenu_HideAll"),
            tooltip = PALocale.getResourceMessage("PABMenu_HideAll_T"),
            getFunc = function() return PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].hideAllMsg end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].hideAllMsg = value end,
            width = "half",
            disabled = function() return not PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })
    end

    -- =================================================================================================================

    if (PAL) then
        -- ---------------------- --
        -- PersonalAssistant Loot --
        -- ---------------------- --
        optionsTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PALMenu_Header"),
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PALMenu_Enable"),
            tooltip = PALocale.getResourceMessage("PALMenu_Enable_T"),
            getFunc = PAMenu_Functions.getFunc.PALoot.enabled,
            setFunc = PAMenu_Functions.setFunc.PALoot.enabled,
            default = PAMenu_Defaults.defaultSettings.PALoot.enabled,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PALMenu_LootGold"),
            tooltip = PALocale.getResourceMessage("PALMenu_LootGold_T"),
            getFunc = PAMenu_Functions.getFunc.PALoot.lootGoldEnabled,
            setFunc = PAMenu_Functions.setFunc.PALoot.lootGoldEnabled,
            width = "half",
            disabled = PAMenu_Functions.disabled.PALoot.lootGoldEnabled,
            default = PAMenu_Defaults.defaultSettings.PALoot.lootGoldEnabled,
        })

        optionsTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PALMenu_LootGoldChatMode"),
            tooltip = PALocale.getResourceMessage("PALMenu_LootGoldChatMode_T"),
            choices = PAMenu_Choices.choices.PALoot.lootGoldChatMode,
            choicesValues = PAMenu_Choices.choicesValues.PALoot.lootGoldChatMode,
            getFunc = PAMenu_Functions.getFunc.PALoot.lootGoldChatMode,
            setFunc = PAMenu_Functions.setFunc.PALoot.lootGoldChatMode,
            width = "half",
            disabled = PAMenu_Functions.disabled.PALoot.lootGoldChatMode,
            default = PAMenu_Defaults.defaultSettings.PALoot.lootGoldChatMode,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PALMenu_LootItems"),
            tooltip = PALocale.getResourceMessage("PALMenu_LootItems_T"),
            getFunc = PAMenu_Functions.getFunc.PALoot.lootItemsEnabled,
            setFunc = PAMenu_Functions.setFunc.PALoot.lootItemsEnabled,
            width = "half",
            disabled = PAMenu_Functions.disabled.PALoot.lootItemsEnabled,
            default = PAMenu_Defaults.defaultSettings.PALoot.lootItemsEnabled,
        })

        optionsTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PALMenu_LootItemsChatMode"),
            tooltip = PALocale.getResourceMessage("PALMenu_LootItemsChatMode_T"),
            choices = PAMenu_Choices.choices.PALoot.lootItemsChatMode,
            choicesValues = PAMenu_Choices.choicesValues.PALoot.lootItemsChatMode,
            getFunc = PAMenu_Functions.getFunc.PALoot.lootItemsChatMode,
            setFunc = PAMenu_Functions.setFunc.PALoot.lootItemsChatMode,
            width = "half",
            disabled = PAMenu_Functions.disabled.PALoot.lootItemsChatMode,
            default = PAMenu_Defaults.defaultSettings.PALoot.lootItemsChatMode,
        })

        optionsTable:insert({
            type = "submenu",
            name = PALocale.getResourceMessage("PALMenu_HarvestableItems"),
            tooltip = PALocale.getResourceMessage("PALMenu_HarvestableItems_T"),
            controls = PALHarvestableItemSubmenuTable,
        })

        optionsTable:insert({
            type = "submenu",
            name = PALocale.getResourceMessage("PALMenu_LootableItems"),
            tooltip = PALocale.getResourceMessage("PALMenu_LootableItems_T"),
            controls = PALLootableItemSubmenuTable,
        })
    end

    -- =================================================================================================================

    if (PAJ) then
        -- ------------------------- --
        -- PersonalAssistant Junk --
        -- ------------------------- --
        optionsTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PAJMenu_Header"),
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PAJMenu_Enable"),
            tooltip = PALocale.getResourceMessage("PAJMenu_Enable_T"),
            getFunc = function() return PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].enabled end,
            setFunc = function(value) PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].enabled = value end,
            default = false,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PAJMenu_AutoSellJunk"),
            tooltip = PALocale.getResourceMessage("PAJMenu_AutoSellJunk_T"),
            getFunc = function() return PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].autoSellJunk end,
            setFunc = function(value) PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].autoSellJunk = value end,
            disabled = function() return not PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].enabled end,
            default = true,
        })

        optionsTable:insert({
            type = "description",
            text = PALocale.getResourceMessage("PAJMenu_ItemTypeDesc"),
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PAJMenu_AutoMarkTrash"),
            tooltip = PALocale.getResourceMessage("PAJMenu_AutoMarkTrash_T"),
            getFunc = function() return PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].autoMarkTrash end,
            setFunc = function(value) PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].autoMarkTrash = value end,
            disabled = function() return not PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].enabled end,
            default = true,
        })

        optionsTable:insert({
            type = "checkbox",
            name = PALocale.getResourceMessage("PAJMenu_HideAll"),
            tooltip = PALocale.getResourceMessage("PAJMenu_HideAll_T"),
            getFunc = function() return PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].hideAllMsg end,
            setFunc = function(value) PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].hideAllMsg = value end,
            disabled = function() return not PA.savedVars.Junk[PA.savedVars.Profile.activeProfile].enabled end,
            default = false,
        })
    end
end


-- =================================================================================================================
-- =================================================================================================================


function PA_SettingsMenu.createPABItemSubMenu()
    if (PAB) then

        PABItemTypeSubmenuTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PABMenu_DepStackOnly"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepStackOnly_T"),
            choices = {PALocale.getResourceMessage("ST_MoveAllFull"), PALocale.getResourceMessage("ST_MoveExistingFull"), PALocale.getResourceMessage("ST_FillIncompleteOnly")},
            getFunc = function() return MenuHelper.getStackTypeTextFromNumber(PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].itemsDepStackType) end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].itemsDepStackType = MenuHelper.getStackTypeNumberFromText(value) end,
            width = "half",
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
            default = false,
        })

        PABItemTypeSubmenuTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PABMenu_WitStackOnly"),
            tooltip = PALocale.getResourceMessage("PABMenu_WitStackOnly_T"),
            choices = {PALocale.getResourceMessage("ST_MoveAllFull"), PALocale.getResourceMessage("ST_MoveExistingFull"), PALocale.getResourceMessage("ST_FillIncompleteOnly")},
            getFunc = function() return MenuHelper.getStackTypeTextFromNumber(PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].itemsWitStackType) end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].itemsWitStackType = MenuHelper.getStackTypeNumberFromText(value) end,
            width = "half",
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
            default = false,
        })

        PABItemTypeSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PABMenu_ItemJunk_Header"),
        })

        PABItemTypeSubmenuTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PABMenu_DepItemJunk"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepItemJunk_T"),
            choices = {PALocale.getResourceMessage("PAB_ItemType_None"), PALocale.getResourceMessage("PAB_ItemType_Deposit"), PALocale.getResourceMessage("PAB_ItemType_Withdrawal"), PALocale.getResourceMessage("PAB_ItemType_Inherit")},
            getFunc = function() return MenuHelper.getBankingTextFromNumber() end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].itemsJunkSetting = MenuHelper.getBankingNumberFromText(value) end,
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
            default = PALocale.getResourceMessage("PAB_ItemType_None"),
        })

        PABItemTypeSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PABMenu_ItemType_Header"),
        })

        for i = 1, #PABItemTypes do
            -- only add if the itemType is enabled
            if PABItemTypes[i] ~= "" then
                PABItemTypeSubmenuTable:insert({
                    type = "dropdown",
                    name = PALocale.getResourceMessage(PABItemTypes[i]),
                    choices = {PALocale.getResourceMessage("PAB_ItemType_None"), PALocale.getResourceMessage("PAB_ItemType_Deposit"), PALocale.getResourceMessage("PAB_ItemType_Withdrawal")},
                    -- choicesValues
                    -- choicesTooltips
                    getFunc = function() return MenuHelper.getBankingTextFromNumber(PABItemTypes[i]) end,
                    setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].ItemTypes[PABItemTypes[i]] = MenuHelper.getBankingNumberFromText(value) end,
                    width = "half",
                    disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
                    default = PALocale.getResourceMessage("PAB_ItemType_None"),
                })

                -- i = index in table
                -- PABItemTypes[i] = unique constant number of itemType
            end
        end

        PABItemTypeSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PABMenu_DepButton"),
            tooltip = PALocale.getResourceMessage("PABMenu_DepButton_T"),
            func = function() MenuHelper.setPABDepositAll() end,
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
        })

        PABItemTypeSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PABMenu_WitButton"),
            tooltip = PALocale.getResourceMessage("PABMenu_WitButton_T"),
            func = function() MenuHelper.setPABWithdrawalAll() end,
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
        })

        PABItemTypeSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PABMenu_IgnButton"),
            tooltip = PALocale.getResourceMessage("PABMenu_IgnButton_T"),
            func = function() MenuHelper.setPABIgnoreAll() end,
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
        })
    end
end


-- =================================================================================================================


function PA_SettingsMenu.createPABItemAdvancedSubMenu()
    if (PAB) then

        local advancedItemIndex = 0		-- 0 = Lockpick

        PABItemTypeAdvancedSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PABMenu_Lockipck_Header"),
        })

        PABItemTypeAdvancedSubmenuTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("REL_Operator"),
            choices = {PALocale.getResourceMessage("REL_None"), PALocale.getResourceMessage("REL_Equal"), PALocale.getResourceMessage("REL_LessThanEqual"), PALocale.getResourceMessage("REL_GreaterThanEqual")},
            -- choicesValues
            -- choicesTooltips
            getFunc = function() return MenuHelper.getOperatorTextFromNumber(advancedItemIndex) end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].ItemTypesAdvanced[advancedItemIndex].Key = MenuHelper.getOperatorNumberFromText(value) end,
            width = "half",
            disabled = function() return not (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabled and PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].enabledItems) end,
            default = PALocale.getResourceMessage("REL_None"),
        })

        PABItemTypeAdvancedSubmenuTable:insert({
            type = "editbox",
            name = PALocale.getResourceMessage("PABMenu_Keep_in_Backpack"),
            tooltip = PALocale.getResourceMessage("PABMenu_Keep_in_Backpack_T"),
            getFunc = function() return PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].ItemTypesAdvanced[advancedItemIndex].Value end,
            setFunc = function(value) PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].ItemTypesAdvanced[advancedItemIndex].Value = tonumber(value) end,
            width = "half",
            disabled = function() return (PA.savedVars.Banking[PA.savedVars.Profile.activeProfile].ItemTypesAdvanced[advancedItemIndex].Key == PAC_OPERATOR_NONE) end,
            default = 100,
        })
    end
end


-- =================================================================================================================


function PA_SettingsMenu.createPALHarvestableItemSubMenu()
    if (PAL) then

        PALHarvestableItemSubmenuTable:insert({
            type = "description",
            text = PALocale.getResourceMessage("PALMenu_HarvestableItemsDesc"),
        })

        PALHarvestableItemSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PALMenu_HarvestableItems_Bait_Header"),
        })

        PALHarvestableItemSubmenuTable:insert({
            type = "dropdown",
            name = PALocale.getResourceMessage("PALMenu_HarvestableItems_Bait"),
            tooltip = PALocale.getResourceMessage("PALMenu_HarvestableItems_Bait_T"),
            choices = PAMenu_Choices.choices.PALoot.harvestableBaitLootMode,
            choicesValues = PAMenu_Choices.choicesValues.PALoot.harvestableBaitLootMode,
            choicesTooltips = PAMenu_Choices.choicesTooltips.PALoot.harvestableBaitLootMode,
            getFunc = PAMenu_Functions.getFunc.PALoot.harvestableBaitLootMode,
            setFunc = PAMenu_Functions.setFunc.PALoot.harvestableBaitLootMode,
            disabled = PAMenu_Functions.disabled.PALoot.harvestableBaitLootMode,
            default = PAMenu_Defaults.defaultSettings.PALoot.harvestableBaitLootMode,
        })

        PALHarvestableItemSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PALMenu_HarvestableItems_Header"),
        })

        for index, itemType in pairs(PALHarvestableItemTypes) do
            PALHarvestableItemSubmenuTable:insert({
                type = "dropdown",
                name = PALocale.getResourceMessage(itemType),
                choices = PAMenu_Choices.choices.PALoot.itemTypesLootMode,
                choicesValues = PAMenu_Choices.choicesValues.PALoot.itemTypesLootMode,
                choicesTooltips = PAMenu_Choices.choicesTooltips.PALoot.itemTypesLootMode,
                getFunc = function() return PAMenu_Functions.getFunc.PALoot.harvestableItemTypesLootMode(itemType) end,
                setFunc = function(value) PAMenu_Functions.setFunc.PALoot.harvestableItemTypesLootMode(itemType, value) end,
                width = "half",
                disabled = PAMenu_Functions.disabled.PALoot.harvestableItemTypesLootMode,
                default = PAMenu_Defaults.defaultSettings.PALoot.harvestableItemTypesLootMode,
            })
        end

        PALHarvestableItemSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PALMenu_AutoLootAllButton"),
            tooltip = PALocale.getResourceMessage("PALMenu_AutoLootAllButton_T"),
            func = PAMenu_Functions.func.PALoot.autoLootAllHarvestableButton,
            disabled = PAMenu_Functions.disabled.PALoot.autoLootAllHarvestableButton,
        })

        PALHarvestableItemSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PALMenu_IgnButton"),
            tooltip = PALocale.getResourceMessage("PALMenu_IgnButton_T"),
            func = PAMenu_Functions.func.PALoot.ignoreAllHarvestableButton,
            disabled = PAMenu_Functions.disabled.PALoot.ignoreAllHarvestableButton,
        })
    end
end

-- =================================================================================================================

function PA_SettingsMenu.createPALLootableItemSubMenu()
    if (PAL) then

        PALLootableItemSubmenuTable:insert({
            type = "description",
            text = PALocale.getResourceMessage("PALMenu_LootableItemsDesc"),
        })

        PALLootableItemSubmenuTable:insert({
            type = "header",
            name = PALocale.getResourceMessage("PALMenu_LootableItems_Header"),
        })

        for index, itemType in pairs(PALLootableItemTypes) do
            PALLootableItemSubmenuTable:insert({
                type = "dropdown",
                name = PALocale.getResourceMessage(itemType),
                choices = PAMenu_Choices.choices.PALoot.itemTypesLootMode,
                choicesValues = PAMenu_Choices.choicesValues.PALoot.itemTypesLootMode,
                choicesTooltips = PAMenu_Choices.choicesTooltips.PALoot.itemTypesLootMode,
                getFunc = function() return PAMenu_Functions.getFunc.PALoot.lootableItemTypesLootMode(itemType) end,
                setFunc = function(value) PAMenu_Functions.setFunc.PALoot.lootableItemTypesLootMode(itemType, value) end,
                width = "half",
                disabled = PAMenu_Functions.disabled.PALoot.lootableItemTypesLootMode,
                default = PAMenu_Defaults.defaultSettings.PALoot.lootableItemTypesLootMode,
            })
        end

        PALLootableItemSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PALMenu_AutoLootAllButton"),
            tooltip = PALocale.getResourceMessage("PALMenu_AutoLootAllButton_T"),
            func = PAMenu_Functions.func.PALoot.autoLootAllLootableButton,
            disabled = PAMenu_Functions.disabled.PALoot.autoLootAllLootableButton,
        })

        PALLootableItemSubmenuTable:insert({
            type = "button",
            name = PALocale.getResourceMessage("PALMenu_IgnButton"),
            tooltip = PALocale.getResourceMessage("PALMenu_IgnButton_T"),
            func = PAMenu_Functions.func.PALoot.ignoreAllLootableButton,
            disabled = PAMenu_Functions.disabled.PALoot.ignoreAllLootableButton,
        })

    end
end