export type NewsSearchValueType = {
  publicTime: [number, number] | null,
  orderBy: 'DESC' | 'ASC',
  type: 0 | 1 | 2,
  isExact: 0 | 1,
  queryContent: string
}