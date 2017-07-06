local Aye = Aye;
if not LibStub:NewLibrary("Aye.utils.Lang", 1) then return end;
Aye.utils.Lang = Aye.utils.Lang or {};

-- language translation table
Aye.utils.Lang._langs = {
	deDE = "de",
	enGB = "en",
	enUS = "en",
	esES = "es",
	esMX = "es",
	frFR = "fr",
	itIT = "it",
	koKR = "ko",
	ptBR = "pt",
	ruRU = "ru",
	zhCN = "zh",
	zhTW = "zh",
};

-- get user language
-- defaults to "en"
--
-- @noparam
-- @return {string} /de|en|es|fr|it|ko|pt|ru|cn/ user language
Aye.utils.Lang.getLang = function()
	return Aye.utils.Lang._langs[GetLocale()] or "en";
end;

-- cache user language
Aye.utils.Lang._lang = Aye.utils.Lang.getLang();

-- get localized entry
-- from given translation table
--
-- @param {{}} object with translations
-- 	keys are langs {string} /de|en|es|fr|it|ko|pt|ru|cn/
-- 	values are translations
--
-- @return {string} localized entry
-- @example
--|	print("I speak " ..Aye.utils.Lang.getLocalized({
--|		de = "German",
--|		en = "English",
--|		es = "Spanish",
--|		fr = "French",
--|		it = "Italian",
--|		ko = "Korean",
--|		pt = "Portuguese",
--|		ru = "Russian",
--|		zh = "Chinese",
--|	}) .." language.");
Aye.utils.Lang.getLocalized = function(translations)
	return translations[Aye.utils.Lang._lang];
end;