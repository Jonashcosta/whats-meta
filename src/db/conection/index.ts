import { PrismaClient } from '@prisma/client';

export default function prisma() {
  return new PrismaClient();
}
