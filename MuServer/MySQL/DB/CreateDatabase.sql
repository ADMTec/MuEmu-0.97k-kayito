-- ----------------------------------------------------------------------------
-- DATABASE MuOnline97
-- ----------------------------------------------------------------------------
CREATE DATABASE `MuOnline97`;
USE `MuOnline97`;

-- ----------------------------------------------------------------------------
-- Table AccountCharacter
-- ----------------------------------------------------------------------------
CREATE TABLE `AccountCharacter` (
	`Id` VARCHAR(10) NOT NULL,
	`GameID1` VARCHAR(10) NULL,
	`GameID2` VARCHAR(10) NULL,
	`GameID3` VARCHAR(10) NULL,
	`GameID4` VARCHAR(10) NULL,
	`GameID5` VARCHAR(10) NULL,
	`GameIDC` VARCHAR(10) NULL,
	CONSTRAINT PK_AccountCharacter PRIMARY KEY (`Id`)
);

-- ----------------------------------------------------------------------------
-- Table Character
-- ----------------------------------------------------------------------------
CREATE TABLE `Character` (
	`AccountID` VARCHAR(10) NOT NULL,
	`Name` VARCHAR(10) NOT NULL,
	`ResetCount` INT UNSIGNED NOT NULL DEFAULT 0,
	`GrandResetCount` INT UNSIGNED NOT NULL DEFAULT 0,
	`cLevel` INT UNSIGNED NOT NULL DEFAULT 1,
	`LevelUpPoint` INT UNSIGNED NULL DEFAULT 0,
	`Class` TINYINT UNSIGNED NULL,
	`Experience` INT UNSIGNED NULL DEFAULT 0,
	`Strength` INT UNSIGNED NULL,
	`Dexterity` INT UNSIGNED NULL,
	`Vitality` INT UNSIGNED NULL,
	`Energy` INT UNSIGNED NULL,
	`Inventory` VARBINARY(760) NULL,
	`MagicList` VARBINARY(180) NULL,
	`Money` INT UNSIGNED NULL DEFAULT 0,
	`Life` INT UNSIGNED NULL,
	`MaxLife` INT UNSIGNED NULL,
	`Mana` INT UNSIGNED NULL,
	`MaxMana` INT UNSIGNED NULL,
	`BP` INT UNSIGNED NULL,
	`MaxBP` INT UNSIGNED NULL,
	`MapNumber` TINYINT UNSIGNED NULL,
	`MapPosX` TINYINT UNSIGNED NULL,
	`MapPosY` TINYINT UNSIGNED NULL,
	`MapDir` TINYINT UNSIGNED NULL DEFAULT 0,
	`PkCount` INT UNSIGNED NULL DEFAULT 0,
	`PkLevel` INT NULL DEFAULT 3,
	`PkTime` INT UNSIGNED NULL DEFAULT 0,
	`CtlCode` TINYINT UNSIGNED NULL DEFAULT 0,
	`Bloc_Expire` DATETIME NULL,
	`Quest` VARBINARY(50) NULL DEFAULT 0,
	`FruitPoint` INT NULL DEFAULT 0,
	`EffectList` VARBINARY(208) NULL,
	`FruitAddPoint` INT NOT NULL DEFAULT 0,
	`FruitSubPoint` INT NOT NULL DEFAULT 0,
	CONSTRAINT PK_Character PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table DefaultClassType
-- ----------------------------------------------------------------------------
CREATE TABLE `DefaultClassType` (
	`Class` TINYINT UNSIGNED NOT NULL,
	`Level` INT UNSIGNED NULL DEFAULT 0,
	`LevelUpPoint` INT UNSIGNED NULL DEFAULT 0,
	`Strength` INT UNSIGNED NULL,
	`Dexterity` INT UNSIGNED NULL,
	`Vitality` INT UNSIGNED NULL,
	`Energy` INT UNSIGNED NULL,
	`Inventory` VARBINARY(760) NULL,
	`MagicList` VARBINARY(180) NULL,
	`Life` INT UNSIGNED NULL,
	`MaxLife` INT UNSIGNED NULL,
	`Mana` INT UNSIGNED NULL,
	`MaxMana` INT UNSIGNED NULL,
	`MapNumber` TINYINT UNSIGNED NULL,
	`MapPosX` TINYINT UNSIGNED NULL,
	`MapPosY` TINYINT UNSIGNED NULL,
	`Quest` VARBINARY(50) NULL,
	`EffectList` VARBINARY(208) NULL,
	CONSTRAINT PK_DefaultClassType PRIMARY KEY (`Class`)
);

-- ----------------------------------------------------------------------------
-- Table ExtWarehouse
-- ----------------------------------------------------------------------------
CREATE TABLE `ExtWarehouse` (
	`AccountID` VARCHAR(10) NOT NULL,
	`Number` INT UNSIGNED NULL,
	`Items` VARBINARY(1920) NULL,
	`Money` INT UNSIGNED NULL
);

CREATE INDEX IX_ExtWarehouse_AccountID ON ExtWarehouse (AccountID);

-- ----------------------------------------------------------------------------
-- Table GameServerInfo
-- ----------------------------------------------------------------------------
CREATE TABLE `GameServerInfo` (
	`Number` INT UNSIGNED NOT NULL DEFAULT 0,
	`ItemCount` INT UNSIGNED NOT NULL,
	CONSTRAINT PK_GameServerInfo PRIMARY KEY (`Number`)
);

-- ----------------------------------------------------------------------------
-- Table GoldenArcherCoin
-- ----------------------------------------------------------------------------
CREATE TABLE `GoldenArcherCoin` (
	`AccountID` VARCHAR(10) NOT NULL,
	`Renas` INT UNSIGNED NOT NULL DEFAULT 0,
	`Stones` INT UNSIGNED NOT NULL DEFAULT 0,
	`LuckyNumber` CHAR(12) NULL,
	CONSTRAINT PK_GoldenArcherCoin PRIMARY KEY (`AccountID`)
);

-- ----------------------------------------------------------------------------
-- Table GoldenArcherLuckyNumbers
-- ----------------------------------------------------------------------------
CREATE TABLE `GoldenArcherLuckyNumbers` (
	`AccountID` VARCHAR(10) NOT NULL,
	`LuckyNumber` CHAR(12) NOT NULL
);

CREATE INDEX IX_GoldenArcherLuckyNumbers_AccountID ON GoldenArcherLuckyNumbers (AccountID);

-- ----------------------------------------------------------------------------
-- Table Guild
-- ----------------------------------------------------------------------------
CREATE TABLE `Guild` (
	`Number` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`G_Name` VARCHAR(8) NOT NULL,
	`G_Mark` VARBINARY(32) NULL,
	`G_Score` INT UNSIGNED NULL DEFAULT 0,
	`G_Master` VARCHAR(10) NULL,
	`G_Notice` VARCHAR(60) NULL,
	CONSTRAINT PK_Guild PRIMARY KEY (`Number`)
);

-- ----------------------------------------------------------------------------
-- Table GuildMember
-- ----------------------------------------------------------------------------
CREATE TABLE `GuildMember` (
	`Name` VARCHAR(10) NOT NULL,
	`G_Name` VARCHAR(8) NOT NULL,
	`G_Status` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	CONSTRAINT PK_GuildMember PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table MEMB_INFO
-- ----------------------------------------------------------------------------
CREATE TABLE `MEMB_INFO` (
	`memb___id` VARCHAR(10) NOT NULL,
	`memb__pwd` VARCHAR(10) NOT NULL,
	`memb_name` VARCHAR(10) NOT NULL,
	`mail_addr` VARCHAR(50) NULL,
	`sno__numb` CHAR(18) NOT NULL,
	`AccountLevel` INT NOT NULL DEFAULT 0,
	`AccountExpireDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`bloc_code` CHAR(1) NOT NULL,
	`Bloc_Expire` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT PK_MEMB_INFO PRIMARY KEY (`memb___id`)
);

-- ----------------------------------------------------------------------------
-- Table MEMB_STAT
-- ----------------------------------------------------------------------------
CREATE TABLE `MEMB_STAT` (
	`memb___id` VARCHAR(10) NOT NULL,
	`ConnectStat` TINYINT UNSIGNED NULL,
	`ServerName` VARCHAR(50) NULL,
	`IP` VARCHAR(15) NULL,
	`ConnectTM` DATETIME NULL,
	`DisConnectTM` DATETIME NULL,
	`OnlineHours` INT UNSIGNED NULL DEFAULT 0,
	CONSTRAINT PK_MEMB_STAT PRIMARY KEY (`memb___id`)
);

-- ----------------------------------------------------------------------------
-- Table OptionData
-- ----------------------------------------------------------------------------
CREATE TABLE `OptionData` (
	`Name` VARCHAR(10) NOT NULL,
	`SkillKey` BINARY(10) NULL,
	`GameOption` TINYINT UNSIGNED NULL,
	`Qkey` TINYINT UNSIGNED NULL,
	`Wkey` TINYINT UNSIGNED NULL,
	`Ekey` TINYINT UNSIGNED NULL,
	`ChatWindow` TINYINT UNSIGNED NULL,
	CONSTRAINT PK_OptionData PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table RankingBloodCastle
-- ----------------------------------------------------------------------------
CREATE TABLE `RankingBloodCastle` (
	`Name` VARCHAR(10) NOT NULL,
	`Score` INT UNSIGNED NULL,
	CONSTRAINT PK_RankingBloodCastle PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table RankingDevilSquare
-- ----------------------------------------------------------------------------
CREATE TABLE `RankingDevilSquare` (
	`Name` VARCHAR(10) NOT NULL,
	`Score` INT UNSIGNED NULL,
	CONSTRAINT PK_RankingDevilSquare PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table ResetInfo
-- ----------------------------------------------------------------------------
CREATE TABLE `ResetInfo` (
	`Name` VARCHAR(10) NOT NULL,
	`ResetDay` INT UNSIGNED NOT NULL DEFAULT 0,
	`ResetDayDate` DATETIME NULL,
	`ResetWek` INT UNSIGNED NOT NULL DEFAULT 0,
	`ResetWekDate` DATETIME NULL,
	`ResetMon` INT UNSIGNED NOT NULL DEFAULT 0,
	`ResetMonDate` DATETIME NULL,
	`GrandResetDay` INT UNSIGNED NOT NULL DEFAULT 0,
	`GrandResetDayDate` DATETIME NULL,
	`GrandResetWek` INT UNSIGNED NOT NULL DEFAULT 0,
	`GrandResetWekDate` DATETIME NULL,
	`GrandResetMon` INT UNSIGNED NOT NULL DEFAULT 0,
	`GrandResetMonDate` DATETIME NULL,
	CONSTRAINT PK_ResetInfo PRIMARY KEY (`Name`)
);

-- ----------------------------------------------------------------------------
-- Table warehouse
-- ----------------------------------------------------------------------------
CREATE TABLE `warehouse` (
	`AccountID` VARCHAR(10) NOT NULL,
	`Items` VARBINARY(1200) NULL,
	`Money` INT UNSIGNED NULL DEFAULT 0,
	`pw` SMALLINT NULL DEFAULT 0,
	CONSTRAINT PK_warehouse PRIMARY KEY (`AccountID`)
);

-- ----------------------------------------------------------------------------
-- Poblate table DefaultClassType with default values
-- ----------------------------------------------------------------------------

INSERT `DefaultClassType` (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (0, 1, 0, 18, 18, 15, 30,  0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 60, 60, 60, 60, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
INSERT `DefaultClassType` (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (16, 1, 0, 28, 20, 25, 10, 0x20001200000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 110, 110, 20, 20, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
INSERT `DefaultClassType` (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (32, 1, 0, 22, 25, 20, 15, 0x8F00FF0000000000000480001400000000000004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 80, 80, 30, 30, 3, 172, 97, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
INSERT `DefaultClassType` (Class, Level, LevelUpPoint, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, MapNumber, MapPosX, MapPosY, Quest, EffectList) VALUES (48, 1, 0, 26, 26, 26, 26, 0x01001600000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 110, 110, 60, 60, 0, 125, 125, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);

-- ----------------------------------------------------------------------------
-- Routine WZ_CONNECT_MEMB
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_CONNECT_MEMB`(
	IN inAccountID varchar(10),
	IN inServerName varchar(50),
	IN inIpAddress varchar(20)
)
BEGIN
	SET @find_id = 'NOT';
	SET @ConnectStat = 1;

	SELECT S.memb___id INTO @find_id
	FROM `MEMB_STAT` S INNER JOIN `MEMB_INFO` I ON S.memb___id = I.memb___id
	WHERE I.memb___id = `inAccountID`;

	IF (@find_id = 'NOT') THEN
		INSERT INTO `MEMB_STAT` (memb___id, ConnectStat, ServerName, IP, ConnectTM)
		VALUES (`inAccountID`, @ConnectStat, `inServerName`, `inIpAddress`, NOW());
	ELSE
		UPDATE `MEMB_STAT`
		SET ConnectStat = @ConnectStat, ServerName = `inServerName`, IP = `inIpAddress`, ConnectTM = NOW()
		WHERE memb___id = `inAccountID`;
	END IF;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_DISCONNECT_MEMB
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_DISCONNECT_MEMB`(
	IN inAccountID VARCHAR(10)
)
BEGIN
	UPDATE `MEMB_STAT`
	SET ConnectStat = 0, DisConnectTM = NOW(), OnlineHours = OnlineHours + TIMESTAMPDIFF(HOUR, ConnectTM, NOW())
	WHERE memb___id = `inAccountID`;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_DesblocAccount
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_DesblocAccount`(
	IN inAccountID VARCHAR(10)
)
BEGIN
	UPDATE `MEMB_INFO`
	SET bloc_code = 0
	WHERE memb___id = `inAccountID` AND bloc_code = 1 AND bloc_expire < NOW();
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_DesblocCharacters
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_DesblocCharacters`(
	IN inAccountID VARCHAR(10)
)
BEGIN
	UPDATE `Character`
	SET CtlCode = 0
	WHERE AccountID = `inAccountID` AND CtlCode = 1 AND bloc_expire < NOW();
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_GetAccountLevel
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_GetAccountLevel` (
	IN inAccountID VARCHAR(10)
)
BEGIN
	SELECT AccountLevel, AccountExpireDate INTO @CurrentAccountLevel, @CurrentAccountExpireDate
	FROM `MEMB_INFO`
	WHERE memb___id = `inAccountID`;

	IF (@CurrentAccountLevel <> 0 AND NOW() >= @CurrentAccountExpireDate) THEN
		SET @CurrentAccountLevel = 0;

		UPDATE `MEMB_INFO`
		SET AccountLevel = 0
		WHERE memb___id = `inAccountID`;
	END IF;

	SELECT @CurrentAccountLevel AS AccountLevel, @CurrentAccountExpireDate AS AccountExpireDate;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_SetAccountLevel
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_SetAccountLevel`(
	IN inAccountID VARCHAR(10),
	IN inAccountLevel INT,
	IN inAccountExpireTime INT
)
BEGIN
	SELECT AccountLevel, AccountExpireDate INTO @CurrentAccountLevel, @CurrentAccountExpireDate
	FROM `MEMB_INFO`
	WHERE memb___id = `inAccountID`;

	IF (@CurrentAccountLevel = `inAccountLevel`) THEN
		SET @CurrentAccountExpireDate = DATE_ADD(@CurrentAccountExpireDate, INTERVAL `inAccountExpireTime` SECOND);
	ELSE
		SET @CurrentAccountLevel = `inAccountLevel`;
		SET @CurrentAccountExpireDate = DATE_ADD(NOW(), INTERVAL `inAccountExpireTime` SECOND);
	END IF;

	UPDATE `MEMB_INFO`
	SET AccountLevel = @CurrentAccountLevel, AccountExpireDate = @CurrentAccountExpireDate
	WHERE memb___id = `inAccountID`;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_CreateCharacter
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_CreateCharacter`(
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10),
	IN inCharClass TINYINT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 0 AS Result;
	END;

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'Invalid character name or name supplied already exists.'
	-- -- Return 2 will show: 'No more characters can be created.'
	SET @Result = 1;

	IF EXISTS (SELECT 1 FROM `Character` WHERE Name = `inCharName`) THEN
		SET @Result = 0;
	ELSE
		START TRANSACTION;
		IF NOT EXISTS (SELECT 1 FROM `AccountCharacter` WHERE Id = `inAccountID`) THEN
			INSERT INTO `AccountCharacter` (Id, GameID1) VALUES (`inAccountID`, `inCharName`);
		ELSEIF NOT EXISTS (
				SELECT 1 FROM `AccountCharacter`
				WHERE Id = `inAccountID`
					AND (GameID1 IS NULL
						OR GameID2 IS NULL
						OR GameID3 IS NULL
						OR GameID4 IS NULL
						OR GameID5 IS NULL)

			) THEN
				SET @Result = 2;
		END IF;

		IF @Result <> 1 THEN
			ROLLBACK;
		ELSE
			INSERT INTO `Character` (AccountID, Name, cLevel, LevelUpPoint, Class, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, BP, MaxBP, MapNumber, MapPosX, MapPosY, Quest, EffectList)
			SELECT `inAccountID`, `inCharName`, Level, LevelUpPoint, `inCharClass`, Strength, Dexterity, Vitality, Energy, Inventory, MagicList, Life, MaxLife, Mana, MaxMana, 0, 0, MapNumber, MapPosX, MapPosY, Quest, EffectList
			FROM `DefaultClassType` WHERE Class = `inCharClass`;
			COMMIT;
		END IF;
	END IF;

	SELECT @Result AS Result;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_DeleteCharacter
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_DeleteCharacter`(
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10)
)
BEGIN
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 1 AS Result;

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'You cannot delete a character with guild.'
	-- -- Return 2 will show: 'You have entered an invalid personal ID number.'
	-- -- Return 3 will show: 'This is an item-blocked character.'
	SET @Result = 1;

	IF NOT EXISTS (SELECT 1 FROM `Character` WHERE Name = `inCharName`) THEN
		SET @Result = 0;
	ELSE
		DELETE FROM `Character` WHERE AccountID = `inAccountID` AND Name = `inCharName`;
		DELETE FROM `ResetInfo` WHERE Name = `inCharName`;
		DELETE FROM `OptionData` WHERE Name = `inCharName`;
		DELETE FROM `RankingBloodCastle` WHERE Name = `inCharName`;
		DELETE FROM `RankingDevilSquare` WHERE Name = `inCharName`;

		UPDATE AccountCharacter
			SET GameID1 = NULLIF(GameID1, @inCharName),
				GameID2 = NULLIF(GameID2, @inCharName),
				GameID3 = NULLIF(GameID3, @inCharName),
				GameID4 = NULLIF(GameID4, @inCharName),
				GameID5 = NULLIF(GameID5, @inCharName),
				GameIDC = NULLIF(GameIDC, @inCharName)
			WHERE Id = @inAccountID
			AND (GameID1 = @inCharName
				OR GameID2 = @inCharName
				OR GameID3 = @inCharName
				OR GameID4 = @inCharName
				OR GameID5 = @inCharName
				OR GameIDC = @inCharName);
	END IF;

	SELECT @Result AS Result;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_GuildCreate
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_GuildCreate`(
	IN inGuildName VARCHAR(8),
	IN inCharName VARCHAR(10)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 6 AS Result;
	END;

	-- Results cases:
	-- -- Return 1 if success
	-- -- Return 0 will show: 'The guild name already exists.'
	-- -- Return 2 will show: 'The guild name must be at least 2 characters long.'
	-- -- Return 3 will show: 'You are already in a guild.'
	-- -- Return 4 will show: 'No space allowed in guild names.'
	-- -- Return 5 will show: 'No symbols allowed in guild names.'
	-- -- Return 6 will show: 'Create guild failed.'
	SET @ErrorCode = 1;

	START TRANSACTION;

	INSERT INTO `Guild` (G_Name, G_Master)
	VALUES (`inGuildName`, `inCharName`);

	IF (ROW_COUNT() = 0) THEN
		SET @ErrorCode = 6;
	ELSE
		INSERT INTO `GuildMember` (Name, G_Name)
		VALUES (`inCharName`, `inGuildName`);

		IF (ROW_COUNT() = 0) THEN
			SET @ErrorCode = 6;
		END IF;
	END IF;

	IF (@ErrorCode <> 1) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;

	SELECT @ErrorCode as Result;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_SetGuildDelete
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_SetGuildDelete`(
	IN inGuildName VARCHAR(10)
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 3 AS Result;
	END;

	-- Results cases:
	-- -- Return 1 if success on member, will show 'You have just left the guild.'
	-- -- Return 4 if success on master, will show: 'The guild has been dissolved'
	-- -- Return 0 will show: 'Your personal ID number is incorrect.'
	-- -- Return 2 will show: 'Only the guild master can disband a guild.'
	-- -- Return 3 will show: 'There was an error deleting the guild'
	SET @Result = 1;

	START TRANSACTION;

	DELETE FROM `GuildMember`
	WHERE G_Name = `inGuildName`;

	IF (ROW_COUNT() = 0) THEN
		SET @Result = 3;
	ELSE
		DELETE FROM `Guild`
		WHERE G_Name = `inGuildName`;

		IF (ROW_COUNT() = 0) THEN
			SET @Result = 3;
		END IF;
	END IF;

	IF (@Result <> 1) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;

	SELECT @Result AS Result;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_GetGrandResetInfo
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_GetGrandResetInfo` (
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10)
)
BEGIN
	IF NOT EXISTS (SELECT * FROM `ResetInfo` WHERE Name = `inCharName`) THEN
		INSERT INTO `ResetInfo` (Name) VALUES (`inCharName`);
	END IF;

	SELECT GrandResetCount INTO @GrandReset
	FROM `Character`
	WHERE AccountID = `inAccountID` AND Name = `inCharName`;

	SELECT GrandResetDay, GrandResetDayDate, GrandResetWek, GrandResetWekDate, GrandResetMon, GrandResetMonDate
	INTO @GrandResetDay, @GrandResetDayDate, @GrandResetWek, @GrandResetWekDate, @GrandResetMon, @GrandResetMonDate
	FROM `ResetInfo`
	WHERE Name = `InCharName`;

	IF DATEDIFF(NOW(), @GrandResetDayDate) > 0 THEN
		SET @GrandResetDay = 0;
		UPDATE `ResetInfo` SET GrandResetDay = 0 WHERE Name = `InCharName`;
	END IF;

	IF DATEDIFF(NOW(), @GrandResetWekDate) > 0 THEN
		SET @GrandResetWek = 0;
		UPDATE `ResetInfo` SET GrandResetWek = 0 WHERE Name = `InCharName`;
	END IF;

	IF DATEDIFF(NOW(), @GrandResetMonDate) > 0 THEN
		SET @GrandResetMon = 0;
		UPDATE `ResetInfo` SET GrandResetMon = 0 WHERE Name = `InCharName`;
	END IF;

	SELECT @GrandReset AS GrandReset, @GrandResetDay AS GrandResetDay, @GrandResetWek AS GrandResetWek, @GrandResetMon AS GrandResetMon;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_SetGrandResetInfo
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_SetGrandResetInfo`(
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10),
	IN inReset INT,
	IN inGrandReset INT,
	IN inGrandResetDay INT,
	IN inGrandResetWek INT,
	IN inGrandResetMon INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;

	START TRANSACTION;

	UPDATE `Character`
	SET ResetCount = `inReset`, GrandResetCount = `inGrandReset`
	WHERE AccountID = `inAccountID` AND Name = `inCharName`;

	UPDATE `ResetInfo`
	SET GrandResetDay = `inGrandResetDay`, GrandResetDayDate = NOW(),
		GrandResetWek = `inGrandResetWek`, GrandResetWekDate = NOW(),
		GrandResetMon = `inGrandResetMon`, GrandResetMonDate = NOW()
	WHERE Name = `inCharName`;

	COMMIT;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_GetResetInfo
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_GetResetInfo`(
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10)
)
BEGIN
	IF NOT EXISTS (SELECT * FROM `ResetInfo` WHERE Name = `inCharName`) THEN
		INSERT INTO `ResetInfo` (Name) VALUES (`inCharName`);
	END IF;

	SELECT ResetCount INTO @ResetCount
	FROM `Character`
	WHERE AccountID = `inAccountID` AND Name = `inCharName`;

	SELECT ResetDay, ResetDayDate, ResetWek, ResetWekDate, ResetMon, ResetMonDate
	INTO @ResetDay, @ResetDayDate, @ResetWek, @ResetWekDate, @ResetMon, @ResetMonDate
	FROM `ResetInfo`
	WHERE Name = `inCharName`;

	IF DATEDIFF(NOW(), @ResetDayDate) > 0 THEN
		SET @ResetDay = 0;
		UPDATE `ResetInfo` SET ResetDay = 0 WHERE Name = `inCharName`;
	END IF;

	IF DATEDIFF(NOW(), @ResetWekDate) > 0 THEN
		SET @ResetWek = 0;
		UPDATE `ResetInfo` SET ResetWek = 0 WHERE Name = `inCharName`;
	END IF;

	IF DATEDIFF(NOW(), @ResetMonDate) > 0 THEN
		SET @ResetMon = 0;
		UPDATE `ResetInfo` SET ResetMon = 0 WHERE Name = `inCharName`;
	END IF;

	SELECT @ResetCount AS Reset, @ResetDay AS ResetDay, @ResetWek AS ResetWek, @ResetMon AS ResetMon;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_SetResetInfo
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_SetResetInfo`(
	IN inAccountID VARCHAR(10),
	IN inCharName VARCHAR(10),
	IN inReset INT,
	IN inResetDay INT,
	IN inResetWek INT,
	IN inResetMon INT
)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;

	START TRANSACTION;

	UPDATE `Character`
	SET ResetCount = `inReset`
	WHERE AccountID = `inAccountID` AND Name = `inCharName`;

	UPDATE `ResetInfo`
	SET ResetDay = `inResetDay`, ResetDayDate = NOW(),
		ResetWek = `inResetWek`, ResetWekDate = NOW(),
		ResetMon = `inResetMon`, ResetMonDate = NOW()
	WHERE Name = `inCharName`;

	COMMIT;
END $$

DELIMITER ;

-- ----------------------------------------------------------------------------
-- Routine WZ_GetItemSerial
-- ----------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `WZ_GetItemSerial`()
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT -1 as Result;
	END;

	START TRANSACTION;

	SELECT ItemCount INTO @ItemSerial
	FROM `GameServerInfo`
	WHERE Number = 0;

	IF (@ItemSerial >= 2147483647) THEN -- MAX INTEGER VALUE
		SET @ItemSerial = 1;
	ELSE
		SET @ItemSerial = @ItemSerial + 1;
	END IF;

	UPDATE `GameServerInfo`
	SET ItemCount = @ItemSerial
	WHERE Number = 0;

	IF (ROW_COUNT() = 0) THEN
		ROLLBACK;
		SELECT -1 as Result;
	ELSE
		COMMIT;
		SELECT @ItemSerial as Result;
	END IF;
END $$

DELIMITER ;
