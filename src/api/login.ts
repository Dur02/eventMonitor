import request from './index'

export function login(
  {
    clientId = "e5cd7e4891bf95d1d19206ce24a7b32e",
    grantType = "password",
    tenantId = "000000",
    username,
    password,
    code,
    uuid,
    phonenumber = "",
    smsCode = "",
    email = "",
    emailCode = "",
    xcxCode = "",
    source = "",
    socialCode = "",
    socialState = "",
  }: {
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
) {
  return request({
    url: `/auth/login`,
    method: 'post',
    data: {
      clientId,
      grantType,
      tenantId,
      username,
      password,
      code,
      uuid,
      phonenumber,
      smsCode,
      email,
      emailCode,
      xcxCode,
      source,
      socialCode,
      socialState
    }
  })
}

export function getCode() {
  return request({
    url: `/auth/code`,
    method: 'get'
  })
}