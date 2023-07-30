import { Request, Response, Router } from 'express';

import api from './api';

const router = Router();
router.use('/api', api);
router.get('/', (req: Request, res: Response) => {
  return res.send('router home');
});
export default router;
