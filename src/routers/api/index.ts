import { Request, Response, Router } from 'express';
import webhook from './webhooks';

const api = Router();
api.use('/webhooks', webhook);
api.get('/', (req: Request, res: Response) => {
  return res.send('api home');
});

export default api;
