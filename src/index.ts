import express, { Request, Response } from "express";
import bodyParser from "body-parser";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
async function main() {}

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.get("/webhooks", (req: Request, res: Response) => {
  //   const body = req.body;
  //   console.log(body);
  //   const param = req.params;
  //   console.log(param);
  const token =
    "EAAHN7BWTLLkBOZB3XMYYdxKYk2xEZAE375FLADaZCvjnji9VHpqTZBNKFZCR2RXCxqLVvkNdneBi2CuCOLuG5oFHfnovC3Tb4toVRI0MSFHNtt38kQiZAwn8hZACQnXy3y3AZAE5sMusLCJheQhJ5jCtjQG7zMhZA3wdGNXxMmFK8jeAAAegwWmbkGGqb4CzlKiavTva0sDMtTmVYwMPz";
  const query = req.query;
  const a = { ...query };
  console.log("a", Object.keys(query));
  console.log("a", Object.values(query));
  console.log("b", Object.keys(query)[1]);
  console.log("b", Object.values(query)[1]);

  //const { mode, challenge, verify_token } = query;
  //console.log(mode, challenge, verify_token);
  console.log(query);
  return res.status(200).json("ola mundo");
});
app.get("/api/webhook", (req: Request, res: Response) => {
  //   const body = req.body;
  //   console.log(body);
  //   const param = req.params;
  //   console.log(param);
  const token =
    "EAAHN7BWTLLkBOZB3XMYYdxKYk2xEZAE375FLADaZCvjnji9VHpqTZBNKFZCR2RXCxqLVvkNdneBi2CuCOLuG5oFHfnovC3Tb4toVRI0MSFHNtt38kQiZAwn8hZACQnXy3y3AZAE5sMusLCJheQhJ5jCtjQG7zMhZA3wdGNXxMmFK8jeAAAegwWmbkGGqb4CzlKiavTva0sDMtTmVYwMPz";
  const query = req.query;
  const a = { ...query };
  console.log("a", Object.keys(query));
  console.log("a", Object.values(query));
  console.log("b", Object.keys(query)[1]);
  console.log("b", Object.values(query)[1]);

  return res.status(200).json(Object.values(query)[1]);
});

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });

app.listen(3000, () => {
  console.log("server start 3000");
});
