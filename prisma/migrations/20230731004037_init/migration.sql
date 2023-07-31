-- CreateTable
CREATE TABLE `ProfileUser` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bio` TEXT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `userId`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Passwd` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `shadow` TEXT NULL,
    `userId` INTEGER NOT NULL,

    UNIQUE INDEX `userId`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `roleId` INTEGER NOT NULL,

    UNIQUE INDEX `email`(`email`),
    UNIQUE INDEX `roleId`(`roleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Role` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `role` TEXT NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Webhook` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `object` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Webhook_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Entry` (
    `id` BIGINT NOT NULL,
    `timestamp` TIMESTAMP NULL,
    `webhookId` BIGINT NOT NULL,

    UNIQUE INDEX `Entry_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Changes` (
    `id` BIGINT NOT NULL,
    `field` VARCHAR(255) NOT NULL,
    `entryId` BIGINT NULL,

    UNIQUE INDEX `Changes_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Value` (
    `id` BIGINT NOT NULL,
    `messaging_product` VARCHAR(255) NOT NULL,
    `changesId` BIGINT NOT NULL,

    UNIQUE INDEX `Value_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Metadata` (
    `id` BIGINT NOT NULL,
    `display_phone_number` VARCHAR(255) NOT NULL,
    `phone_number_id` VARCHAR(255) NOT NULL,
    `valueId` BIGINT NOT NULL,

    UNIQUE INDEX `Metadata_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Contacts` (
    `id` BIGINT NOT NULL,
    `wa_id` VARCHAR(255) NOT NULL,
    `valueId` BIGINT NOT NULL,

    UNIQUE INDEX `Contacts_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Profile` (
    `id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `contactsId` BIGINT NOT NULL,

    UNIQUE INDEX `Profile_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Status` (
    `id` BIGINT NOT NULL,
    `valueId` BIGINT NULL,

    UNIQUE INDEX `Status_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Conversation` (
    `id` BIGINT NOT NULL,
    `statusId` BIGINT NULL,

    UNIQUE INDEX `Conversation_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Origin` (
    `id` BIGINT NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `conversationId` BIGINT NULL,

    UNIQUE INDEX `Origin_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pricing` (
    `id` BIGINT NOT NULL,
    `billable` BOOLEAN NOT NULL,
    `pricing_model` VARCHAR(191) NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `statusId` BIGINT NULL,

    UNIQUE INDEX `Pricing_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Messages` (
    `id` BIGINT NOT NULL,
    `from` VARCHAR(255) NOT NULL,
    `timestamp` TIMESTAMP NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `valueId` BIGINT NOT NULL,

    UNIQUE INDEX `Messages_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Text` (
    `id` BIGINT NOT NULL,
    `body` TEXT NOT NULL,
    `messagesId` BIGINT NOT NULL,

    UNIQUE INDEX `Text_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ProfileUser` ADD CONSTRAINT `Profile_1` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Passwd` ADD CONSTRAINT `Shadow_1` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `Role_1` FOREIGN KEY (`roleId`) REFERENCES `Role`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Entry` ADD CONSTRAINT `1` FOREIGN KEY (`webhookId`) REFERENCES `Webhook`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Changes` ADD CONSTRAINT `Changes_entryId_fkey` FOREIGN KEY (`entryId`) REFERENCES `Entry`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Value` ADD CONSTRAINT `Value_changesId_fkey` FOREIGN KEY (`changesId`) REFERENCES `Changes`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Metadata` ADD CONSTRAINT `Metadata_valueId_fkey` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Contacts` ADD CONSTRAINT `Contacts_valueId_fkey` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Profile` ADD CONSTRAINT `Profile_contactsId_fkey` FOREIGN KEY (`contactsId`) REFERENCES `Contacts`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Status` ADD CONSTRAINT `Status_valueId_fkey` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Conversation` ADD CONSTRAINT `Conversation_statusId_fkey` FOREIGN KEY (`statusId`) REFERENCES `Status`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Origin` ADD CONSTRAINT `Origin_conversationId_fkey` FOREIGN KEY (`conversationId`) REFERENCES `Conversation`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pricing` ADD CONSTRAINT `Pricing_statusId_fkey` FOREIGN KEY (`statusId`) REFERENCES `Status`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Messages` ADD CONSTRAINT `Messages_valueId_fkey` FOREIGN KEY (`valueId`) REFERENCES `Value`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Text` ADD CONSTRAINT `Text_messagesId_fkey` FOREIGN KEY (`messagesId`) REFERENCES `Messages`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
