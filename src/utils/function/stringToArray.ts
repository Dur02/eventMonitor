import { split } from 'lodash/fp'

export const splitString = (param: string | null) => param ? split(',')(param) : null