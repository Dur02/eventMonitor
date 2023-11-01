export type LoginData = {
  clientId?: string,
  grantType?: string,
  tenantId?: string,
  username: string,
  password: string,
  code: string,
  uuid: string,
  phonenumber?: string,
  smsCode?: string,
  email?: string,
  emailCode?: string,
  xcxCode?: string,
  source?: string,
  socialCode?: string,
  socialState?: string,
}

export type LoginResult = {
  access_token: string;
}