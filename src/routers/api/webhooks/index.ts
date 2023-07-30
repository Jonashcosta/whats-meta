/**
 * endereco ip dos servidores
 * whois -h whois.radb.net — '-i origin AS32934' | grep ^route | awk '{print $2}' | sort
 */
import { Request, Response, Router } from 'express';
import { WebhookNotification } from './types';

const webhook = Router();

webhook.get('/', (req: Request, res: Response) => {
  const mode = req.query['hub.mode'];
  const verify_token = req.query['hub.verify_token'];
  const challenge = req.query['hub.challenge'];

  const token = process.env.VERIFY_TOKEN;
  if (mode == 'subscribe' && verify_token == token) {
    res.send(challenge);
  } else {
    res.sendStatus(400);
  }
});

/**
 * mensagens tipo
 *
 * account_alerts
 * account_review_update
 * account_update
 * business_capability_update
 * business_status_update
 * campaign_status_update
 * account_review_update
 * campaign_status_update
 * message_template_quality_update
 * message_template_status_update
 * messages                                            in process
 * phone_number_name_update
 * phone_number_quality_update
 * security
 * template_category_update
 */

webhook.post('/', async (req: Request, res: Response) => {
  console.log();
  const body: WebhookNotification = await req.body;

  //  console.log(Object.getOwnPropertyNames(body.entry[0]) + '\n');
  if (body.entry[0]) {
    if (body.entry[0].changes) {
      if (body.entry[0].changes[0].field)
        if (body.entry[0].changes[0].field === 'messages') {
          // message process
        } else {
          console.log('Error ', 'WebhookNotification::entry::changes::field');
        }
    } else {
      console.log('Error ', 'WebhookNotification::entry::changes');
    }
  } else {
    console.log('Error ', 'WebhookNotification::entry');
  }
  if (body.entry[0].changes[0].field === 'message_template_status_update') {
    console.log(
      'message_template_status_update',
      '***************************'
    );
  }
});

export default webhook;
