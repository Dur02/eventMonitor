import renderIcon from '@/utils/function/renderIcon'
import { LogOutOutline, Pencil } from '@vicons/ionicons5'

export const options = [
  {
    label: '修改密码',
    key: 'changePassword',
    icon: renderIcon(Pencil)
  },
  {
    label: '退出登录',
    key: 'logout',
    icon: renderIcon(LogOutOutline)
  }
]