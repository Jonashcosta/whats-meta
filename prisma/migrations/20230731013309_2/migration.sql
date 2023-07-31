/*
  Warnings:

  - You are about to alter the column `timestamp` on the `Entry` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.
  - You are about to alter the column `timestamp` on the `Messages` table. The data in that column could be lost. The data in that column will be cast from `Timestamp(0)` to `Timestamp`.

*/
-- DropForeignKey
ALTER TABLE `Changes` DROP FOREIGN KEY `Changes_entryId_fkey`;

-- DropForeignKey
ALTER TABLE `Contacts` DROP FOREIGN KEY `Contacts_valueId_fkey`;

-- DropForeignKey
ALTER TABLE `Conversation` DROP FOREIGN KEY `Conversation_statusId_fkey`;

-- DropForeignKey
ALTER TABLE `Entry` DROP FOREIGN KEY `1`;

-- DropForeignKey
ALTER TABLE `Messages` DROP FOREIGN KEY `Messages_valueId_fkey`;

-- DropForeignKey
ALTER TABLE `Metadata` DROP FOREIGN KEY `Metadata_valueId_fkey`;

-- DropForeignKey
ALTER TABLE `Origin` DROP FOREIGN KEY `Origin_conversationId_fkey`;

-- DropForeignKey
ALTER TABLE `Pricing` DROP FOREIGN KEY `Pricing_statusId_fkey`;

-- DropForeignKey
ALTER TABLE `Profile` DROP FOREIGN KEY `Profile_contactsId_fkey`;

-- DropForeignKey
ALTER TABLE `Status` DROP FOREIGN KEY `Status_valueId_fkey`;

-- DropForeignKey
ALTER TABLE `Text` DROP FOREIGN KEY `Text_messagesId_fkey`;

-- DropForeignKey
ALTER TABLE `Value` DROP FOREIGN KEY `Value_changesId_fkey`;

-- AlterTable
ALTER TABLE `Entry` MODIFY `timestamp` TIMESTAMP NULL;

-- AlterTable
ALTER TABLE `Messages` MODIFY `timestamp` TIMESTAMP NOT NULL;

-- AddForeignKey
ALTER TABLE `Entry` ADD CONSTRAINT `1` FOREIGN KEY (`webhookId`) REFERENCES `Webhook`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Changes` ADD CONSTRAINT `2` FOREIGN KEY (`entryId`) REFERENCES `Entry`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Value` ADD CONSTRAINT `3` FOREIGN KEY (`changesId`) REFERENCES `Changes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Metadata` ADD CONSTRAINT `4` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contacts` ADD CONSTRAINT `5` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `6` FOREIGN KEY (`contactsId`) REFERENCES `Contacts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Status` ADD CONSTRAINT `7` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `8` FOREIGN KEY (`statusId`) REFERENCES `Status`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Origin` ADD CONSTRAINT `9` FOREIGN KEY (`conversationId`) REFERENCES `Conversation`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pricing` ADD CONSTRAINT `10` FOREIGN KEY (`statusId`) REFERENCES `Status`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Messages` ADD CONSTRAINT `11` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Text` ADD CONSTRAINT `12` FOREIGN KEY (`messagesId`) REFERENCES `Messages`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
