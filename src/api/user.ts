import request from './index'
import type { LoginData, LoginResult } from '@/types/api/user/types'
import type { AxiosPromise } from 'axios'

// 登录
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
  }: LoginData
): AxiosPromise<LoginResult> {
  return request({
    url: `/auth/login`,
    headers: {
      isToken: false
    },
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

// 获取验证码
export function getCode() {
  return request({
    url: `/auth/code`,
    headers: {
      isToken: false
    },
    method: 'get'
  })
}

// 注销
export function logout() {
  return request({
    url: '/auth/logout',
    method: 'post'
  })
}

// 获取用户信息
export function getUserInfo() {
  return request({
    url: `/system/user/getInfo`,
    method: 'get'
  })
}