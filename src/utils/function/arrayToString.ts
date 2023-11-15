import { join } from 'lodash/fp'

export const joinArray = (target: Array<number | string>): string => {
  return join(',')(target)
}