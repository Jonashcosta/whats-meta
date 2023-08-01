/**
 *
 */

export interface SendPhone {
  idPhone: string;
  idWhatsAppBusiness?: string;
  areaCode?: string;
  phone?: string;
}

/**
 * font
 * https://developers.facebook.com/docs/whatsapp/cloud-api/webhooks/payload-examples
 */
export interface WebhookNotification {
  object: Object;
  entry: Entry[];
}

export interface Entry {
  id: number;
  changes: Change[];
  time?: number;
}

export interface Change {
  value: Value;
  field: string;
}

export interface Value {
  messaging_product?: MessagingProduct;
  metadata?: Metadata;
  contacts?: Contact[];
  messages?: Message[];
  decision?: string;
  business_id?: number;
  event?: string;
  previous_quality_score?: string;
  new_quality_score?: string;
  message_template_id?: number;
  message_template_name?: string;
  message_template_language?: MessageTemplateLanguage;
  reason?: null;
  display_phone_number?: string;
  requested_verified_name?: string;
  rejection_reason?: null;
  previous_category?: string;
  new_category?: string;
  statuses?: Status[];
  entity_type?: string;
  entity_id?: number;
  alert_severity?: string;
  alert_status?: string;
  alert_type?: string;
  alert_description?: string;
  phone_number?: string;
  campaign_id?: number;
  campaign_name?: string;
  old_status?: string;
  new_status?: string;
  paused_reasons?: string[];
  complete_reason?: null;
  current_limit?: string;
  max_daily_conversation_per_phone?: number;
  max_phone_numbers_per_business?: number;
  requester?: string;
}

export interface Contact {
  profile: Profile;
  wa_id: string;
}

export interface Profile {
  name: string;
}

export enum MessageTemplateLanguage {
  EnUS = 'en-US',
  PtBR = 'pt-BR',
}

export enum MessageTypes {
  TEXT = 'text',
  IMAGE = 'image',
  DOCUMENT = 'document',
  AUDIO = 'audio',
  VIDEO = 'video',
  STICKER = 'sticker',
}

export interface Message {
  context?: Context;
  from: string;
  id: string;
  timestamp: string;
  type: MessageTypes;
  interactive?: Interactive;
  image?: Audio;
  text?: Text;
  audio?: Audio;
}

export interface Audio {
  mime_type: string;
  sha256: string;
  id: string;
  voice?: boolean;
}

export interface Context {
  from: string;
  id: string;
}

export interface Interactive {
  type: string;
  list_reply: ListReply;
}

export interface ListReply {
  id: string;
  title: string;
  description: string;
}

export interface Text {
  body: string;
}

export enum MessagingProduct {
  Whatsapp = 'whatsapp',
}

export interface Metadata {
  display_phone_number: string;
  phone_number_id: string;
}

export interface Status {
  id: string;
  status: string;
  timestamp: string;
  recipient_id: string;
  conversation?: Conversation;
  pricing?: Pricing;
}

export interface Conversation {
  id: string;
  origin: Origin;
  expiration_timestamp?: string;
}

export interface Origin {
  type: string;
}

export interface Pricing {
  billable: boolean;
  pricing_model: string;
  category: string;
}

export enum Object {
  WhatsappBusinessAccount = 'whatsapp_business_account',
}

//**********************/
/**
 * send
 * https://developers.facebook.com/docs/whatsapp/cloud-api/reference/messages#text-messages
 */
// export interface WebhookSendMessages {
//   WebhookSendMessage: WebhookSendMessage[];
// }

// export interface WebhookSendMessage {
//   send: Send[];
// }

// export interface Send {
//   messaging_product: string;
//   recipient_type?: string;
//   to: string;
//   type: string;
//   text?: Text;
//   reaction?: Reaction;
//   image?: Image;
//   location?: Location;
//   contacts?: ContactSend[];
//   interactive?: Interactive;
//   context?: Context;
// }

// export interface Text {
//   preview_url: any;
//   body: string;
// }

// export interface Reaction {
//   message_id: string;
//   emoji: string;
// }

// export interface Image {
//   id: string;
//   link?: string;
// }

// export interface LocationSend {
//   longitude: string;
//   latitude: string;
//   name: string;
//   address: string;
// }

// export interface ContactSend {
//   addresses: Address[];
//   birthday: string;
//   emails: Email[];
//   name: Name;
//   org: Org;
//   phones: PhoneSend[];
//   urls: Url[];
// }

// export interface Address {
//   street: string;
//   city: string;
//   state: string;
//   zip: string;
//   country: string;
//   country_code: string;
//   type: string;
// }

// export interface Email {
//   email: string;
//   type: string;
// }

// export interface Name {
//   formatted_name: string;
//   first_name: string;
//   last_name: string;
//   middle_name: string;
//   suffix: string;
//   prefix: string;
// }

// export interface Org {
//   company: string;
//   department: string;
//   title: string;
// }

// export interface PhoneSend {
//   phone: string;
//   type: string;
//   wa_id?: string;
// }

// export interface Url {
//   url: string;
//   type: string;
// }

// export interface Interactive {
//   type: string;
//   body: Body;
//   action: Action;
//   header?: Header;
//   footer?: Footer;
// }

// export interface Body {
//   text: string;
// }

// export interface Action {
//   name?: string;
//   parameters: any;
//   buttons?: Button[];
//   button?: string;
//   sections?: Section[];
// }

// export interface Button {
//   type: string;
//   reply: Reply;
// }

// export interface Reply {
//   id: string;
//   title: string;
// }

// export interface Section {
//   title: string;
//   rows: Row[];
// }

// export interface Row {
//   id: string;
//   title: string;
//   description: string;
// }

// export interface Header {
//   type: string;
//   text: string;
// }

// export interface Footer {
//   text: string;
// }

// export interface Context {
//   message_id: string;
// }

// // /**
// //  *
// //  * response
// //  *
// //  */

// export interface ReceiveSucess {
//   messaging_product: string;
//   contacts: ContactReceive[];
//   messages: MessageReceive[];
// }

// export interface ContactReceive {
//   input: string;
//   wa_id: string;
// }

// export interface MessageReceive {
//   id: string;
// }

// export interface WebhookResponse {
//   messaging_product: string;
//   contacts: ContactResponse[];
//   messages: MessageResponse[];
// }

// export interface ContactResponse {
//   input: string;
//   wa_id: string;
// }

// export interface MessageResponse {
//   id: string;
// }

// export interface WebhookResponseError {
//   error: ErrorResponse;
// }

// export interface ErrorResponse {
//   message: string;
//   type: string;
//   code: number;
//   error_data: ErrorDataResponse;
//   fbtrace_id: string;
// }

// export interface ErrorDataResponse {
//   messaging_product: string;
//   details: string;
// }
