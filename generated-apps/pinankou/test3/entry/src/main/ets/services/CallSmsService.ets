export function callPhone(phone: string): void {
  if (!phone) return;
  try {
    // @ohos.telephony.call is not universally available across SDK versions.
    // This is a stub with a console fallback; real integration uses @kit.TelephonyKit.
    console.info(`[CallSmsService] dial ${phone}`);
  } catch (e) {
    console.error(`[CallSmsService] call failed ${JSON.stringify(e)}`);
  }
}

export function sendSms(phone: string): void {
  if (!phone) return;
  try {
    console.info(`[CallSmsService] sms ${phone}`);
  } catch (e) {
    console.error(`[CallSmsService] sms failed ${JSON.stringify(e)}`);
  }
}
