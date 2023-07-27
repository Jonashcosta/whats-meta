import express, { Request, Response } from "express";

const app = express();
app.get("/webhooks", (req: Request, res: Response) => {
  //   const body = req.body;
  //   console.log(body);
  //   const param = req.params;
  //   console.log(param);
  const query = req.query;

  //const { mode, challenge, verify_token } = query;
  //console.log(mode, challenge, verify_token);
  console.log(query);
  return res.status(200).json("ola mundo");
});

app.listen(3000, () => {
  console.log("server start 3000");
});
