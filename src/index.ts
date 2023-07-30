import express, { Request, Response } from 'express';
import bodyParser from 'body-parser';
import { PrismaClient } from '@prisma/client';

import router from './routers';

const app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use('/v1.0', router);

app.listen(3000, () => {
  console.log('server start 3000');
});
